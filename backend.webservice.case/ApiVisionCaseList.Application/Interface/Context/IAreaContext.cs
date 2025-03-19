using ApiVisionCaseList.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.Interface.Context
{
    public interface IAreaContext : IDisposable
    {
        DbSet<Area> Area { get; set; }
        DbSet<AreaDetail> AreaDetail { get; set; }
        Task<int> SaveChangesAsync(CancellationToken cancellationToken);
    }
}
