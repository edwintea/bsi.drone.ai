using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.Misc
{
    public class Utils
    {
        private readonly IHttpContextAccessor _contextAccessor;
        public Utils(IHttpContextAccessor contextAccessor)
        {
            _contextAccessor = contextAccessor;
        }
     

        public static string GetImageDetection(string filename)
        {
            return "/ImageDetection/" + filename;
        }

        public static bool IsRequestSecure(HttpRequest request)
        {
            string X_FORWARDED_PROTO = "x_forwarded_proto";
            string HTTPS = "https";
            return request.Headers.Keys.Contains(X_FORWARDED_PROTO) &&
                request.Headers[X_FORWARDED_PROTO].ToString().ToUpper().Equals("HTTPS") &&
                request.Headers.Keys.Contains(HTTPS) && request.Headers[HTTPS].ToString().ToUpper().Equals("ON");
        }
        public string GetValidUrl(string path)
        {
            if (this.IsValidUrl(path)) return path;

            var request = _contextAccessor.HttpContext.Request;

            string requestScheme = request.Scheme;

            if (IsRequestSecure(request))
            {
                requestScheme = "https";
            }

            var host = request.Host.ToUriComponent();
            var pathBase = request.PathBase.ToUriComponent();

            return $"{requestScheme}://{host}{pathBase}{path}";
        }
        private bool IsValidUrl(string path)
        {
            Uri uriResult;
            bool result = Uri.TryCreate(path, UriKind.Absolute, out uriResult)
                && (uriResult.Scheme == Uri.UriSchemeHttp || uriResult.Scheme == Uri.UriSchemeHttps);

            return result;
        }
    }
}
