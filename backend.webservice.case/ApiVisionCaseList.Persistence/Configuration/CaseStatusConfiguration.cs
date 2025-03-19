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
    public class CaseStatusConfiguration : IEntityTypeConfiguration<CaseStatus>
    {
        public void Configure(EntityTypeBuilder<CaseStatus> builder)
        {
            builder.HasKey(x => x.Id);

            builder.Property(x => x.Id)
                .HasColumnName("id");

            builder.Property(x => x.Name)
                .HasColumnName("name");

            builder.Property(x => x.CreatedAt)
                .HasColumnName("created_at");

            builder.Property(x => x.TerminatedAt)
                .HasColumnName("terminated_at");

            builder.ToTable("case_status");
        }
    }
}
