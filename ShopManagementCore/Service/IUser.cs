using ShopManagementCore.Models;

namespace ShopManagementCore.Service
{
    public interface IUser
    {
        List<TblRagistration> getAll();
        TblRagistration getUser(int CustomerId);
        TblRagistration Login(string UserName, string Password);

    }
}
