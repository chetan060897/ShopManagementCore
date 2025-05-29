using ShopManagementCore.Models;

namespace ShopManagementCore.Service
{
    public interface IUser
    {
        List<TblRagistration> getAll();
        TblRagistration getUser(int CustomerId);
        TblRagistration Login(string Type,string UserName, string Password);

        void Register(TblRagistration user);
        TblRagistration? GetByEmail(string email);

        void AddType(TblType type);
        List<TblType> GetAllProductTypes();

        List<TblProductRagistration> GetAllProducts(int producttypeid);
        List<TblProductSize> GetProductSizes(int productnameid);
        TblProductSize? GetProductPrice(int productSizeId);
        
        void SaveProducts(TblProductRagistration product);
        void SaveProductsSize(TblProductSize productSize);
    }
}
