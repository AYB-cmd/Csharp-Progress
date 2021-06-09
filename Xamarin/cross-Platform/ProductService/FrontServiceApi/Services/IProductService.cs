using FrontServiceApi.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FrontServiceApi.Services
{
    public interface IProductService
    {
        Task<IEnumerable<Product>> GetProductById(int productId);
    }
}