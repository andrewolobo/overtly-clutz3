using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Services.Discovery;
using System.Web.WebPages.Razor.Configuration;
using Tag4s.Data;
using Tag4s.Helpers;

namespace Tag4s.Controllers
{
    public class UserController : BaseController
    {
        //private Tag4sEntities db = new Tag4sEntities();

        //
        // GET: /User/

        public ActionResult Index()
        {
            var users = db.Users.Include(u => u.User2).Include(u => u.UserRole);
            return View(users.ToList());
        }

        //
        // GET: /User/Details/5

        public ActionResult Details(Guid id)
        {
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        //
        // GET: /User/Create

        private IQueryable<UserRole> GetRoles(Guid? userRoleId)
        {
            var roles = db.UserRoles.AsQueryable();
            if (User.IsReseller)
            {
                roles = roles.Where(row => row.Name != "Administrator" && row.Name != "Reseller");
            }
            if (User.IsDepartment)
            {
                roles = roles.Where(row => row.Name != "Administrator" && row.Name != "Reseller" && row.Name != "Klant");
            }
            if (userRoleId.HasValue)
            {
                roles = roles.Where(row => row.Id == userRoleId.Value);
            }
            return roles;
        }

        private IQueryable<User> GetResellers(Guid? resellerId)
        {
            var resellers = db.Users.Where(u => u.Id == User.Id).Union(db.Users.Where(u => u.UserRole.Name.Equals("Reseller")));
            resellers = resellers.Union(db.Users.Where(u => u.Id == resellerId));
            if (!User.IsAdmin)
                resellers = resellers.Where(row=>row.Id == User.Id || row.Id== resellerId);
            return resellers.AsQueryable();
        }

        public ActionResult Create(Guid? userRoleId, Guid? resellerId)
        {
            ViewBag.ReselerId = new SelectList(GetResellers(resellerId), "Id", "FullName");

            ViewBag.UserRoleId = new SelectList(GetRoles(userRoleId), "Id", "Name", userRoleId);
            ViewBag.Id = new SelectList(db.UserPasswords, "UserId", "Password");
            ViewBag.CountryId = new SelectList(db.Countries, "Id", "Name");
            var model = new User {eId = Utilities.GetRandomSalt(5)};
            return View(model);
        }

        //
        // POST: /User/Create

        [HttpPost]
        public ActionResult Create(User user)
        {
            Guid? resellerIdGuid = null;
            var resellerId = Request["ReselerId"];
            if (!String.IsNullOrEmpty(resellerId))
            {
                resellerIdGuid = new Guid(resellerId);
            }
            else
            {
                ModelState.AddModelError("ReselerId","!");
            }

            if (ModelState.IsValid)
            {
                user.Id = Guid.NewGuid();
                if (User.IsReseller)
                {
                    //user.ReselerId = User.Id;
                    //user.UserRoleId = db.UserRoles.FirstOrDefault(row => row.Name == "Klant").Id;
                }
                db.Users.Add(user);
                try
                {
                    db.SaveChanges();
                }
                catch (DbEntityValidationException ex)
                {
                    throw ex;
                }
                //ClientTools.SendUserRegisteredMail(Session["Language"] as string, user.Id);
                //return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
                //return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
                BreadCrum.RemoveLast(Session);
                return RedirectToAction("Edit", new {id=user.Id});

            }

            Guid? userRoleIdGuid = null;
            var userRoleId = Request["userRoleId"];
            if (!String.IsNullOrEmpty(userRoleId))
            {
                userRoleIdGuid = new Guid(userRoleId);
            }


            ViewBag.ReselerId = new SelectList(GetResellers(resellerIdGuid), "Id", "FullName", user.ReselerId);
            ViewBag.UserRoleId = new SelectList(GetRoles(userRoleIdGuid), "Id", "Name", user.UserRoleId);
            ViewBag.Id = new SelectList(db.UserPasswords, "UserId", "Password", user.Id);
            ViewBag.CountryId = new SelectList(db.Countries, "Id", "Name");
            return View(user);
        }

        public ActionResult Credit(Guid id)
        {
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }

            return View(user);
        }

        [HttpPost]
        public ActionResult Credit(User user)
        {
            var user1 = db.Users.Find((user.Id));
            if (user1 != null)
            {
                User.Credit = User.Credit - ((user.Credit??0) - (user1.Credit??0));
                user1.Credit = user.Credit;
                db.SaveChanges();
            }
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

        //
        // GET: /User/Edit/5

        public ActionResult Edit(Guid id)
        {
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            ViewBag.ReselerId = new SelectList(GetResellers(user.ReselerId), "Id", "FullName", user.ReselerId);
            ViewBag.UserRoleId = new SelectList(GetRoles(user.UserRoleId), "Id", "Name", user.UserRoleId);
            ViewBag.Id = new SelectList(db.UserPasswords, "UserId", "Password", user.Id);
            ViewBag.CountryId = new SelectList(db.Countries, "Id", "Name",user.CountryId);
            return View(user);
        }

        //
        // POST: /User/Edit/5

        [HttpPost]
        public ActionResult Edit(User user)
        {
            if (user.Id == User.Id)
            {
                ClearUser();
            }
            var resellerId = Request["ReselerId"];
            if (String.IsNullOrEmpty(resellerId))
            {
                ModelState.AddModelError("ReselerId", "!");
            }
            if (ModelState.IsValid)
            {
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                db.Entry(user).State = EntityState.Detached;
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            ViewBag.ReselerId = new SelectList(GetResellers(user.ReselerId), "Id", "FullName", user.ReselerId);
            ViewBag.UserRoleId = new SelectList(GetRoles(user.UserRoleId), "Id", "Name", user.UserRoleId);
            ViewBag.Id = new SelectList(db.UserPasswords, "UserId", "Password", user.Id);
            ViewBag.CountryId = new SelectList(db.Countries, "Id", "Name", user.CountryId);
            return View(user);
        }

        //
        // GET: /User/Delete/5

        public ActionResult Delete(Guid id)
        {
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            if (user.UserContracts.Any() || user.User1.Any() || user.Invoices.Any())
            {
                var translation = TranslationDictionary;
                ViewBag.ErrorMessage = "User cannot be deleted".TranslateString(ref translation);
            }
            return View(user);
        }

        //
        // POST: /User/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id, bool? stillDelete, FormCollection collection)
        {
            var defaultResellerId = ReadAppSetting("DefaultResellerId");
            if (string.IsNullOrWhiteSpace(defaultResellerId))
            {
                return RedirectToAction("Index", "Home");
            }
            var resellerId = new Guid(defaultResellerId);

            User user = db.Users.Find(id);
            
            if (user.Id == resellerId)
            {
                var translation = TranslationDictionary;
                ViewBag.ErrorMessage = "User cannot be deleted".TranslateString(ref translation);
                return View("Delete", user);
                
            }


            var delete = collection["stillDelete"];
            if (stillDelete ?? false || !string.IsNullOrEmpty(delete))
            {

                //remove clients
                var customers =
                    db.Users.Where(u => u.UserRole.Name.Equals("Klant") && u.User2.Id.Equals(id));
                foreach (var customer in customers)
                {
                    customer.ReselerId = User.Id;
                }

                //resellers
                customers =
                    db.Users.Where(u => u.UserRole.Name.Equals("Reseller") && u.User2.Id.Equals(id));
                foreach (var customer in customers)
                {
                    customer.ReselerId = User.Id;
                }

                //department
                customers =
                    db.Users.Where(u => u.UserRole.Name.Equals("Afdeling") && u.User2.Id.Equals(id));
                foreach (var customer in customers)
                {
                    customer.ReselerId = User.Id;
                }

                //administrator
                customers =
                    db.Users.Where(u => u.UserRole.Name.Equals("Administrator") && u.User2.Id.Equals(id));
                foreach (var customer in customers)
                {
                    customer.ReselerId = User.Id;
                }

                //user contracts
                var contracts = user.UserContracts.ToList();
                foreach (var contract in contracts)
                {
                    contract.UserId = User.Id;
                }

                //copy the credit from the deleted to the deletee
                User.Credit = (User.Credit??0) + (user.Credit??0);
                //db.SaveChanges();
                db.Users.Remove(user);
            }
            else
            {
                user.Disabled = true;
            }
            try
            {

                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            catch (Exception)
            {

                var translation = TranslationDictionary;
                ViewBag.ErrorMessage = "User cannot be deleted".TranslateString(ref translation);
                return View("Delete",user);
            }
            //return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

    }
}