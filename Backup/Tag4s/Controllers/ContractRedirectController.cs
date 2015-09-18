using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Tag4s.Data;
using Tag4s.Helpers;
using Tag4s.Models;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Data.Objects;
using SelectListItem = System.Web.WebPages.Html.SelectListItem;

namespace Tag4s.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    //[KlantAuthorizeAttribute]
    public class ContractRedirectController : BaseController
    {

        //
        // GET: /ContractRedirect/Edit/5
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <param name="contractUriId"></param>
        /// <returns></returns>
        public ActionResult Edit(Guid id, Guid contractUriId)
        {
            ViewData["selectedTab"] = 0;


            var model = new UserContractRedirectModel();

            //get parameters with possible values
            var parameters = db.RuleParameters.Select(row => new ContractRedirectParameterModel { RuleParameter = row }).ToList();
            model.ParameterModel = parameters;
            foreach (var parameter in model.ParameterModel)
            {
                var list =
                    db.RuleParameterValues.Where(row => row.RuleParameterId == parameter.RuleParameter.Id)
                      .ToList()
                      .Select(row => new SelectListItem {Text = row.Name, Value = row.Id.ToString()}).ToList();
                list.Insert(0, new SelectListItem {Selected = true, Text = "...", Value = Guid.Empty.ToString()});
                parameter.RuleParameterValues = list;
            }

            var redirects = db.RedirectTypes.Select(row => new ContractRedirectRedirectTypeModel { RedirectType = row }).ToList();
            model.RedirectTypeModel = redirects;
            foreach (var redirect in model.RedirectTypeModel)
            {
                var list =
                    db.RedirectTypeValues.Where(row => row.RedirectTypeId == redirect.RedirectType.Id)
                      .ToList()
                      .Select(row => new SelectListItem { Text = row.Name, Value = row.Id.ToString() }).ToList();
                list.Insert(0, new SelectListItem { Selected = true, Text = "...", Value = Guid.Empty.ToString() });
                redirect.RedirectTypeValues = list;
            }

            if (id != Guid.Empty)
            {
                model.UserContractRedirect = db.UserContractRedirects.FirstOrDefault(c => c.Id == id);
                if (model.UserContractRedirect != null)
                {
                    //get the selectedvalues
                    foreach (var ruleParameterValue in model.UserContractRedirect.RuleParameterValues)
                    {
                        var parameter =
                            model.ParameterModel.FirstOrDefault(
                                row => row.RuleParameter.Id == ruleParameterValue.RuleParameterId);
                        if (parameter != null)
                        {
                            parameter.SelectedValue = ruleParameterValue;
                            var singleOrDefault = parameter.RuleParameterValues.SingleOrDefault(row => row.Value == parameter.SelectedValue.Id.ToString());
                            if (singleOrDefault != null)
                                singleOrDefault.Selected = true;
                        }
                    }


                    //get the selectedvalues
                    foreach (var redirectTypeValue in model.UserContractRedirect.RedirectTypeValues)
                    {
                        var redirect =
                            model.RedirectTypeModel.FirstOrDefault(
                                row => row.RedirectType.Id == redirectTypeValue.RedirectTypeId);
                        if (redirect != null)
                        {
                            redirect.SelectedValue = redirectTypeValue;
                            var singleOrDefault = redirect.RedirectTypeValues.SingleOrDefault(row => row.Value == redirect.SelectedValue.Id.ToString());
                            if (singleOrDefault != null)
                                singleOrDefault.Selected = true;
                        }
                    }

                }
            }
            else
            {
                var contractUri = db.UserContractUris.FirstOrDefault(u => u.Id == contractUriId);
                model.UserContractRedirect = new UserContractRedirect();
                model.UserContractRedirect.UserContractUri1 = contractUri;
                model.UserContractRedirect.Enabled = true;
            }
            return View(model);
        }

        //
        // POST: /ContractRedirect/Edit/5

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <param name="contractUriId"></param>
        /// <param name="collection"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Edit(Guid id, Guid contractUriId, UserContractRedirectModel returnModel, FormCollection collection)
        {
            //Save Action
            //If id == null then insert
            try
            {
                ViewData["selectedTab"] = int.Parse(collection.GetValue("selectedTab").AttemptedValue);
                collection.Remove("selectedTab");
                bool addNewUserContractRedirect = false;
                if (id == Guid.Empty)
                    addNewUserContractRedirect = true;

                if (!addNewUserContractRedirect)
                {
                    var model = db.UserContractRedirects.FirstOrDefault(u => u.Id == id);
                    //model.Enabled = returnModel.UserContractRedirect.Enabled;
                    //model.Name = returnModel.UserContractRedirect.Name;
                    model.Enabled = returnModel.UserContractRedirect.Actief;
                    model.Name = returnModel.UserContractRedirect.Name;

                    //From Date
                    if (collection.GetValue("UserContractRedirect.StartDatumActive").AttemptedValue.Contains("true"))
                    {
                        //We need to take the value of the date picker and store it in the model
                        
                            model.DateTimeValueStart = returnModel.UserContractRedirect.DateTimeValueStart;
                    }
                    else
                        model.DateTimeValueStart = null;
                    //To Date
                    if (collection.GetValue("UserContractRedirect.StopDatumActive").AttemptedValue.Contains("true"))
                    {
                        model.DateTimeValueStop = returnModel.UserContractRedirect.DateTimeValueStop;
                    }
                    else
                        model.DateTimeValueStop = null;

                    //Weekday
                    if (collection.GetValue("UserContractRedirect.WeekdayActive").AttemptedValue.Contains("true"))
                    {
                        string weekdayValue = collection.GetValue("ddlWeekday").AttemptedValue;
                        if (!String.IsNullOrEmpty(weekdayValue) && !String.IsNullOrWhiteSpace(weekdayValue))
                        {
                            int day = int.Parse(weekdayValue);
                            if (day > 0 && day < 10)
                                model.DayOfTheWeekValue = day;
                            else
                                model.DayOfTheWeekValue = null;
                        }
                    }
                    else
                        model.DayOfTheWeekValue = null;

                    //Between from
                    if (collection.GetValue("UserContractRedirect.BeginTimeActive").AttemptedValue.Contains("true"))
                    {
                        model.BeginTime = returnModel.UserContractRedirect.BeginTime;
                    }
                    else
                        model.BeginTime = null;

                    //Between To
                    if (collection.GetValue("UserContractRedirect.EndTimeActive").AttemptedValue.Contains("true"))
                    {
                        model.EndTime = returnModel.UserContractRedirect.EndTime;
                    }
                    else
                        model.EndTime = null;

                    //Update
                    var ruleValues = model.RuleParameterValues.ToList();
                    foreach (var ruleValue in ruleValues)
                    {
                        model.RuleParameterValues.Remove(ruleValue);
                    }
                    foreach (var parameter in returnModel.ParameterModel)
                    {
                        if (parameter.SelectedValue != null)
                        {
                            var guid = parameter.SelectedValue.Id;

                            var selectedValue = db.RuleParameterValues.SingleOrDefault(row => row.Id == guid);
                            if (selectedValue != null)
                            {
                                model.RuleParameterValues.Add(selectedValue);
                            }
                        }
                    }

                    var redirectValues = model.RedirectTypeValues.ToList();
                    foreach (var redirectValue in redirectValues)
                    {
                        model.RedirectTypeValues.Remove(redirectValue);
                    }
                    foreach (var redirect in returnModel.RedirectTypeModel)
                    {
                        if (redirect.SelectedValue != null)
                        {
                            var guid = redirect.SelectedValue.Id;

                            var selectedValue = db.RedirectTypeValues.SingleOrDefault(row => row.Id == guid);
                            if (selectedValue != null)
                            {
                                model.RedirectTypeValues.Add(selectedValue);
                            }
                        }
                    }


                    db.SaveChanges();
                    //return RedirectToAction("Edit", "ContractUri", new { id = model.UserContractUri, contractId = model.UserContractUri1.UserContractId });
                    return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

                }
                else
                {
                    //contractUriId = returnModel.UserContractRedirect.UserContractUri1.Id;

                    var model = new UserContractRedirect();
                    model.Id = Guid.NewGuid();
                    model.UserContractUri = contractUriId;
                    model.UserContractUri1 = db.UserContractUris.SingleOrDefault(row => row.Id == contractUriId);

                    if (String.IsNullOrWhiteSpace(model.UserAgent))
                    {
                        model.UserAgent = "";
                    }

                    //model.Enabled = returnModel.UserContractRedirect.Enabled;
                    //model.Name = returnModel.UserContractRedirect.Name;
                    model.Enabled = collection.GetValue("UserContractRedirect.Actief").AttemptedValue.Contains("true");
                    model.Name = collection.GetValue("UserContractRedirect.Name").AttemptedValue;

                    //From Date
                    if (collection.GetValue("UserContractRedirect.StartDatumActive").AttemptedValue.Contains("true"))
                    {
                        //We need to take the value of the date picker and store it in the model

                        model.DateTimeValueStart = returnModel.UserContractRedirect.DateTimeValueStart;
                    }
                    else
                        model.DateTimeValueStart = null;
                    //To Date
                    if (collection.GetValue("UserContractRedirect.StopDatumActive").AttemptedValue.Contains("true"))
                    {
                        model.DateTimeValueStop = returnModel.UserContractRedirect.DateTimeValueStop;
                    }
                    else
                        model.DateTimeValueStop = null;

                    //Weekday
                    if (collection.GetValue("UserContractRedirect.WeekdayActive").AttemptedValue.Contains("true"))
                    {
                        string weekdayValue = collection.GetValue("ddlWeekday").AttemptedValue;
                        if (!String.IsNullOrEmpty(weekdayValue) && !String.IsNullOrWhiteSpace(weekdayValue))
                        {
                            int day = int.Parse(weekdayValue);
                            if (day > 0 && day < 10)
                                model.DayOfTheWeekValue = day;
                            else
                                model.DayOfTheWeekValue = null;
                        }
                    }
                    else
                        model.DayOfTheWeekValue = null;

                    //Between from
                    if (collection.GetValue("UserContractRedirect.BeginTimeActive").AttemptedValue.Contains("true"))
                    {
                        model.BeginTime = returnModel.UserContractRedirect.BeginTime;
                    }
                    else
                        model.BeginTime = null;

                    //Between To
                    if (collection.GetValue("UserContractRedirect.EndTimeActive").AttemptedValue.Contains("true"))
                    {
                        model.EndTime = returnModel.UserContractRedirect.EndTime;
                    }
                    else
                        model.EndTime = null;

                    var ruleValues = model.RuleParameterValues.ToList();
                    foreach (var ruleValue in ruleValues)
                    {
                        model.RuleParameterValues.Remove(ruleValue);
                    }
                    foreach (var parameter in returnModel.ParameterModel)
                    {
                        if (parameter.SelectedValue != null)
                        {
                            var guid = parameter.SelectedValue.Id;

                            var selectedValue = db.RuleParameterValues.SingleOrDefault(row => row.Id == guid);
                            if (selectedValue != null)
                            {
                                model.RuleParameterValues.Add(selectedValue);
                            }
                        }
                    }


                    var redirectValues = model.RedirectTypeValues.ToList();
                    foreach (var redirectValue in redirectValues)
                    {
                        model.RedirectTypeValues.Remove(redirectValue);
                    }
                    foreach (var redirect in returnModel.RedirectTypeModel)
                    {
                        if (redirect.SelectedValue != null)
                        {
                            var guid = redirect.SelectedValue.Id;

                            var selectedValue = db.RedirectTypeValues.SingleOrDefault(row => row.Id == guid);
                            if (selectedValue != null)
                            {
                                model.RedirectTypeValues.Add(selectedValue);
                            }
                        }
                    }

                    //Update
                    db.UserContractRedirects.Add(model);
                    db.SaveChanges();
                    //return RedirectToAction("Edit", "ContractUri", new { id = model.UserContractUri, contractId = model.UserContractUri1.UserContractId });
                    return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

                }
            }
            catch (DbEntityValidationException ex)
            {
                //return RedirectToAction("Edit", new { id, contractUriId });
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }
        }



        [HttpPost]
        public ActionResult EditOld(Guid id, Guid contractUriId, FormCollection collection)
        {
            //Save Action
            //If id == null then insert
            try
            {
                ViewData["selectedTab"] = int.Parse(collection.GetValue("selectedTab").AttemptedValue);
                collection.Remove("selectedTab");
                bool addNewUserContractRedirect = false;
                if (id == Guid.Empty)
                    addNewUserContractRedirect = true;

                if (!addNewUserContractRedirect)
                {
                    var model = db.UserContractRedirects.FirstOrDefault(u => u.Id == id);
                    model.Enabled = collection.GetValue("Actief").AttemptedValue.Contains("true");
                    model.Name = collection.GetValue("Name").AttemptedValue;
                    //From Date
                    if (collection.GetValue("StartDatumActive").AttemptedValue.Contains("true"))
                    {
                        //We need to take the value of the date picker and store it in the model
                        string dpStartValue = collection.GetValue("dpStartDate").AttemptedValue;
                        if (!String.IsNullOrEmpty(dpStartValue) && !String.IsNullOrWhiteSpace(dpStartValue))
                            model.DateTimeValueStart = DataHelper.ParseDate(dpStartValue);
                        else
                            model.DateTimeValueStart = null;
                    }
                    else
                        model.DateTimeValueStart = null;
                    //To Date
                    if (collection.GetValue("StopDatumActive").AttemptedValue.Contains("true"))
                    {
                        string dpStopValue = collection.GetValue("dpEndDate").AttemptedValue;
                        if (!String.IsNullOrEmpty(dpStopValue) && !String.IsNullOrWhiteSpace(dpStopValue))
                            model.DateTimeValueStop = DataHelper.ParseDate(dpStopValue);
                        else
                            model.DateTimeValueStop = null;
                    }
                    else
                        model.DateTimeValueStop = null;

                    //Weekday
                    if (collection.GetValue("WeekdayActive").AttemptedValue.Contains("true"))
                    {
                        string weekdayValue = collection.GetValue("ddlWeekday").AttemptedValue;
                        if (!String.IsNullOrEmpty(weekdayValue) && !String.IsNullOrWhiteSpace(weekdayValue))
                        {
                            int day = int.Parse(weekdayValue);
                            if (day > 0 && day < 10)
                                model.DayOfTheWeekValue = day;
                            else
                                model.DayOfTheWeekValue = null;
                        }
                    }
                    else
                        model.DayOfTheWeekValue = null;

                    //Between from
                    if (collection.GetValue("BeginTimeActive").AttemptedValue.Contains("true"))
                    {
                        string tpBeginTime = collection.GetValue("tpBeginTime").AttemptedValue;
                        int? hour;
                        int? minute;
                        DataHelper.ParseTime(tpBeginTime, out hour, out minute);
                        model.TimeOfDayHourStart = hour;
                        model.TimeOfDayMinuteStart = minute;
                    }
                    else
                        model.BeginTime = null;

                    //Between To
                    if (collection.GetValue("EndTimeActive").AttemptedValue.Contains("true"))
                    {
                        string tpEndTime = collection.GetValue("tpEndTime").AttemptedValue;
                        int? hour;
                        int? minute;
                        DataHelper.ParseTime(tpEndTime, out hour, out minute);
                        model.TimeOfDayHourEnd = hour;
                        model.TimeOfDayMinuteEnd = minute;
                    }
                    else
                        model.EndTime = null;
                    //Counter
                    if (collection.GetValue("CounterActive").AttemptedValue.Contains("true"))
                    {
                        string numCounter = collection.GetValue("numCounter").AttemptedValue;
                        if (!String.IsNullOrEmpty(numCounter) && !String.IsNullOrWhiteSpace(numCounter))
                        {
                            int counterValue = int.Parse(numCounter);
                            if (counterValue > 0)
                                model.Counter = counterValue;
                            else
                                model.Counter = null;
                        }
                        else
                            model.Counter = null;
                    }
                    else
                        model.Counter = null;

                    //Update
                    db.SaveChanges();
                    //return RedirectToAction("Edit", "ContractUri", new { id = model.UserContractUri, contractId = model.UserContractUri1.UserContractId });
                    return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

                }
                else
                {
                    var model = new UserContractRedirect();
                    model.Id = Guid.NewGuid();
                    model.UserContractUri = contractUriId;

                    model.Enabled = collection.GetValue("Actief").AttemptedValue.Contains("true");
                    model.Name = collection.GetValue("Name").AttemptedValue;
                    //From Date
                    if (collection.GetValue("StartDatumActive").AttemptedValue.Contains("true"))
                    {
                        //We need to take the value of the date picker and store it in the model
                        string dpStartValue = collection.GetValue("dpStartDate").AttemptedValue;
                        if (!String.IsNullOrEmpty(dpStartValue) && !String.IsNullOrWhiteSpace(dpStartValue))
                            model.DateTimeValueStart = DataHelper.ParseDate(dpStartValue);
                        else
                            model.DateTimeValueStart = null;
                    }
                    else
                        model.DateTimeValueStart = null;
                    //To Date
                    if (collection.GetValue("StopDatumActive").AttemptedValue.Contains("true"))
                    {
                        string dpStopValue = collection.GetValue("dpEndDate").AttemptedValue;
                        if (!String.IsNullOrEmpty(dpStopValue) && !String.IsNullOrWhiteSpace(dpStopValue))
                            model.DateTimeValueStop = DataHelper.ParseDate(dpStopValue);
                        else
                            model.DateTimeValueStop = null;
                    }
                    else
                        model.DateTimeValueStop = null;

                    //Weekday
                    if (collection.GetValue("WeekdayActive").AttemptedValue.Contains("true"))
                    {
                        string weekdayValue = collection.GetValue("ddlWeekday").AttemptedValue;
                        if (!String.IsNullOrEmpty(weekdayValue) && !String.IsNullOrWhiteSpace(weekdayValue))
                        {
                            int day = int.Parse(weekdayValue);
                            if (day > 0 && day < 10)
                                model.DayOfTheWeekValue = day;
                            else
                                model.DayOfTheWeekValue = null;
                        }
                    }
                    else
                        model.DayOfTheWeekValue = null;

                    //Between from
                    if (collection.GetValue("BeginTimeActive").AttemptedValue.Contains("true"))
                    {
                        string tpBeginTime = collection.GetValue("tpBeginTime").AttemptedValue;
                        int? hour;
                        int? minute;
                        DataHelper.ParseTime(tpBeginTime, out hour, out minute);
                        model.TimeOfDayHourStart = hour;
                        model.TimeOfDayMinuteStart = minute;
                    }
                    else
                        model.BeginTime = null;

                    //Between To
                    if (collection.GetValue("EndTimeActive").AttemptedValue.Contains("true"))
                    {
                        string tpEndTime = collection.GetValue("tpEndTime").AttemptedValue;
                        int? hour;
                        int? minute;
                        DataHelper.ParseTime(tpEndTime, out hour, out minute);
                        model.TimeOfDayHourEnd = hour;
                        model.TimeOfDayMinuteEnd = minute;
                    }
                    else
                        model.EndTime = null;
                    //Counter
                    if (collection.GetValue("CounterActive").AttemptedValue.Contains("true"))
                    {
                        string numCounter = collection.GetValue("numCounter").AttemptedValue;
                        if (!String.IsNullOrEmpty(numCounter) && !String.IsNullOrWhiteSpace(numCounter))
                        {
                            int counterValue = int.Parse(numCounter);
                            if (counterValue > 0)
                                model.Counter = counterValue;
                            else
                                model.Counter = null;
                        }
                        else
                            model.Counter = null;
                    }
                    else
                        model.Counter = null;

                    //Update
                    db.UserContractRedirects.Add(model);
                    db.SaveChanges();
                    //return RedirectToAction("Edit", "ContractUri", new { id = model.UserContractUri, contractId = model.UserContractUri1.UserContractId });
                    return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

                }
            }
            catch (Exception)
            {
                //return RedirectToAction("Edit", new { id = Guid.Empty, contractUriId });
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }
        }


        //
        // GET: /ContractRedirect/Delete/5

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <param name="contractUriId"></param>
        /// <returns></returns>
        public ActionResult Delete(Guid id, Guid contractUriId)
        {
            var contractUri = db.UserContractUris.First(c => c.Id == contractUriId);

            var contractRedirect = db.UserContractRedirects.FirstOrDefault(c => c.Id == id);

            if (contractRedirect == null)
            {
                //return RedirectToAction("Edit", "ContractUri", new { id = contractUri.Id, contractId = contractUri.UserContractId });
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

                //return HttpNotFound();
            }
            ViewBag.contractId = contractRedirect.UserContractUri1.UserContractId;
            return View(contractRedirect);
        }

        //
        // POST: /UserContract/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(UserContractRedirect userContractRedirect, FormCollection collection)
        {

            var contractRedirect = db.UserContractRedirects.FirstOrDefault(c => c.Id == userContractRedirect.Id);
            if (contractRedirect != null)
            {
                db.UserContractRedirects.Remove(contractRedirect);
                db.SaveChanges();
            }
            //return RedirectToAction("Edit", "ContractUri", new { id = userContractRedirect.UserContractUri1.Id, contractId = userContractRedirect.UserContractUri1.UserContractId });
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }
    }
}
