using ApiVisionCaseList.Application.Interface.Context;
using ApiVisionCaseList.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Persistence.Context
{
    public class CaseContext : DbContext, ICaseContext
    {
        public CaseContext(DbContextOptions<CaseContext> options) : base(options)
        {
            AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);
        }

        public DbSet<Case> CaseList { get; set; }
        public override DatabaseFacade Database => base.Database;

        public DbSet<CaseDetail> CaseDetail { get; set; }
        public DbSet<CaseStatus> CaseStatus { get; set; }
        public DbSet<ObjectCase> ObjectCase { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(typeof(CaseContext).Assembly);
        }
        public override Task<int> SaveChangesAsync(CancellationToken cancellationToken)
        {
            return base.SaveChangesAsync(cancellationToken);
        }
    }
}
