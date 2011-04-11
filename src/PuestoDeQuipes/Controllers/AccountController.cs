using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Web.Mvc;
using System.Web.Security;
using Facebook;
using PuestoDeQuipes.Models;

namespace PuestoDeQuipes.Controllers
{

    [HandleError]
    public class AccountController : Controller
    {
        #region original account info code
        //public IFormsAuthenticationService FormsService { get; set; }
        //public IMembershipService MembershipService { get; set; }

        //protected override void Initialize(RequestContext requestContext)
        //{
        //    if (FormsService == null) { FormsService = new FormsAuthenticationService(); }
        //    if (MembershipService == null) { MembershipService = new AccountMembershipService(); }

        //    base.Initialize(requestContext);
        //}

        //// **************************************
        //// URL: /Account/LogOn
        //// **************************************

        //public ActionResult LogOn()
        //{
        //    return View();
        //}

        //[HttpPost]
        //public ActionResult LogOn(LogOnModel model, string returnUrl)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        if (MembershipService.ValidateUser(model.UserName, model.Password))
        //        {
        //            FormsService.SignIn(model.UserName, model.RememberMe);
        //            if (!String.IsNullOrEmpty(returnUrl))
        //            {
        //                return Redirect(returnUrl);
        //            }
        //            else
        //            {
        //                return RedirectToAction("Index", "Home");
        //            }
        //        }
        //        else
        //        {
        //            ModelState.AddModelError("", "The user name or password provided is incorrect.");
        //        }
        //    }

        //    // If we got this far, something failed, redisplay form
        //    return View(model);
        //}

        //// **************************************
        //// URL: /Account/LogOff
        //// **************************************

        //public ActionResult LogOff()
        //{
        //    FormsService.SignOut();

        //    return RedirectToAction("Index", "Home");
        //}

        //// **************************************
        //// URL: /Account/Register
        //// **************************************

        //public ActionResult Register()
        //{
        //    ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
        //    return View();
        //}

        //[HttpPost]
        //public ActionResult Register(RegisterModel model)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        // Attempt to register the user
        //        MembershipCreateStatus createStatus = MembershipService.CreateUser(model.UserName, model.Password, model.Email);

        //        if (createStatus == MembershipCreateStatus.Success)
        //        {
        //            FormsService.SignIn(model.UserName, false /* createPersistentCookie */);
        //            return RedirectToAction("Index", "Home");
        //        }
        //        else
        //        {
        //            ModelState.AddModelError("", AccountValidation.ErrorCodeToString(createStatus));
        //        }
        //    }

        //    // If we got this far, something failed, redisplay form
        //    ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
        //    return View(model);
        //}

        //// **************************************
        //// URL: /Account/ChangePassword
        //// **************************************

        //[Authorize]
        //public ActionResult ChangePassword()
        //{
        //    ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
        //    return View();
        //}

        //[Authorize]
        //[HttpPost]
        //public ActionResult ChangePassword(ChangePasswordModel model)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        if (MembershipService.ChangePassword(User.Identity.Name, model.OldPassword, model.NewPassword))
        //        {
        //            return RedirectToAction("ChangePasswordSuccess");
        //        }
        //        else
        //        {
        //            ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
        //        }
        //    }

        //    // If we got this far, something failed, redisplay form
        //    ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
        //    return View(model);
        //}

        //// **************************************
        //// URL: /Account/ChangePasswordSuccess
        //// **************************************

        //public ActionResult ChangePasswordSuccess()
        //{
        //    return View();
        //}
        #endregion

        private const string logoffUrl = "http://localhost:3434/";
        private const string redirectUrl = "http://localhost:3434/Account/OAuth/";

        /// <summary>
        /// Logon to application
        /// </summary>
        public ActionResult LogOn(string returnUrl)
        {
            var oAuthClient = new FacebookOAuthClient(FacebookApplication.Current);
            oAuthClient.RedirectUri = new Uri(redirectUrl);
            var loginUri = oAuthClient.GetLoginUrl(new Dictionary<string, object> { { "state", returnUrl } });
            return Redirect(loginUri.AbsoluteUri);
        }


        /// <summary>
        ///  Facebook authentication
        /// </summary>
        public ActionResult OAuth(string code, string state)
        {
            FacebookOAuthResult oauthResult;
            if (FacebookOAuthResult.TryParse(Request.Url, out oauthResult))
            {
                if (oauthResult.IsSuccess)
                {

                    string url = string.Format(@"https://graph.facebook.com/oauth/access_token?client_id=146563355411375&client_secret=03232f1f920aec6f4e4600105f1dfba4&scope=publish_stream&grant_type=client_credentials&redirect_uri={0}", redirectUrl);

                    var request = (HttpWebRequest)WebRequest.Create(url);

                    var response = (HttpWebResponse)request.GetResponse();
                    var reader = new StreamReader(response.GetResponseStream());
                    var token = reader.ReadToEnd();
                    var accessToken = token.Split('=')[1];

                    var expiresOn = DateTime.MaxValue;

                    var fbClient = new FacebookClient(accessToken);
                    dynamic me = fbClient.Get("drquipe");
                    string facebookId = me.id;

                    InMemoryUserStore.Add(new FacebookUser
                    {
                        AccessToken = accessToken,
                        Expires = expiresOn,
                        FacebookId = facebookId,
                        Name = (string)me.username,
                    });

                    FormsAuthentication.SetAuthCookie(facebookId, false);
                }

                return RedirectToAction("Index", "Productos");

            }


            return RedirectToAction("Index", "Home");
        }

        /// <summary>
        /// Log off from application
        /// </summary>
        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            var oAuthClient = new FacebookOAuthClient();
            oAuthClient.RedirectUri = new Uri(logoffUrl);
            var logoutUrl = oAuthClient.GetLogoutUrl();
            return Redirect(logoutUrl.AbsoluteUri);
        }
    }
}
