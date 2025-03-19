using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using WebDroneAi.Data;
using MudBlazor;
using MudBlazor.Services;

namespace WebDroneAi
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add environment variables to configuration.
            builder.Configuration
                .SetBasePath(Directory.GetCurrentDirectory())  // Optional: base path for config files
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)  // Load appsettings.json
                .AddJsonFile($"appsettings.{builder.Environment.EnvironmentName}.json", optional: true)  // Load environment-specific settings
                .AddEnvironmentVariables();  // Override settings with environment variables

            // Add services to the container.
            builder.Services.AddRazorPages();
            builder.Services.AddServerSideBlazor();
            builder.Services.AddSingleton<WeatherForecastService>();
            builder.Services.AddHttpClient();
            builder.Services.AddMudServices();
            builder.Services.AddMudBlazorDialog();
            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();

            app.UseStaticFiles();

            app.UseRouting();

            app.MapBlazorHub();
            app.MapFallbackToPage("/_Host");

            app.Run();
        }
    }
}
