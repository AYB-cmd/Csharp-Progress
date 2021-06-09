using FrontService.Data;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FrontService.Services
{
    public interface ICategoryService
    {
        Task<IEnumerable<Category>> GetCategories();
    }
}