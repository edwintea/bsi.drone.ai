using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Infrastructure
{
    public static class ApplicationInjection
    {
        public static IApplicationBuilder AddApplicationStructure(this IApplicationBuilder builder)
        {
            builder.UseStaticFiles(new StaticFileOptions
            {
                FileProvider = new PhysicalFileProvider(
                 Path.Combine(Directory.GetCurrentDirectory(), "ImageDetection")),
                RequestPath = "/ImageDetection"
            });
            return builder;
        }
    }
}
