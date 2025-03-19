using ApiVisionCaseList.Application.Interface.Mapping;
using ApiVisionCaseList.Application.Interface.Repository;
using ApiVisionCaseList.Application.Misc;
using ApiVisionCaseList.Persistence.Mapping;
using ApiVisionCaseList.Persistence.Repository;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Persistence
{
    public static class AddServiceMapping
    {

        public static IServiceCollection AddServicesMapping(this IServiceCollection services)
        {
            services.AddScoped<ICaseRepository, CaseRepository>();
            services.AddScoped<ICaseStatusRepository, CaseStatusRepository>();
            services.AddScoped<IAreaRepository, AreaRepository>();
            services.AddScoped<IAreaDetailRepository, AreaDetailRepository>();
            services.AddScoped<IMapping, MappingProfile>();
            services.AddSingleton<Utils>();
            services.AddHttpContextAccessor();
            return services;
        }
    }
}
