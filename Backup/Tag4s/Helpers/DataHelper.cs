using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tag4s.Data;
using System.Globalization;

namespace Tag4s.Helpers
{
    /// <summary>
    /// 
    /// </summary>
    public static class DataHelper
    {
        public static DateTime? ParseDate(string value)
        {
            CultureInfo dutchCulture = new CultureInfo("nl-NL");
            if (String.IsNullOrEmpty(value) || String.IsNullOrWhiteSpace(value))
                return null;
            try
            {
                DateTime result;
                bool succes = DateTime.TryParse(value, dutchCulture, DateTimeStyles.None, out result);
                if (succes)
                    return result;
                else
                    return null;
            }
            catch
            {
                return null;
            }
        }

        public static void ParseTime(string value, out int? hour, out int? minute)
        {
            //We need to add the current Date 
            CultureInfo dutchCulture = new CultureInfo("nl-NL");
            if (String.IsNullOrEmpty(value) || String.IsNullOrWhiteSpace(value))
            {
                hour = null;
                minute = null;
            }
            else
            {
                DateTime result;
                bool succes = DateTime.TryParse(DateTime.Now.ToString("dd-MM-yyyy") + " " + value + ":00", dutchCulture, DateTimeStyles.None, out result);
                if (succes)
                {
                    hour = result.Hour;
                    minute = result.Minute;
                }
                else
                {
                    hour = null;
                    minute = null;
                }
            }
        }

        public static List<SelectListItem> WeekDays(int id, ref Dictionary<string, string> translationdictionary)
        {
            List<SelectListItem> list = new List<SelectListItem>();
            for (int i = 1; i < 10; i++)
            {
                SelectListItem item = new SelectListItem
                {
                    Value = i.ToString(),
                    Selected = i == id
                };
                switch (i)
                {
                    case 1:
                        item.Text = "Monday".TranslateString(ref translationdictionary);
                        break;
                    case 2:
                        item.Text = "Tuesday".TranslateString(ref translationdictionary);
                        break;
                    case 3:
                        item.Text = "Wednesday".TranslateString(ref translationdictionary);
                        break;
                    case 4:
                        item.Text = "Thursday".TranslateString(ref translationdictionary);
                        break;
                    case 5:
                        item.Text = "Friday".TranslateString(ref translationdictionary);
                        break;
                    case 6:
                        item.Text = "Saturday".TranslateString(ref translationdictionary);
                        break;
                    case 7:
                        item.Text = "Sunday".TranslateString(ref translationdictionary);
                        break;
                    case 8:
                        item.Text = "Work days".TranslateString(ref translationdictionary);
                        break;
                    case 9:
                        item.Text = "Weekend".TranslateString(ref translationdictionary);
                        break;
                }
                list.Add(item);
            }
            return list;
        }

        public static IEnumerable<Weekday> WeekDays(ref Dictionary<string, string> translationdictionary)
        {
            using (var te = new Tag4sEntities())
            {
                var weekdays = te.Weekdays.Where(c => c.Id != null).ToList();
                foreach (var weekday in weekdays)
                {
                    weekday.Name = weekday.Name.TranslateString(ref translationdictionary);
                }
                return weekdays.ToList();
            }
        }

        public static List<SelectListItem> Contracts(Guid? id)
        {
            using (var te = new Tag4sEntities())
            {
                var contracts = te.Contracts.Where(c => c.Id != null);
                List<SelectListItem> list = new List<SelectListItem>();
                foreach (var contract in contracts)
                {
                    bool selected = false;
                    if (id.HasValue)
                        selected = id.Value == contract.Id;
                    SelectListItem newItem = new SelectListItem
                        {
                            Selected = selected,
                            Text = contract.Name,
                            Value = contract.Id.ToString()
                        };
                    list.Add(newItem);
                }

                return list;
            }
        }

        public static List<SelectListItem> UserRoles(Guid id)
        {

            using (var te = new Tag4sEntities())
            {
                var userRoles = te.UserRoles.Where(u => u.Id != null);
                List<SelectListItem> list = new List<SelectListItem>();
                foreach (var userRole in userRoles)
                {
                    SelectListItem newItem = new SelectListItem
                        {
                            Selected = userRole.Id == id,
                            Text = userRole.Name,
                            Value = userRole.Id.ToString()
                        };
                    list.Add(newItem);
                }


                return list;
            }
        }

        public static IEnumerable<Contract> Contracts1()
        {

            using (var te = new Tag4sEntities())
            {
                var contracts = te.Contracts.Where(c => c.Id != null);
                return contracts.ToList();
            }
        }

        public static IEnumerable<UserRole> UserRoles(bool isBeheerder, User user = null)
        {
            using (var te = new Tag4sEntities())
            {
                IEnumerable<UserRole> result;

                if (user != null)
                {
                    if (user.UserRole.Name == "Klant")
                    {
                        result = te.UserRoles.Where(u => u.Name.Equals("Klant")).ToList();
                        return result;
                    }

                    if (user.UserRole.Name == "Reseller")
                    {
                        result = te.UserRoles.Where(u => u.Name.Equals("Klant")).ToList();
                        return result;
                    }
                }

                if (isBeheerder)
                    result = te.UserRoles.Where(u => u.Name.Equals("Beheerder")).ToList();
                else
                    result = te.UserRoles.Where(u => !u.Name.Equals("Beheerder")).ToList();
                //te.Connection.Close();
                return result;
            }
        }

        public static IEnumerable<User> Resellers(bool isBeheerder, User user = null)
        {
            using (var te = new Tag4sEntities())
            {
                //te.Connection.Open();
                IEnumerable<User> result;

                if (user != null)
                {
                    if (user.UserRole.Name == "Klant")
                    {
                        result = te.Users.Where(u => u.Id == user.ReselerId).ToList();
                        return result;
                    }

                    if (user.UserRole.Name == "Reseller")
                    {
                        result = te.Users.Where(u => u.Id == user.ReselerId).ToList();
                        return result;
                    }
                }


                if (isBeheerder)
                    result = te.Users.Where(u => u.Id == null).ToList();
                else
                    result = te.Users.Where(u => u.UserRole.Name.Equals("Beheerder") || u.UserRole.Name.Equals("Reseller")).ToList();
                return result;
            }
        }
    }
}