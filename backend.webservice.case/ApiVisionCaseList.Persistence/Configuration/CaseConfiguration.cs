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
    public class CaseConfiguration : IEntityTypeConfiguration<Case>
    {
        public void Configure(EntityTypeBuilder<Case> builder)
        {
            builder.HasKey(x => x.Id);

            builder.Property(x => x.Id)
                .HasColumnName("id");

            builder.Property(x => x.Descripton)
                .HasColumnName("description");

            builder.Property(x => x.Long)
                .HasColumnName("long");

            builder.Property(x => x.Lat)
                .HasColumnName("lat");

            builder.Property(x => x.AssignTo)
                .HasColumnName("assign_to");

            builder.Property(x => x.Source)
                .HasColumnName("source");

            builder.Property(x => x.ObjectId)
                .HasColumnName("object_id");

            builder.Property(x => x.StatusId)
                .HasColumnName("status_id");

            builder.Property(x => x.CreatedAt)
                .HasColumnName("created_at");

            builder.Property(x => x.UpdatedAt)
                .HasColumnName("updated_at");

            builder.ToTable("case");

        }
    }
}
