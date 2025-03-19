using ApiVisionCaseList.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.Interface.Context
{
    public interface ICaseContext : IDisposable
    {
        DbSet<Case> CaseList { get; set; }
        DbSet<CaseDetail> CaseDetail { get; set; }
        DbSet<CaseStatus> CaseStatus { get; set; }
        DbSet<ObjectCase> ObjectCase { get; set; }
        Task<int> SaveChangesAsync(CancellationToken cancellationToken);
    }
}
