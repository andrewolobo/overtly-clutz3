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
    public class UserContractController : BaseController
    {
        //private Tag4sEntities db = new Tag4sEntities();
        private IQueryable<UserContract> Model()
        {
            var userContract = db.UserContracts.AsQueryable();

            switch (Filter.Key)
            {
                case Filters.ViewFilterKeys.userId:
                    userContract = userContract.Where(row => row.UserId == Filter.Id);
                    break;
            }

            if (User.IsKlant)
            {
                userContract = userContract.Where(row => row.UserId == User.Id);
            }


            return userContract;
        }

        //
        // GET: /UserContract/

        public ActionResult Index()
        {
            switch (Filter.Key)
            {
                case Filters.ViewFilterKeys.userId:
                    ViewBag.User = db.Users.Find(Filter.Id);
                    break;
            }
            //var usercontracts = db.UserContracts.Include(u => u.Contract).Include(u => u.User);
            return View(Model());
        }

        //
        // GET: /UserContract/Details/5

        public ActionResult Details(Guid id)
        {
            UserContract usercontract = db.UserContracts.Find(id);
            if (usercontract == null)
            {
                return HttpNotFound();
            }
            return View(usercontract);
        }

        //
        // GET: /UserContract/Create

        public ActionResult Create()
        {
            ViewBag.ContractId = new SelectList(db.Contracts, "Id", "Name");
            ViewBag.UserId = new SelectList(db.Users, "Id", "Firstname");
            ViewBag.ContractRecipeId = new SelectList(db.ContractRecipes, "Id", "Name");
            return View();
        }

        //
        // POST: /UserContract/Create

        [HttpPost]
        public ActionResult Create(UserContract usercontract)
        {
            if (ModelState.IsValid)
            {
                usercontract.Id = Guid.NewGuid();
                db.UserContracts.Add(usercontract);
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            ViewBag.ContractId = new SelectList(db.Contracts, "Id", "Name", usercontract.ContractId);
            ViewBag.UserId = new SelectList(db.Users, "Id", "Firstname", usercontract.UserId);
            ViewBag.ContractRecipeId = new SelectList(db.ContractRecipes, "Id", "Name");
            return View(usercontract);
        }

        //
        // GET: /UserContract/Edit/5

        public ActionResult Edit(Guid id)
        {
            UserContract usercontract = db.UserContracts.Find(id);
            if (usercontract == null)
            {
                return HttpNotFound();
            }
            ViewBag.ContractId = new SelectList(db.Contracts, "Id", "Name", usercontract.ContractId);
            ViewBag.UserId = new SelectList(db.Users, "Id", "Firstname", usercontract.UserId);
            ViewBag.ContractRecipeId = new SelectList(db.ContractRecipes, "Id", "Name");

            //var uris = usercontract.UserContractUris.ToList().OrderBy(row => row.UserContractRedirects.First().Weekday);
            //var hash = new HashSet<UserContractUri>();
            //hash.AddRange(uris.ToList());
            //usercontract.UserContractUris =hash ;

            var view = "";
            if (usercontract.ContractRecipeId.HasValue)
            {
                switch (usercontract.ContractRecipe.Code)
                {
                    case (1):
                        view = "ContractEditByRule";
                        var model = BuildRecipeByRule(usercontract);
                        return View(view, model);
                        break;
                    case (2):
                        view = "ContractEditByDate";
                        break;
                    case (3):
                        view = "ContractEditByWeekDay";
                        break;
                    case (4):
                        view = "ContractEditByRandom1";
                        break;
                    case (5):
                        view = "ContractEditByRandom2";
                        break;
                    case (6):
                        view = "ContractEditByTime";
                        break;
                    case (7):
                        view = "ContractEditByRandom3";
                        break;
                    case (8):
                        view = "ContractEditByRandom4";
                        break;
                    case (9):
                        break;
                    case (10):
                        view = "ContractEditByDatePro";
                        break;
                    case (11):
                        view = "ContractEditByWeekDayPro";
                        break;
                    case (14):
                        view = "ContractEditByTimePro";
                        break;
                    default:
                        view = "Edit";
                        break;
                }
                return View(view, usercontract);
            }

            return View(usercontract);
        }

        //
        // POST: /UserContract/Edit/5

        [HttpPost]
        public ActionResult Edit(UserContract usercontract)
        {
            if (ModelState.IsValid)
            {
                var contractRecipe = db.ContractRecipes.Find(usercontract.ContractRecipeId);
                if (contractRecipe != null)
                {
                    //to be sure, set all redirects on enabled, the UI has no access to this field and it's used in the engine
                    foreach (var userContractUri in usercontract.UserContractUris)
                    {
                        foreach (var redirect in userContractUri.UserContractRedirects)
                        {
                            redirect.Enabled = true;
                        }
                    }
                    switch (contractRecipe.Code)
                    {
                        case (2):
                        {
                            foreach (var userContractUri in usercontract.UserContractUris)
                            {
                                foreach (var userContractRedirect in userContractUri.UserContractRedirects)
                                {
                                    if (userContractRedirect.DateTimeValueStart.HasValue)
                                    {
                                        userContractRedirect.DateTimeValueStop =
                                            userContractRedirect.DateTimeValueStart;
                                        userContractRedirect.DateTimeValueStop =
                                            userContractRedirect.DateTimeValueStop + TimeSpan.FromHours(24);
                                    }
                                }
                            }
                            break;
                        }
                        case (11):
                        {
                            for (int i = 1; i <= 7; i++)
                            {
                                var UserContractUrisList = usercontract.UserContractUris.Where(
                                    row => row.UserContractRedirects.First().DayOfTheWeekValue == i).ToList();
                                bool active = false;
                                foreach (var userContractUri in UserContractUrisList)
                                {
                                    if (userContractUri.Actief)
                                        active = true;
                                }

                                foreach (var userContractUri in UserContractUrisList)
                                {
                                    userContractUri.Actief = active;
                                }
                            }
                            break;
                        }
                        case (10):
                        {
                            bool active = false;
                            foreach (var userContractUri in usercontract.UserContractUris)
                            {
                                if (userContractUri.Actief)
                                    active = true;
                            }

                            foreach (var userContractUri in usercontract.UserContractUris)
                            {
                                userContractUri.Actief = active;
                            }
                            break;
                        }
                    }
                }
                db.Entry(usercontract).State = EntityState.Modified;
                foreach (var userContractUri in usercontract.UserContractUris)
                {
                    db.Entry(userContractUri).State = EntityState.Modified;
                    foreach (var userContractRedirect in userContractUri.UserContractRedirects)
                    {
                        db.Entry(userContractRedirect).State = EntityState.Modified;
                    }
                    foreach (var randomUri in userContractUri.RandomUris)
                    {
                        db.Entry(randomUri).State = EntityState.Modified;
                    }
                }
                try
                {
                    db.SaveChanges();
                }
                catch (DbEntityValidationException e)
                {
                    foreach (var eve in e.EntityValidationErrors)
                    {
                        Console.WriteLine(
                            "Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                            eve.Entry.Entity.GetType().Name, eve.Entry.State);
                        foreach (var ve in eve.ValidationErrors)
                        {
                            Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                                ve.PropertyName, ve.ErrorMessage);
                        }
                    }
                    throw;
                }
                //return RedirectToAction("Index", new {userId = usercontract.UserId});
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            ViewBag.ContractId = new SelectList(db.Contracts, "Id", "Name", usercontract.ContractId);
            ViewBag.UserId = new SelectList(db.Users, "Id", "Firstname", usercontract.UserId);
            ViewBag.ContractRecipeId = new SelectList(db.ContractRecipes, "Id", "Name");
            return View(usercontract);
        }

        //
        // GET: /UserContract/Delete/5

        public ActionResult Delete(Guid id)
        {
            UserContract usercontract = db.UserContracts.Find(id);
            if (usercontract == null)
            {
                return HttpNotFound();
            }
            var translation = TranslationDictionary;
            ViewBag.ErrorMessage = "UserContract cannot be deleted".TranslateString(ref translation);
            return View(usercontract);
        }

        //
        // POST: /UserContract/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            UserContract usercontract = db.UserContracts.Find(id);
            db.UserContracts.Remove(usercontract);
            db.SaveChanges();
            //return RedirectToAction("Index", new {userId = usercontract.UserId});
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

        //protected override void Dispose(bool disposing)
        //{
        //    db.Dispose();
        //    base.Dispose(disposing);
        //}

        public ActionResult CreateRecipe(Guid? recipeId, Guid? userId, Guid? defaultContractId)
        {
            ViewBag.userId = userId;

            if (!recipeId.HasValue)
            {
                return View(db.ContractRecipes.ToList());
            }

            var adefaultContractId = ReadAppSetting("DefaultContractId");
            var userContract = new UserContract()
            {
                Id = Guid.NewGuid(),
                ContractId = new Guid(defaultContractId.HasValue ? defaultContractId.ToString() : adefaultContractId),
                UserId = userId ?? User.Id,
                StartDate = DateTime.Now,
                EndDate = DateTime.Now.AddYears(1),
                Uri = "http://www.tag4s.com",
                ContractRecipeId = recipeId.Value,
                Enabled = false,
                eId = Utilities.GetRandomSalt(5),
            };
            //aici, in functie de recipe.code, trebuie umplut contractul cum trebuie.
            var contractRecipe = db.ContractRecipes.Find(recipeId);
            switch (contractRecipe.Code)
            {
                case 1:
                    BuildRecipeByDate(userContract);
                    break;
                case 2:
                    BuildRecipeByDate(userContract);
                    break;
                case 3:
                    BuildRecipeByWeekDay(userContract);
                    break;
                case 4:
                    BuildRecipeByRandom1(userContract);
                    break;
                case 5:
                    BuildRecipeByRandom2(userContract);
                    break;
                case 6:
                    BuildRecipeByTime(userContract);
                    break;
                case 7:
                    BuildRecipeByRandom3(userContract);
                    break;
                case 8:
                    BuildRecipeByRandom4(userContract);
                    break;
                case 9:
                    break;
                case 10:
                    BuildRecipeByDate(userContract);
                    break;
                case 11:
                    BuildRecipeByWeekDayPro(userContract);
                    break;
                case 14:
                    BuildRecipeByTime(userContract);
                    break;
            }
            db.UserContracts.Add(userContract);
            try
            {
                db.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {
                throw;
            }
            return RedirectToAction("Edit", new {userContract.Id});
        }

        private void BuildRecipeByRandom1(UserContract userContract)
        {
            var userContractUri = new UserContractUri()
            {
                Id = Guid.NewGuid(),
                UserContractId = userContract.Id,
                Uri = userContract.Uri,
                Name = "noname",
                Enabled = false,
                RandomFunction = 1,
            };
            userContract.UserContractUris.Add(userContractUri);
            var userContractRedirect = new UserContractRedirect
            {
                Id = Guid.NewGuid(),
                UserContractUri = userContractUri.Id,
                Enabled = true,
                DateTimeValueStart = userContract.StartDate,
                DateTimeValueStop = userContract.EndDate
            };
            userContractUri.UserContractRedirects.Add(userContractRedirect);

            var randomUri = new RandomUri()
            {
                Id = Guid.NewGuid(),
                Uri = userContract.Uri,
                UserContractUriId = userContractUri.Id,
                RandomParameter = 1,
            };
            userContractUri.RandomUris.Add(randomUri);
        }

        public ActionResult AddRandom1Uri(Guid? userContractId)
        {
            if (!userContractId.HasValue)
            {
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            var userContract = db.UserContracts.Find(userContractId);
            var userContractUri = new UserContractUri()
            {
                Id = Guid.NewGuid(),
                UserContractId = userContract.Id,
                Uri = userContract.Uri,
                Name = "noname",
                Enabled = false,
                RandomFunction = 1,
            };
            userContract.UserContractUris.Add(userContractUri);
            var randomUri = new RandomUri()
            {
                Id = Guid.NewGuid(),
                Uri = userContract.Uri,
                UserContractUriId = userContractUri.Id,
                RandomParameter = 1,
            };
            userContractUri.RandomUris.Add(randomUri);
            db.SaveChanges();
            return RedirectToAction("Edit", new {id = userContract.Id});
        }

        public ActionResult DeleteRandom1Uri(Guid? userContractUriId, Guid? randomUriId)
        {
            if (!userContractUriId.HasValue || !randomUriId.HasValue)
            {
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            var userContractrUri = db.UserContractUris.Find(userContractUriId);
            var randomUri = db.RandomUris.Find(randomUriId);
            db.RandomUris.Remove(randomUri);
            db.UserContractUris.Remove(userContractrUri);

            db.SaveChanges();
            return RedirectToAction("Edit", new {id = userContractrUri.UserContract.Id});
        }

        private void BuildRecipeByRandom2(UserContract userContract)
        {
            var userContractUri = new UserContractUri()
            {
                Id = Guid.NewGuid(),
                UserContractId = userContract.Id,
                Uri = userContract.Uri,
                Name = "noname",
                Enabled = false,
                RandomFunction = 2,
            };
            userContract.UserContractUris.Add(userContractUri);
            var userContractRedirect = new UserContractRedirect
            {
                Id = Guid.NewGuid(),
                UserContractUri = userContractUri.Id,
                Enabled = true,
                DateTimeValueStart = userContract.StartDate,
                DateTimeValueStop = userContract.EndDate
            };
            userContractUri.UserContractRedirects.Add(userContractRedirect);
            var randomUri = new RandomUri()
            {
                Id = Guid.NewGuid(),
                Uri = userContract.Uri,
                UserContractUriId = userContractUri.Id,
                RandomParameter = 1,
            };
            userContractUri.RandomUris.Add(randomUri);
        }

        private void BuildRecipeByRandom3(UserContract userContract)
        {
            var userContractUri = new UserContractUri()
            {
                Id = Guid.NewGuid(),
                UserContractId = userContract.Id,
                Uri = userContract.Uri,
                Name = "noname",
                Enabled = false,
                RandomFunction = 3,
            };
            userContract.UserContractUris.Add(userContractUri);
            var userContractRedirect = new UserContractRedirect
            {
                Id = Guid.NewGuid(),
                UserContractUri = userContractUri.Id,
                Enabled = true,
                DateTimeValueStart = userContract.StartDate,
                DateTimeValueStop = userContract.EndDate
            };
            userContractUri.UserContractRedirects.Add(userContractRedirect);
            var randomUri = new RandomUri()
            {
                Id = Guid.NewGuid(),
                Uri = userContract.Uri,
                UserContractUriId = userContractUri.Id,
                RandomParameter = 1,
            };
            userContractUri.RandomUris.Add(randomUri);
        }

        private void BuildRecipeByRandom4(UserContract userContract)
        {
            var userContractUri = new UserContractUri()
            {
                Id = Guid.NewGuid(),
                UserContractId = userContract.Id,
                Uri = userContract.Uri,
                Name = "noname",
                Enabled = false,
                RandomFunction = 3,
            };
            userContract.UserContractUris.Add(userContractUri);
            var userContractRedirect = new UserContractRedirect
            {
                Id = Guid.NewGuid(),
                UserContractUri = userContractUri.Id,
                Enabled = true,
                DateTimeValueStart = userContract.StartDate,
                DateTimeValueStop = userContract.EndDate
            };
            userContractUri.UserContractRedirects.Add(userContractRedirect);
            var randomUri = new RandomUri()
            {
                Id = Guid.NewGuid(),
                Uri = userContract.Uri,
                UserContractUriId = userContractUri.Id,
                RandomParameter = 1,
            };
            userContractUri.RandomUris.Add(randomUri);
        }


        public ActionResult AddRandomUri(Guid userContractId, string uri)
        {
            if (userContractId == null)
            {
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }

            var userContract = db.UserContracts.Find(userContractId);
            var userContractUri = new UserContractUri()
            {
                Id = Guid.NewGuid(),
                UserContractId = userContract.Id,
                Uri = uri,
                Name = "noname",
                Enabled = false,
                RandomFunction = 0,
            };
            userContract.UserContractUris.Add(userContractUri);
            var randomUri = new RandomUri()
            {
                Id = Guid.NewGuid(),
                Uri = uri,
                UserContractUriId = userContractUri.Id,
                RandomParameter = 1,
            };
            userContractUri.RandomUris.Add(randomUri);
            db.SaveChanges();
            return RedirectToAction("Edit", new {id = userContract.Id});
        }


        public ActionResult DeleteRandomUri(Guid userContractId, Guid userContractUriId)
        {
            if (userContractId == null || userContractUriId == null)
            {
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }

            var userContract = db.UserContracts.Find(userContractId);
            var userContractUri = db.UserContractUris.Find(userContractUriId);
            db.UserContractUris.Remove(userContractUri);
            db.SaveChanges();
            return RedirectToAction("Edit", new {id = userContract.Id});
        }

        private void BuildRecipeByWeekDay(UserContract userContract)
        {
            for (var i = 1; i <= 7; i++)
            {
                var userContractUri = new UserContractUri()
                {
                    Id = Guid.NewGuid(),
                    UserContractId = userContract.Id,
                    Uri = userContract.Uri,
                    Name = "noname",
                    Enabled = false,
                    RandomFunction = 0,
                };
                userContract.UserContractUris.Add(userContractUri);
                var userContractRedirect = new UserContractRedirect()
                {
                    Id = Guid.NewGuid(),
                    UserContractUri = userContractUri.Id,
                    Enabled = true
                };
                userContractRedirect.DayOfTheWeekValue = i;
                userContractUri.UserContractRedirects.Add(userContractRedirect);
            }
        }

        private void BuildRecipeByWeekDayPro(UserContract userContract)
        {
            for (var i = 1; i <= 7; i++)
            {
                var userContractUri = new UserContractUri()
                {
                    Id = Guid.NewGuid(),
                    UserContractId = userContract.Id,
                    Uri = userContract.Uri,
                    Name = "noname",
                    Enabled = false,
                    RandomFunction = 0,
                };
                userContract.UserContractUris.Add(userContractUri);
                var userContractRedirect = new UserContractRedirect()
                {
                    Id = Guid.NewGuid(),
                    UserContractUri = userContractUri.Id,
                    Enabled = true
                };
                userContractRedirect.DayOfTheWeekValue = i;
                userContractUri.UserContractRedirects.Add(userContractRedirect);
            }
        }

        public ActionResult AddUserContractUri(Guid userContractId, int weekDay)
        {
            var userContract = db.UserContracts.Find(userContractId);
            var userContractUri = new UserContractUri()
            {
                Id = Guid.NewGuid(),
                UserContractId = userContract.Id,
                Uri = userContract.Uri,
                Name = "noname",
                Enabled = false,
                RandomFunction = 0,
            };
            userContract.UserContractUris.Add(userContractUri);
            var userContractRedirect = new UserContractRedirect()
            {
                Id = Guid.NewGuid(),
                UserContractUri = userContractUri.Id,
                Enabled = true
            };
            userContractRedirect.DayOfTheWeekValue = weekDay;
            userContractUri.UserContractRedirects.Add(userContractRedirect);
            db.SaveChanges();
            return RedirectToAction("Edit", new {id = userContract.Id});
        }


        public ActionResult DeleteUserContractUri(Guid userContractUriId)
        {
            if (userContractUriId == null)
            {
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }

            var userContractUri = db.UserContractUris.Find(userContractUriId);
            Guid userContractId = userContractUri.UserContractId;
            
            foreach (var userContractRedirect in userContractUri.UserContractRedirects)
            {
                foreach (var userContractLog in userContractRedirect.UserContractLogs)
                {
                    db.UserContractLogs.Remove(userContractLog);
                }
            }
            db.UserContractUris.Remove(userContractUri);
            db.SaveChanges();
            return RedirectToAction("Edit", new {id = userContractId});
        }

        private void BuildRecipeByTime(UserContract userContract)
        {
            var userContractUri = new UserContractUri()
            {
                Id = Guid.NewGuid(),
                UserContractId = userContract.Id,
                Uri = userContract.Uri,
                Name = "noname",
                Enabled = false,
                RandomFunction = 0,
            };
            userContract.UserContractUris.Add(userContractUri);
            var userContractRedirect = new UserContractRedirect()
            {
                Id = Guid.NewGuid(),
                UserContractUri = userContractUri.Id,
                Enabled = true
            };
            userContractUri.UserContractRedirects.Add(userContractRedirect);
        }

        private void BuildRecipeByDate(UserContract userContract)
        {
            var userContractUri = new UserContractUri()
            {
                Id = Guid.NewGuid(),
                UserContractId = userContract.Id,
                Uri = userContract.Uri,
                Name = "noname",
                Enabled = false,
                RandomFunction = 0,
            };
            userContract.UserContractUris.Add(userContractUri);
            var userContractRedirect = new UserContractRedirect()
            {
                Id = Guid.NewGuid(),
                UserContractUri = userContractUri.Id,
                Enabled = true
            };
            userContractRedirect.DateTimeValueStart = DateTime.Now;
            userContractUri.UserContractRedirects.Add(userContractRedirect);
            db.SaveChanges();
        }

        public ActionResult AddUriTime(Guid userContractId, DateTime? dateTimeValueStart)
        {
            if (userContractId == null)
            {
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }

            var userContract = db.UserContracts.Find(userContractId);
            var userContractUri = new UserContractUri()
            {
                Id = Guid.NewGuid(),
                UserContractId = userContract.Id,
                Uri = userContract.Uri,
                Name = "noname",
                Enabled = false,
                RandomFunction = 0,
            };
            userContract.UserContractUris.Add(userContractUri);
            var userContractRedirect = new UserContractRedirect()
            {
                Id = Guid.NewGuid(),
                UserContractUri = userContractUri.Id,
                Enabled = true
            };
            userContractRedirect.DateTimeValueStart = dateTimeValueStart;
            userContractUri.UserContractRedirects.Add(userContractRedirect);
            db.SaveChanges();
            return RedirectToAction("Edit", new {id = userContract.Id});
        }

        public ActionResult AddUri(Guid userContractId, DateTime? StartEndDate, string uri)
        {
            if (userContractId == null)
            {
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }

            var userContract = db.UserContracts.Find(userContractId);
            var userContractUri = new UserContractUri()
            {
                Id = Guid.NewGuid(),
                UserContractId = userContract.Id,
                Uri = uri,
                Name = "noname",
                Enabled = false,
                RandomFunction = 0,
            };
            userContract.UserContractUris.Add(userContractUri);
            var userContractRedirect = new UserContractRedirect()
            {
                Id = Guid.NewGuid(),
                UserContractUri = userContractUri.Id,
                Enabled = true
            };
            userContractUri.UserContractRedirects.Add(userContractRedirect);
            db.SaveChanges();
            return RedirectToAction("Edit", new {id = userContract.Id});
        }


        public ActionResult DeleteUri(Guid userContractId, Guid userContractUriId)
        {
            if (userContractId == null || userContractUriId == null)
            {
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }

            var userContract = db.UserContracts.Find(userContractId);
            var userContractUri = db.UserContractUris.Find(userContractUriId);
            db.UserContractUris.Remove(userContractUri);
            userContractUri.UserContractLogs.Clear();
            db.SaveChanges();
            return RedirectToAction("Edit", new {id = userContract.Id});
        }

        public List<UserContractParametersModel> BuildRecipeByRule(UserContract userContract)
        {
            var result = new List<UserContractParametersModel>();

            foreach (var userContractUri in userContract.UserContractUris)
            {
                var userContractUriId = userContractUri.Id;
                var id =
                    userContract.UserContractUris.SingleOrDefault(row => row.Id == userContractUriId)
                        .UserContractRedirects.FirstOrDefault()
                        .Id;

                var model = new UserContractParametersModel();

                model.UserContractUri = userContractUri;

                //get parameters with possible values
                var parameters =
                    db.RuleParameters.Select(row => new ContractRedirectParameterModel {RuleParameter = row}).ToList();
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

                var redirects =
                    db.RedirectTypes.Select(row => new ContractRedirectRedirectTypeModel {RedirectType = row}).ToList();
                model.RedirectTypeModel = redirects;
                foreach (var redirect in model.RedirectTypeModel)
                {
                    var list =
                        db.RedirectTypeValues.Where(row => row.RedirectTypeId == redirect.RedirectType.Id)
                            .ToList()
                            .Select(row => new SelectListItem {Text = row.Name, Value = row.Id.ToString()}).ToList();
                    list.Insert(0, new SelectListItem {Selected = true, Text = "...", Value = Guid.Empty.ToString()});
                    redirect.RedirectTypeValues = list;
                }

                if (id != Guid.Empty)
                {
                    model.UserContract = userContract;
                    if (model.UserContract != null)
                    {
                        //get the selectedvalues
                        foreach (
                            var ruleParameterValue in
                                userContractUri
                                    .UserContractRedirects.FirstOrDefault()
                                    .RuleParameterValues)
                        {
                            var parameter =
                                model.ParameterModel.FirstOrDefault(
                                    row => row.RuleParameter.Id == ruleParameterValue.RuleParameterId);
                            if (parameter != null)
                            {
                                parameter.SelectedValue = ruleParameterValue;
                                var singleOrDefault =
                                    parameter.RuleParameterValues.SingleOrDefault(
                                        row => row.Value == parameter.SelectedValue.Id.ToString());
                                if (singleOrDefault != null)
                                    singleOrDefault.Selected = true;
                            }
                        }


                        //get the selectedvalues
                        foreach (
                            var redirectTypeValue in
                                userContractUri
                                    .UserContractRedirects.FirstOrDefault()
                                    .RedirectTypeValues)
                        {
                            var redirect =
                                model.RedirectTypeModel.FirstOrDefault(
                                    row => row.RedirectType.Id == redirectTypeValue.RedirectTypeId);
                            if (redirect != null)
                            {
                                redirect.SelectedValue = redirectTypeValue;
                                var singleOrDefault =
                                    redirect.RedirectTypeValues.SingleOrDefault(
                                        row => row.Value == redirect.SelectedValue.Id.ToString());
                                if (singleOrDefault != null)
                                    singleOrDefault.Selected = true;
                            }
                        }
                    }
                }
                result.Add(model);
            }

            return result;
        }


        [HttpPost]
        public ActionResult EditByRule(List<UserContractParametersModel> models)
        {
            try
            {
                int index = 0;
                foreach (var returnModel in models)
                {

                    var userContractRedirectId = returnModel.UserContractUri
                        .UserContractRedirects.FirstOrDefault()
                        .Id;
                    var model =
                        db.UserContractRedirects.FirstOrDefault(
                            u =>
                                u.Id ==
                                userContractRedirectId);

                    //we should use db.Entry().State but is not sure will not fireback
                    var userContract = db.UserContracts.Find(returnModel.UserContract.Id);
                    if (userContract != null)
                    {
                        userContract.Uri = returnModel.UserContract.Uri;
                    }

                    var userContractUri = db.UserContractUris.Find(returnModel.UserContractUri.Id);
                    if (userContractUri != null)
                    {
                        userContractUri.Actief = returnModel.UserContractUri.Actief;
                        userContractUri.Uri = returnModel.UserContractUri.Uri;
                    }

                    //Update
                    if (returnModel.ParameterModel != null)
                    {
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
                    }

                    if (returnModel.RedirectTypeModel != null)
                    {
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
                    }
                    db.SaveChanges();
                }
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            catch (Exception e)
            {
                //foreach (var eve in e.EntityValidationErrors)
                //{
                //    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                //        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                //    foreach (var ve in eve.ValidationErrors)
                //    {
                //        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                //            ve.PropertyName, ve.ErrorMessage);
                //    }
                //}
                throw;
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
        }


        //private string GenerateRandomString()
        //{
        //    string strchar = "abcdefghijklmnopqrstuvwxyz0123456789#+@&$ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        //    string str = "";
        //    Random rnd = new Random();
        //    for (int i = 0; i <= 5; i++)
        //    {
        //        int iRandom = rnd.Next(0, strchar.Length - 1);
        //        str += strchar.Substring(iRandom, 1);
        //    }
        //    return str;
        //}
    }
}