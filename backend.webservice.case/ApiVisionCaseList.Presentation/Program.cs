using ApiVisionCaseList.Application;
using ApiVisionCaseList.Infrastructure;
using ApiVisionCaseList.Persistence;
using Newtonsoft.Json.Serialization;
namespace ApiVisionCaseList.Presentation
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.

            builder.Services.AddControllers().AddNewtonsoftJson(x =>
            {
                x.SerializerSettings.ContractResolver = new DefaultContractResolver
                {
                    NamingStrategy = new SnakeCaseNamingStrategy()

                };
                x.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
            });
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddApplication().AddPersistence(builder.Configuration).AddInfrastructure();
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();
            builder.Services.AddMapping();
            builder.Services.AddCors(policy =>
            {
                policy.AddPolicy("Cors", opt => opt.AllowAnyHeader().AllowAnyOrigin().AllowAnyMethod());
            });
            var app = builder.Build();
            app.UseCors("Cors");
            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();
            app.AddApplicationStructure();
            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}
