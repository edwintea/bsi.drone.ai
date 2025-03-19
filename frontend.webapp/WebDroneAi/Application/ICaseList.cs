using WebDroneAi.Models;

namespace WebDroneAi.Application
{
    public interface ICaseList
    {
        Task<CaseListModels> GetData();
    }
}
