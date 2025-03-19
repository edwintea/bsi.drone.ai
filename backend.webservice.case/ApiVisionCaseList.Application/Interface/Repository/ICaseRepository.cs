using ApiVisionCaseList.Domain.CustomEntities;
using ApiVisionCaseList.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.Interface.Repository
{
    public interface ICaseRepository
    {
        Task<IList<Case>> GetCase(CancellationToken cancellationToken);
        Task<IList<CaseJoinCaseStatus>> GetCaseJoinStatus(CancellationToken cancellationToken);
        Task<CaseObject> GetCaseJoinObjectById(int Id, CancellationToken cancellationToken);
        Task<int> UpdateDataAssignTo(int Id,int IdAssignNor, CancellationToken cancellationToken);
        Task<IList<CaseObject>> GetCaseObject(int pagingLimit,int pagingPage,CancellationToken cancellationToken);
        Task<int> CountCaseObject(CancellationToken cancellationToken);
    }
}
