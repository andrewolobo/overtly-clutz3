using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Web.Routing;
using Kendo.Mvc.Extensions;
using Microsoft.Ajax.Utilities;
using Tag4s.Data;
using Tag4s.Filters;
using Tag4s.Helpers;
using Tag4s.Models;
using SelectListItem = System.Web.WebPages.Html.SelectListItem;

namespace Tag4s.Controllers
{
    public class StatisticsController : BaseController
    {
        public ActionResult PerUserContract(Guid? userContractId, Guid? userId, DateTime? startDate, DateTime? endDate,
            string browserProperty)
        {
            if (!userId.HasValue)
                userId = User.Id;
            
            var userContractLogs =
                db.UserContractLogs.Where(
                    row => row.UserContract.UserId == userId /*&& row.DateTime >= startDate && row.DateTime <= endDate*/);
            if (userContractId.HasValue)
            {
                userContractLogs = userContractLogs.Where(row => row.UserContractId == userContractId);
            }
            var model = new UserContractLogModel();
            
            model.UserContractLogs = userContractLogs.ToList();
            model.StartDate = startDate;
            model.EndDate = endDate;
            model.UserId = userId.Value;
            model.UserContractId = userContractId;

            return View(model);
        }

        [HttpPost]
        public ActionResult PerUserContract(UserContractLogModel userContractLogModel)
        {
            var userContractLogList =
                db.UserContractLogs.Where(
                    row => row.UserContract.UserId == userContractLogModel.UserId && row.DateTime >= userContractLogModel.StartDate && row.DateTime <= userContractLogModel.EndDate).ToList();
            userContractLogModel.UserContractLogs = userContractLogList;
            
            return View(userContractLogModel);
        }
    }
}