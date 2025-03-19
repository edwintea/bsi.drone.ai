using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.Interface
{
    public interface IAzureBlob
    {
        Task DownloadAzureBlob(CancellationToken cancellationToken);
        Task<string> DownloadAzureBlobByName(string nameFile, CancellationToken cancellationToken);
    }
}
