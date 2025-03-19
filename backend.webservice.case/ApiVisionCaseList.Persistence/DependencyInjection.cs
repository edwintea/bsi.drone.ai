using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using ApiVisionCaseList.Application.Misc;
using ApiVisionCaseList.Domain.Infrastructure;
using Microsoft.EntityFrameworkCore;
using ApiVisionCaseList.Application.Interface.Context;
using ApiVisionCaseList.Persistence.Context;
namespace ApiVisionCaseList.Persistence
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddPersistence(this IServiceCollection services,IConfiguration configuration)
        {
            var Configdatabase = ParseFile.ParseFileJson<ConfigDb>
            (configuration.GetSection("ConnectionString").Value!);
            services.AddDbContext<ICaseContext, CaseContext>(options =>
            options.UseLazyLoadingProxies().UseNpgsql(Configdatabase?.Db));
            services.AddDbContext<IAreaContext, AreaContext>(options => options.UseLazyLoadingProxies().UseNpgsql(Configdatabase?.DbArea));
            services.AddServicesMapping();
            return services;
        }
    }
}
