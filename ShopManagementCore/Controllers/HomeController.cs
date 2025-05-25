using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using ShopManagementCore.Models;
using ShopManagementCore.Service;
using System.Diagnostics;
using Microsoft.EntityFrameworkCore;

namespace ShopManagementCore.Controllers
{
    public class HomeController : Controller
    {
        private readonly IUser _userService;

        public HomeController(IUser userService)
        {
            _userService = userService;
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Login(TblRagistration model)
        {
            if (ModelState.IsValid)
            {
                var user = _userService.Login(model.Email, model.Password);
                if (user != null)
                {
                    HttpContext.Session.SetString("Username", user.Email);
                    return RedirectToAction("Index", "Home");
                }

                ModelState.AddModelError("", "Invalid email or password.");
            }

            return View(model);
        }


        public IActionResult Register()
        {
            return View();
        }

      

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
