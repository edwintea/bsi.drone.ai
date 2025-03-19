using ApiVisionCaseList.Application.Interface.Context;
using ApiVisionCaseList.Application.Interface.Repository;
using ApiVisionCaseList.Application.Misc;
using ApiVisionCaseList.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Persistence.Repository
{
    public class CaseStatusRepository : ICaseStatusRepository
    {
        private readonly ICaseContext _context;

        public CaseStatusRepository(ICaseContext context)
        {
            _context = context;
        }

        public async Task<IList<CaseStatus>> GetCaseStatus(CancellationToken cancellationToken)
        {
            return await _context.CaseStatus.ToListWithNoLockAsync(cancellationToken);
        }
    }
}
