using ApiVisionCaseList.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.Interface.Repository
{
    public interface ICaseStatusRepository
    {
        Task<IList<CaseStatus>> GetCaseStatus(CancellationToken cancellationToken);
    }
}
