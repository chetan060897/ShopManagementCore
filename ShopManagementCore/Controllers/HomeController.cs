using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using ShopManagementCore.Models;
using ShopManagementCore.Service;
using System.Diagnostics;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Rendering;

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
                var user = _userService.Login(model.Type, model.Email, model.Password);
                if (user != null)
                {
                    // Store user session
                    HttpContext.Session.SetString("Username", user.Email);
                    HttpContext.Session.SetString("UserType", user.Type);

                    // Redirect based on Type
                    if (user.Type == "Admin")
                    {
                        return RedirectToAction("AdminDashboard", "Home");
                    }
                    else if (user.Type == "Customer")
                    {
                        return RedirectToAction("CustomerDashboard", "Home");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Unknown user type.");
                        return View(model);
                    }
                }

                ModelState.AddModelError("", "Invalid email or password.");
            }

            return View(model);
        }



        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public IActionResult Login(TblRagistration model)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var user = _userService.Login(model.Type,model.Email, model.Password);
        //        if (user != null)
        //        {
        //            HttpContext.Session.SetString("Username", user.Email);
        //            return RedirectToAction("Index", "Home");
        //        }

        //        ModelState.AddModelError("", "Invalid email or password.");
        //    }

        //    return View(model);
        //}


        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Register(TblRagistration model)
        {
            if (ModelState.IsValid)
            {
                // Check if user already exists (based on email or username)
                var existingUser = _userService.GetByEmail(model.Email);
                if (existingUser != null)
                {
                    ModelState.AddModelError("Email", "Email is already registered.");
                    return View(model);
                }

                // Save the user using the service
                _userService.Register(model);

                // Optional: store session or redirect to login
                TempData["Success"] = "Registration successful! Please login.";
                return RedirectToAction("Login");
            }

            return View(model);
        }


        public IActionResult CustomerDashboard()
        {

            return View();
        }

        [HttpPost]
        public IActionResult AddType(string TypeName)
        {
            var type = new TblType { ProductType = TypeName };
            _userService.AddType(type);
            TempData["Message"] = "Type added successfully!";
            return RedirectToAction("AdminDashboard");
        }


        //public IActionResult AddProduct()
        //{
        //    var types = _userService.GetAllProductTypes()
        //        .Select(t => new SelectListItem
        //        {
        //            Value = t.ProductTypeId.ToString(),
        //            Text = t.ProductType
        //        }).ToList();

        //    var model = new TblProductRagistration
        //    {
        //        ProductTypes = types
        //    };

        //    return View(model);
        //}


        [HttpPost]
        public IActionResult AddProduct(TblProductRagistration model)
        {
            // Save the user using the service
            _userService.SaveProducts(model);
            TempData["Message"] = "Product added successfully!";
            return RedirectToAction("AdminDashboard");
        }

        [HttpPost]
        public IActionResult AddSize(TblProductSize model)
        {
            _userService.SaveProductsSize(model);


            TempData["Message"] = "Size added successfully!";
            return RedirectToAction("AdminDashboard");
        }


        [HttpGet]
        public JsonResult GetProductsByType(int typeId)
        {
            var products = _userService.GetAllProducts(typeId)
                .Where(p => p.ProductTypeId == typeId)
                .Select(p => new
                {
                    id = p.ProductNameId,
                    name = p.ProductName
                }).ToList();

            return Json(products);
        }



        public IActionResult AdminDashboard()
        {
            var types = _userService.GetAllProductTypes()
               .Select(t => new SelectListItem
               {
                   Value = t.ProductTypeId.ToString(),
                   Text = t.ProductType
               }).ToList();

           
           // var products = _userService.GetAllProducts()
           //     .Select(p => new SelectListItem
           // {
           //Value = p.ProductNameId.ToString(),
           //Text = p.ProductName
           // }).ToList();


            var model = new TblProductRagistration
            {
                ProductTypes = types
               //ProductNames = products

            };


            return View(model);
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
