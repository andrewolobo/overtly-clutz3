using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tag4s.Data;

namespace Tag4s.Helpers
{
    /// <summary>
    /// 
    /// </summary>
    public static class RuleEngine
    {
        /// <summary>
        /// 
        /// </summary>
        public static string ActionForbidden = "Forbidden";
        /// <summary>
        /// 
        /// </summary>
        public static string ActionNoLongerAvailable = "NotAvailable";

        /// <summary>
        /// 
        /// </summary>
        /// <param name="uri"></param>
        /// <param name="browser"></param>
        public static UserContractRedirect ValidateUri(UserContractUri uri, HttpBrowserCapabilitiesBase browser)
        {
            if (uri == null) return null;

            if (uri.UserContractRedirects == null)
            {
                uri.RuleActive = false;
            }

            if (uri.UserContractRedirects != null)
                foreach (var redirect in uri.UserContractRedirects)
                {
                    if (redirect.Enabled == true)
                    {
                        redirect.RuleActive = ValidateRedirect(redirect, browser);
                        if (redirect.RuleActive && !uri.RuleActive)
                        {
                            uri.CalculatedUri = uri.Uri;
                            uri.RuleActive = true;

                            //now check the randomizer
                            ValidateRandomizer(uri);
                        }
                    }
                    else
                        redirect.RuleActive = false;
                }

            return null;
        }

        private static void ValidateRandomizer(UserContractUri redirect)
        {
            if (redirect.RandomFunction == 0) return;

            if (redirect.RandomUris.Count == 0) return;

            //%x;  x percent of clicks will have a different url
            if (redirect.RandomFunction == 1)
            {
                var total = redirect.UserContractLogs.Count;

                if (total == 0)
                {
                    redirect.CalculatedUri = redirect.Uri;
                    return;

                }

                //get the standard urls
                var standard = redirect.UserContractLogs.Count(row => row.ResultUri == redirect.Uri);

                var custom = redirect.RandomUris.FirstOrDefault();
                if (custom != null)
                {
                    var percent = custom.RandomParameter;

                    redirect.CalculatedUri = standard/(decimal)total*100 > percent ? custom.Uri : redirect.Uri;
                }
            }

            //1/x; 1 in x clicks will have a different url
            if (redirect.RandomFunction == 2)
            {
                var total = redirect.UserContractLogs.Count;

                if (total == 0)
                {
                    redirect.CalculatedUri = redirect.Uri;
                    return;

                }

                var custom = redirect.RandomUris.FirstOrDefault();
                if (custom != null)
                {
                    var click = Convert.ToInt16(custom.RandomParameter);

                    if (click == 0) return;
                    var logs = redirect.UserContractLogs.OrderByDescending(row => row.DateTime).Take(click);
                    redirect.CalculatedUri = logs.All(row => row.ResultUri != custom.Uri) ? custom.Uri : redirect.Uri;
                }

            }

            //a1.x1, a2.x2, a3.x3… where x1+x2+x3=x total number of clicks and a1, a2, a3… ratios for each x1, x2, x3…. In human language there are weights given to a set of urls. 
            if (redirect.RandomFunction == 3)
            {
                var total = redirect.UserContractLogs.Count;

                if (total == 0)//take a first RandomUri
                {
                    var custom = redirect.RandomUris.FirstOrDefault();
                    if (custom != null)
                    {
                        redirect.CalculatedUri = custom.Uri;
                        return;
                    }
                }

                var customs = redirect.RandomUris;
                var allWeights = redirect.RandomUris.Sum(row => row.RandomParameter);

                if (allWeights == 0) return;

                var standardDistance = (decimal)0;//used to see that the weighting is also random made, with other words pick some uri if the distance of the last Uri is closer
                foreach (var custom in customs)
                {
                    var weight = custom.RandomParameter/allWeights;//this is to normalize the weight. a1=10, a2=50, a3=40 => na1=10/100, na2=50/100, na3=40/100

                    if (weight == 0) continue;

                    var count = redirect.UserContractLogs.Count(row => row.ResultUri == custom.Uri);// get the number of occurences for this Uri.

                    if (count/(decimal) total <= weight) //is this a candidate?
                    {
                        var customDistance = Math.Abs(count/(decimal) total - weight);
                        if (standardDistance <= customDistance)
                            //it means the calculated distance is high, we should promote this one
                        {
                            standardDistance = customDistance;//write it down, so we may know it has been a distance used.
                            redirect.CalculatedUri = custom.Uri;
                        }
                    }
                }

            }


            if (redirect.RandomFunction == 4)
            {
                var custom = redirect.RandomUris.OrderBy(row => Guid.NewGuid()).FirstOrDefault();
                if (custom != null)
                {
                    redirect.CalculatedUri = custom.Uri;
                }
            }

        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="redirect"></param>
        /// <param name="browser"></param>
        /// <returns></returns>
        public static bool ValidateRedirect(UserContractRedirect redirect, HttpBrowserCapabilitiesBase browser)
        {
            //var now = DateTime.Now;

            //Als er een periode is opgegeven dan deze als eerste
            var ruleActive = ValidateDatePeriode(redirect.DateTimeValueStart, redirect.DateTimeValueStop);
            if (!ruleActive)
                return false;

            //Als er een dag van de week is opgegeven deze dan als 2e
            ruleActive = ValidateDayOfTheWeek(redirect.DayOfTheWeekValue);
            if (!ruleActive)
                return false;

            //Is er een tijdsbestek opgegeven?
            ruleActive = ValidateTimePeriod(redirect.BeginTime, redirect.EndTime);
            if (!ruleActive)
                return false;

            ruleActive = ValidateRuleParameters(redirect);
            if (!ruleActive)
                return false;

            ruleActive = ValidateRedirectTypes(redirect, browser);
            if (!ruleActive)
                return false;


            //Is er een teller opgegeven?
            ruleActive = ValidateCounter(redirect.Counter, redirect);

            return ruleActive;
        }

        private static bool ValidateRedirectTypes(UserContractRedirect redirect, HttpBrowserCapabilitiesBase browser)
        {
            if (redirect.RedirectTypeValues.Count == 0) return true;

            foreach (var redirectTypeValue in redirect.RedirectTypeValues)
            {
                var name = redirectTypeValue.RedirectType.Name;
                var browserProperty = browser.GetType().GetProperty(name);
                if (browserProperty != null)
                {
                    var broserValue = browserProperty.GetValue(browser, null);
                    if (broserValue != null)
                    {
                        var stringValue = broserValue.ToString();
                        var value = redirectTypeValue.Name;
                        if (value != stringValue)
                        {
                            return false;
                        }
                    }
                }

            }
            return true;
        }

        private static bool ValidateRuleParameters(UserContractRedirect redirect)
        {
            if (redirect.RuleParameterValues.Count == 0) return true;

            //all values need to be active 
            if (redirect.RuleParameterValues.Any(ruleParameterValue => !ruleParameterValue.IsActive))
            {
                return false;
            }

            return true;
        }

        private static bool ValidateCounter(int? counter, UserContractRedirect redirect)
        {
            //This one is complex we need to look into the log and check based on the contractUri Id how many time the rule has been activated within the other parameters of the ruleset.
            int existingCount = 0;
            //If no counter has been defined return directly
            if (!counter.HasValue)
                return true;

            if (redirect.UserContractLogs == null)
                return true;

            if (redirect.UserContractLogs.Count == 0)
                return true;

            //Get all apprioriate logrecords to determin the count and we know that the count is bigger than 0 because of the previous lines
            var counterLog = redirect.UserContractLogs.Where(l => l.Id != Guid.Empty);

            //Regardless of the additional rules, if the UserContractLogs already is null we can continue true
            
            //Limit if applicable by a DatePeriode
            counterLog = ExtendCounterWithDatePeriode(redirect.DateTimeValueStart, redirect.DateTimeValueStop, counterLog);
            if(!counterLog.Any())
            return true;

            //Limit if applicable by weekdays;
            counterLog = ExtendCounterWithWeekdDays(redirect.DayOfTheWeekValue, counterLog);
            if (!counterLog.Any())
                return (existingCount <= counter.Value);

            //Limit if applicable by TimePeriode;
            counterLog = ExtendCounterWithTimePeriode(redirect.BeginTime, redirect.EndTime, counterLog);
            if (!counterLog.Any())
                return (existingCount <= counter.Value);

            //Now we can read the count and compare it with the maxCounter
            existingCount = counterLog.Count();
            return (existingCount <= counter.Value);
        }

        private static IEnumerable<UserContractLog> ExtendCounterWithTimePeriode(DateTime? beginTime, DateTime? endTime, IEnumerable<UserContractLog> counterLog)
        {
            if (!beginTime.HasValue && !endTime.HasValue)
                return counterLog;

            if (beginTime.HasValue && endTime.HasValue)
            {
                var beginMinute = (beginTime.Value.Hour * 60) + beginTime.Value.Minute;
                var endMinute = (endTime.Value.Hour * 60) + endTime.Value.Minute;
                return counterLog.Where(c => ((c.DateTime.Hour * 60) + c.DateTime.Minute) >= beginMinute && ((c.DateTime.Hour * 60) + c.DateTime.Minute) <= endMinute);
            }
            if (beginTime.HasValue && !endTime.HasValue)
            {
                int beginMinute = (beginTime.Value.Hour * 60) + beginTime.Value.Minute;
                return counterLog.Where(c => ((c.DateTime.Hour * 60) + c.DateTime.Minute) >= beginMinute);
            }
            if (!beginTime.HasValue && endTime.HasValue)
            {
                int beginMinute = (beginTime.Value.Hour * 60) + beginTime.Value.Minute;
                int endMinute = (endTime.Value.Hour * 60) + endTime.Value.Minute;
                return counterLog.Where(c => ((c.DateTime.Hour * 60) + c.DateTime.Minute) <= endMinute);
            }
            return counterLog;
        }

        private static IEnumerable<UserContractLog> ExtendCounterWithWeekdDays(int? weekday, IEnumerable<UserContractLog> counterLog)
        {
            if (!weekday.HasValue)
                return counterLog;
            switch (weekday.Value)
            {
                case 1:
                    return counterLog.Where(c => c.DateTime.DayOfWeek == DayOfWeek.Monday);
                case 2:
                    return counterLog.Where(c => c.DateTime.DayOfWeek == DayOfWeek.Tuesday);
                case 3:
                    return counterLog.Where(c => c.DateTime.DayOfWeek == DayOfWeek.Wednesday);
                case 4:
                    return counterLog.Where(c => c.DateTime.DayOfWeek == DayOfWeek.Thursday);
                case 5:
                    return counterLog.Where(c => c.DateTime.DayOfWeek == DayOfWeek.Friday);
                case 6:
                    return counterLog.Where(c => c.DateTime.DayOfWeek == DayOfWeek.Saturday);
                case 7:
                    return counterLog.Where(c => c.DateTime.DayOfWeek == DayOfWeek.Sunday);
                case 8: //Weekdays
                    return counterLog.Where(c => c.DateTime.DayOfWeek == DayOfWeek.Monday ||
                                                 c.DateTime.DayOfWeek == DayOfWeek.Tuesday ||
                                                 c.DateTime.DayOfWeek == DayOfWeek.Wednesday ||
                                                 c.DateTime.DayOfWeek == DayOfWeek.Thursday ||
                                                 c.DateTime.DayOfWeek == DayOfWeek.Friday);
                case 9:
                    return counterLog.Where(c => c.DateTime.DayOfWeek == DayOfWeek.Saturday ||
                                                 c.DateTime.DayOfWeek == DayOfWeek.Sunday);
            }
            return counterLog;

        }

        private static IEnumerable<UserContractLog> ExtendCounterWithDatePeriode(DateTime? beginDate, DateTime? endDate, IEnumerable<UserContractLog> counterLog)
        {
            if (!beginDate.HasValue && !endDate.HasValue)
                return counterLog;
            if (beginDate.HasValue && endDate.HasValue)
                return counterLog.Where(c => c.DateTime >= beginDate.Value && c.DateTime <= endDate.Value);
            if (beginDate.HasValue && !endDate.HasValue)
                return counterLog.Where(c => c.DateTime >= beginDate.Value);
            if (!beginDate.HasValue && endDate.HasValue)
                return counterLog.Where(c => c.DateTime <= endDate.Value);
            return counterLog;
        }

        private static bool ValidateTimePeriod(DateTime? beginTime, DateTime? endTime)
        {
            var ruleActive = true;
            var currentHour = DateTime.Now;
            var currentMinute = (currentHour.Hour * 60) + currentHour.Minute;
            if (beginTime.HasValue && endTime.HasValue)
            {
                var beginMinute = (beginTime.Value.Hour * 60) + beginTime.Value.Minute;
                var endMinute = (endTime.Value.Hour * 60) + endTime.Value.Minute;
                //Time needs to be in between
                ruleActive = (currentMinute >= beginMinute && currentMinute <= endMinute);
            }
            if (beginTime.HasValue && !endTime.HasValue)
            {
                //Time needs to be > beginTime
                var beginMinute = (beginTime.Value.Hour * 60) + beginTime.Value.Minute;
                ruleActive = (currentMinute >= beginMinute);

            }
            if (!beginTime.HasValue && endTime.HasValue)
            {
                //Time needs to be < endTime
                var endMinute = (endTime.Value.Hour * 60) + endTime.Value.Minute;
                ruleActive = (currentMinute <= endMinute);
            }
            return ruleActive;
        }

        private static bool ValidateDayOfTheWeek(int? dayOfTheWeek)
        {
            var ruleActive = true;

            if (dayOfTheWeek.HasValue)
            {
                switch (DateTime.Now.DayOfWeek)
                {
                    case DayOfWeek.Friday:
                        ruleActive = (dayOfTheWeek.Value == 5 || dayOfTheWeek.Value == 8);
                        break;
                    case DayOfWeek.Monday:
                        ruleActive = (dayOfTheWeek.Value == 1 || dayOfTheWeek.Value == 8);
                        break;
                    case DayOfWeek.Saturday:
                        ruleActive = (dayOfTheWeek.Value == 6 || dayOfTheWeek.Value == 9);
                        break;
                    case DayOfWeek.Sunday:
                        ruleActive = (dayOfTheWeek.Value == 7 || dayOfTheWeek.Value == 9);
                        break;
                    case DayOfWeek.Thursday:
                        ruleActive = (dayOfTheWeek.Value == 4 || dayOfTheWeek.Value == 8);
                        break;
                    case DayOfWeek.Tuesday:
                        ruleActive = (dayOfTheWeek.Value == 2 || dayOfTheWeek.Value == 8);
                        break;
                    case DayOfWeek.Wednesday:
                        ruleActive = (dayOfTheWeek.Value == 3 || dayOfTheWeek.Value == 8);
                        break;
                }
            }
            return ruleActive;
        }

        private static bool ValidateDatePeriode(DateTime? begin, DateTime? end)
        {
            var now = DateTime.Now;
            var ruleActive = true;
            //Als er een periode is opgegeven dan deze als eerste
            if (begin.HasValue && end.HasValue)
            {
                ruleActive = (now >= begin.Value && now <= end.Value);
            }
            if (begin.HasValue && !end.HasValue)
            {
                ruleActive = (now >= begin.Value);
            }
            if (!begin.HasValue && end.HasValue)
            {
                ruleActive = (now <= end.Value);
            }
            return ruleActive;
        }



    }
}