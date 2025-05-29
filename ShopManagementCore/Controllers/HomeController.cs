using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using ShopManagementCore.Models;
using ShopManagementCore.Service;
using System.Diagnostics;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Rendering;
using ShopManagementCore.Repository;

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
                    HttpContext.Session.SetString("UserID", (user.CustomerId).ToString());
                    HttpContext.Session.SetString("UserName", user.Name);

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

            //return View();
        }

        [HttpPost]
        public IActionResult AddType(string TypeName)
        {
            var type = new TblType { ProductType = TypeName };
            _userService.AddType(type);
            TempData["Message"] = "Type added successfully!";
            return RedirectToAction("AdminDashboard");
        }


        

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
        [HttpGet]
        public IActionResult GetSizesByProductId(int productId)
        {
            var sizes = _userService.GetProductSizes(productId)
                .Select(s => new {
                    ProductSizeIds = s.ProductSizeId,     // ✅ Use PascalCase to match JS
                    ProductSizes = s.ProductSize

                }).ToList();



            return Json(sizes);  // ✅ Don't stringify or return string here
        }


        [HttpGet]
        public IActionResult GetPriceBySizeId(int sizeId)
        {
            // You can query your database for the price using the sizeId
            //var size = _context.ProductSizes.FirstOrDefault(s => s.Id == sizeId);

            var size = _userService.GetProductPrice(sizeId);

            if (size != null)
            {
                return Json(size.ProductPrice); // return the price as JSON
            }

            return Json(0); // or return an error value
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
