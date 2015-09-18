using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using Tag4s.Data;
using Tag4s.Helpers;

namespace Tag4s.Controllers
{
    public class UserPasswordController : BaseController
    {
        private IQueryable<UserPassword> Model()
        {
            var userPassword = db.UserPasswords.AsQueryable();

            switch (Filter.Key)
            {
                case Filters.ViewFilterKeys.userId:
                    userPassword = userPassword.Where(row => row.UserId == Filter.Id);
                    break;
            }

            return userPassword;
        }
        //
        // GET: /UserPassword/

        public ActionResult Index()
        {
            switch (Filter.Key)
            {
                case Filters.ViewFilterKeys.userId:
                    ViewBag.User = db.Users.Find(Filter.Id);
                    break;
            }

            var isAccountAdmin = Session["IsAccountAdmin"] as bool?;
            if (isAccountAdmin.HasValue && isAccountAdmin == true)
            {
                return View(Model());
            }
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

        //
        // GET: /UserPassword/Details/5

        public ActionResult Details(Guid id)
        {
            UserPassword userpassword = db.UserPasswords.Find(id);
            if (userpassword == null)
            {
                return HttpNotFound();
            }
            return View(userpassword);
        }

        //
        // GET: /UserPassword/Create

        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(db.Users, "Id", "FullName");
            switch (Filter.Key)
            {
                case Filters.ViewFilterKeys.userId:
                    ViewBag.UserId = new SelectList(db.Users, "Id", "FullName", Filter.Id);
                    break;
            }
            return View();
        }

        //
        // POST: /UserPassword/Create

        [HttpPost]
        public ActionResult Create(UserPassword userpassword, FormCollection collection)
        {
            var translation = TranslationDictionary;

            if (collection["Password"] != collection["PasswordConfirm"] && !string.IsNullOrEmpty(collection["Password"]))
            {
                ModelState.AddModelError("Password", "!");
            }
            userpassword.UserName = userpassword.EmailAddress;
            var userPasswordExistingList =
                db.UserPasswords.Where(
                    row => row.UserName == userpassword.UserName);

            if (userPasswordExistingList.Any())
            {
                ModelState.AddModelError("EmailAddress", "User already exists".TranslateString(ref translation));
            }
            if (ModelState.IsValid && !userPasswordExistingList.Any())
            {
                userpassword.Id = Guid.NewGuid();
                db.UserPasswords.Add(userpassword);
                db.SaveChanges();
                //return RedirectToAction("Edit", "User", new { id = userpassword.UserId });
                if (!string.IsNullOrEmpty(collection["SendEmail"]))
                    ClientTools.SendUserRegisteredMail(Session["Language"] as string, userpassword.Id);
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }

            ViewBag.UserId = new SelectList(db.Users, "Id", "FullName", userpassword.UserId);
            return View(userpassword);

        }

        public ActionResult SendEmail(Guid id)
        {
            UserPassword userpassword = db.UserPasswords.Find(id);
            if (userpassword == null)
            {
                return HttpNotFound();
            }
            ClientTools.SendUserRegisteredMail(Session["Language"] as string, userpassword.Id);
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

        //
        // GET: /UserPassword/Edit/5

        public ActionResult Edit(Guid id)
        {
            UserPassword userpassword = db.UserPasswords.Find(id);
            if (userpassword == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserId = new SelectList(db.Users, "Id", "FullName", userpassword.UserId);
            return View(userpassword);
        }

        //
        // POST: /UserPassword/Edit/5

        [HttpPost]
        public ActionResult Edit(UserPassword userpassword, FormCollection collection)
        {
            var translation = TranslationDictionary;

            if (collection["Password"] != collection["PasswordConfirm"] && !string.IsNullOrEmpty(collection["Password"]))
            {
                ModelState.AddModelError("Password", "!");
            }

            userpassword.UserName = userpassword.EmailAddress;

            var userPasswordExistingList =
                db.UserPasswords.Where(
                    row => row.UserName == userpassword.UserName && row.Id!= userpassword.Id);
            if (userPasswordExistingList.Any())
            {
                ModelState.AddModelError("EmailAddress", "User already exists".TranslateString(ref translation));
            }
            if (ModelState.IsValid && !userPasswordExistingList.Any())
            {
                var luserPassword = db.UserPasswords.Find(userpassword.Id);
                if (!string.IsNullOrEmpty(userpassword.Password))
                {
                    luserPassword.Password = userpassword.Password;
                }
                luserPassword.UserName = userpassword.UserName;
                luserPassword.FullName = userpassword.UserName;
                luserPassword.EmailAddress = userpassword.EmailAddress;
                luserPassword.IsAccountAdmin= userpassword.IsAccountAdmin;
                luserPassword.IsDisabled = userpassword.IsDisabled;
                luserPassword.CanFinance = userpassword.CanFinance;
                luserPassword.CanQr = userpassword.CanQr;
                luserPassword.CanStatistics = userpassword.CanStatistics;

                db.SaveChanges();
                //return RedirectToAction("Edit", "User", new { id = userpassword.UserId });
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }
            ViewBag.UserId = new SelectList(db.Users, "Id", "FullName", userpassword.UserId);
            return View(userpassword);
        }

        //
        // GET: /UserPassword/Delete/5

        public ActionResult Delete(Guid id)
        {
            UserPassword userpassword = db.UserPasswords.Find(id);
            if (userpassword == null)
            {
                return HttpNotFound();
            }
            return View(userpassword);
        }

        //
        // POST: /UserPassword/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            UserPassword userpassword = db.UserPasswords.Find(id);
            db.UserPasswords.Remove(userpassword);
            db.SaveChanges();
            //return RedirectToAction("Edit", "User", new { id = userpassword.UserId });
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

        }

        //protected override void Dispose(bool disposing)
        //{
        //    db.Dispose();
        //    base.Dispose(disposing);
        //}

        public ActionResult ResetMessage(Guid userPasswordId)
        {
            var newResetPass = GenerateRandomPass();
            var userPassword = db.UserPasswords.Find(userPasswordId);
            userPassword.Password = newResetPass;
            db.SaveChanges();
            ClientTools.SendUserRegisteredMail(Session["Language"] as string, userPassword.UserId);

            return RedirectToAction("Index", "UserPassword");
        }

        private string GenerateRandomPass()
        {
            string strchar = "abcdefghijklmnopqrstuvwxyz0123456789#+@&$ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            string str = "";
            Random rnd = new Random();
            for (int i = 0; i <= 7; i++)
            {
                int iRandom = rnd.Next(0, strchar.Length - 1);
                str += strchar.Substring(iRandom, 1);
            }
            return str;
        }

    }
}