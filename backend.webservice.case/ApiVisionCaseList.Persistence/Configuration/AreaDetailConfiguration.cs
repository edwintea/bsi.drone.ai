using ApiVisionCaseList.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Persistence.Configuration
{
    public class AreaDetailConfiguration : IEntityTypeConfiguration<AreaDetail>
    {
        public void Configure(EntityTypeBuilder<AreaDetail> builder)
        {
            builder.Property(x => x.Id)
                .HasColumnName("id");
            builder.Property(x => x.AreaId)
                .HasColumnName("area_id");
            builder.Property(x=>x.Description)
                .HasColumnName("description");

            builder.ToTable("area_detail");
        }
    }
}
