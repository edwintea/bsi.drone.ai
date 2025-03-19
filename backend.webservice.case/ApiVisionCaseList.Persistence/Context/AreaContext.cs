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
    public class AreaContext : DbContext, IAreaContext
    {
        public DbSet<Area> Area { get; set; }
        public DbSet<AreaDetail> AreaDetail { get; set; }

        public AreaContext(DbContextOptions<AreaContext> options) : base(options)
        {
            AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);
        }
        public override DatabaseFacade Database => base.Database;
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(typeof(AreaContext).Assembly);
        }
        public override Task<int> SaveChangesAsync(CancellationToken cancellationToken)
        {
            return base.SaveChangesAsync(cancellationToken);
        }
    }
}
