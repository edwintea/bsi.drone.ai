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
    public class CaseDetailConfiguration : IEntityTypeConfiguration<CaseDetail>
    {
        public void Configure(EntityTypeBuilder<CaseDetail> builder)
        {
            builder.HasKey(x => x.Id);

            builder.Property(x => x.Id)
                .HasColumnName("id");

            builder.Property(x => x.CaseId)
                .HasColumnName("case_id");

            builder.Property(x=>x.Status)
                .HasColumnName("status");

            builder.Property(x => x.Assigned)
                .HasColumnName("assigned");

            builder.Property(x => x.Description)
                .HasColumnName("description");

            builder.Property(x => x.CreatedAt)
                .HasColumnName("created_at");

            builder.ToTable("case_detail");
        }
    }
}
