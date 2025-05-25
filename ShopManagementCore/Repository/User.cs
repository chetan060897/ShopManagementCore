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

        public TblRagistration Login(string UserName, string Password)
        {
            return _context.TblRagistrations
                           .FirstOrDefault(u => u.Email == UserName && u.Password == Password);
        }

    }
}
