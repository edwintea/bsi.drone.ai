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
    public class ObjectCaseConfiguration : IEntityTypeConfiguration<ObjectCase>
    {
        public void Configure(EntityTypeBuilder<ObjectCase> builder)
        {
            builder.HasKey(x => x.Id);

            builder.Property(x => x.Id)
                .HasColumnName("id");

            builder.Property(x => x.DetectedId)
                .HasColumnName("detected_id");

            builder.Property(x => x.DetectedConfidence)
                .HasColumnName("detected_confidence");

            builder.Property(x => x.FirstImg)
                .HasColumnName("first_img");

            builder.Property(x => x.FirstXmin)
                .HasColumnName("first_xmin");

            builder.Property(x => x.FirstYmin)
                .HasColumnName("first_ymin");

            builder.Property(x => x.FirstXmax)
                .HasColumnName("first_xmax");

            builder.Property(x => x.FirstYmax)
                .HasColumnName("first_ymax");

            builder.Property(x => x.LastImg)
                .HasColumnName("last_img");

            builder.Property(x => x.LastXmin)
                .HasColumnName("last_xmin");

            builder.Property(x => x.LastYmin)
                .HasColumnName("last_ymin");

            builder.Property(x => x.LastXmax)
                .HasColumnName("last_xmax");

            builder.Property(x => x.LastXmin)
                .HasColumnName("last_xmin");

            builder.Property(x => x.Lat)
                .HasColumnName("lat");

            builder.Property(x => x.Long)
                .HasColumnName("long");

            builder.Property(x => x.Location)
                .HasColumnName("location");

            builder.Property(x => x.Container)
                .HasColumnName("container");

            builder.Property(x => x.CreatedAt)
                .HasColumnName("created_at");

            builder.Property(x => x.UpdatedAt)
                .HasColumnName("updated_at");

            builder.ToTable("object");
        }
    }
}
