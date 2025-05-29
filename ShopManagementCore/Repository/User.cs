using ShopManagementCore.Models;
using ShopManagementCore.Service;

namespace ShopManagementCore.Repository
{
    public class User : IUser   // press control+ dot
    {
        private readonly ShopDbContext _context; // select all generate constructer

        public User(ShopDbContext context)
        {
            _context = context;
        }

        public List<TblRagistration> getAll()
        {
               return _context.TblRagistrations.ToList();
        }


        public TblRagistration getUser(int CustomerId)
        {
            return _context.TblRagistrations.FirstOrDefault(x => x.CustomerId == CustomerId);
        }

        public TblRagistration Login(string Type,string UserName, string Password)
        {
            return _context.TblRagistrations
                           .FirstOrDefault(u => u.Type == Type && u.Email == UserName && u.Password == Password);
        }

        public void Register(TblRagistration user)
        {
            _context.TblRagistrations.Add(user);
            _context.SaveChanges();
        }

        public TblRagistration? GetByEmail(string email)
        {
            return _context.TblRagistrations.FirstOrDefault(u => u.Email == email);
        }

        public void AddType(TblType type)
        {
            _context.TblTypes.Add(type);
            _context.SaveChanges();
        }

        public List<TblType> GetAllProductTypes()
        {
            return _context.TblTypes.ToList();
        }
        //public List<TblProductRagistration> GetAllProducts()
        //{
        //    return _context.TblProductRagistrations.ToList();
        //}

        public List<TblProductRagistration> GetAllProducts(int productTypeId)
        {
            return _context.TblProductRagistrations
                .Where(p => p.ProductTypeId == productTypeId)
                .ToList();
        }
        public List<TblProductSize> GetProductSizes(int productNameId)
        {
            return _context.TblProductSizes
                .Where(p => p.ProductNameId == productNameId)
                .ToList();
        }

        public TblProductSize? GetProductPrice(int productsizeid)
        {
            return _context.TblProductSizes.FirstOrDefault(u => u.ProductSizeId == productsizeid);
        }


        public void SaveProducts(TblProductRagistration Product)
        {
            _context.TblProductRagistrations.Add(Product);
            _context.SaveChanges();
        }



        public void SaveProductsSize(TblProductSize productSize)
        {
            _context.TblProductSizes.Add(productSize);
            _context.SaveChanges();
        }
    }
}
