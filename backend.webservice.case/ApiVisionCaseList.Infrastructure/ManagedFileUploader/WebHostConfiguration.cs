using ApiVisionCaseList.Application.Interface.Service;
using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Infrastructure.ManagedFileUploader
{
    public class WebHostConfiguration : IUploadConfiguration
    {
        private IHostingEnvironment _env;
        public WebHostConfiguration(IHostingEnvironment env) 
        {
            _env = env;
        }

        public string GetContentRootPath()
        {
            return _env.ContentRootPath;
        }
    }
}
