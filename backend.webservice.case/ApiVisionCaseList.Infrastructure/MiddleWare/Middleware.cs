using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Infrastructure.MiddleWare
{
    public class Middleware
    {
        private readonly RequestDelegate _next;
        public Middleware(RequestDelegate next)
        {
            _next = next;
        }
        public async Task InvokeAsync(HttpContext context)
        {
            var contexts = context.Request;
            var request = contexts.HttpContext.Request;

            if(request.Path.ToString().StartsWith("/ImageDetection",StringComparison.CurrentCultureIgnoreCase))
            {
                await _next.Invoke(context);
                return;
            }
        }
    }
}
