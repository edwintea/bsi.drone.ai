using Microsoft.Extensions.DependencyInjection;
using ApiVisionCaseList.Application.Interface;
using ApiVisionCaseList.Infrastructure.Notification;
using ApiVisionCaseList.Infrastructure.AzureBlob;
using ApiVisionCaseList.Application.Interface.Service;
using ApiVisionCaseList.Infrastructure.ManagedFileUploader;
namespace ApiVisionCaseList.Infrastructure
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddInfrastructure(this IServiceCollection services)
        {

            services.AddScoped<IEmailService, EmailService>();
            services.AddScoped<IAzureBlob, AzureBlobService>();
            services.AddScoped<IUploadConfiguration, WebHostConfiguration>();
            return services;
        }
    }
}
