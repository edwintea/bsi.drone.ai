using ApiVisionCaseList.Application.Interface;
using ApiVisionCaseList.Application.Interface.Service;
using ApiVisionCaseList.Application.Misc;
using Azure;
using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;
using Org.BouncyCastle.Asn1.X509;
using Org.BouncyCastle.Bcpg.OpenPgp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Infrastructure.AzureBlob
{
    public class AzureBlobService : IAzureBlob
    {
        private readonly Utils _utils;
        private readonly IUploadConfiguration _uploadConfiguration;
        public AzureBlobService(Utils utils, IUploadConfiguration uploadConfiguration)
        {
            _utils = utils;
            _uploadConfiguration = uploadConfiguration;
        }
        public async Task DownloadAzureBlob(CancellationToken cancellationToken)
        {
            string connectionString = "DefaultEndpointsProtocol=https;AccountName=rndgeneralstorage;AccountKey=wm5ByC5UJLK5w6jq80XzVuMEvsMoLqiLPu//SaV+O8uOzzVslzRXfn8sLr4NUAIw0gdrmD4wy6PM+ASt83PAcA==;EndpointSuffix=core.windows.net";
            BlobContainerClient container = new BlobContainerClient(connectionString, "imagedetection");
            await container.CreateIfNotExistsAsync();
            var resultSegment = container.GetBlobsAsync().AsPages(default, 2);
            await foreach (Page<BlobItem> blobPage in resultSegment)
            {

                foreach (BlobItem blobItem in blobPage.Values.Where(x => x.Name.Contains("26072024")))
                {
                    BlobClient blobClient = new BlobClient(connectionString, "imagedetection", blobItem.Name);
                    await FunctionDownload(blobClient, blobItem.Name);
                }

            }

        }

        public async Task<string> DownloadAzureBlobByName(string nameFile, CancellationToken cancellationToken)
        {
            string paths = _uploadConfiguration.GetContentRootPath() + Utils.GetImageDetection(nameFile);
            string result = string.Empty;

            if (!File.Exists(paths))
            {
                string connectionString = "DefaultEndpointsProtocol=https;AccountName=rndstorage2;AccountKey=99JL4roWL4FtwmZLXeu3jVzxs1Ckh0BVrL4SiTW4FAKc7PPaLekLXt1bgLiibORDdx0MKg7MRxTU+AStq4ULXw==;EndpointSuffix=core.windows.net";
                BlobServiceClient blobServiceClient = new BlobServiceClient(connectionString);
                BlobContainerClient container = blobServiceClient.GetBlobContainerClient("imagedetection");
                await container.CreateIfNotExistsAsync();
                var resultSegment = container.GetBlobsAsync(BlobTraits.None, BlobStates.None, nameFile, cancellationToken).AsPages(default, 1);
                
                await foreach (Page<BlobItem> blobPage in resultSegment)
                {

                    foreach (BlobItem blobItem in blobPage.Values.Where(x => x.Name == nameFile))
                    {
                        var blob = container.GetBlobClient(blobItem.Name);
                        result = await FunctionDownLoadString(blob, blobItem.Name);

                    }

                }
                return result;
            }
            else
            {
                result = _utils.GetValidUrl(Utils.GetImageDetection(nameFile));
                return result;
            }
           
        }

        public async Task FunctionDownload(BlobClient blobClient, string namafile)
        {
            string folder = string.Empty;
            string[] splitName = namafile.Split('/');
            if (splitName.Length > 1)
            {
                folder = "/" + splitName[0];
                namafile = splitName[1];
            }
            
            string path = "D:\\Api\\rndapicaselist\\BSI.Rnd.DroneAI\\ApiVisionCaseList.Presentation\\ImageDetection" + folder;

            //FileStream fileStream = File.OpenWrite(localFilePath);
            var urlpath = Path.Combine(path, namafile);
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            await blobClient.DownloadToAsync(urlpath);


        }
        public async Task<string> FunctionDownLoadString(BlobClient blobClient, string namafile)
        {
            string[] splitName = namafile.Split('/');
            string folderSplit = string.Empty;
            if (splitName.Length > 1)
            {
                for(int i=0; i < splitName.Length -1; i++)
                {
                    folderSplit += splitName[i]+"/";
                }
            }
            string folder = _uploadConfiguration.GetContentRootPath() + Utils.GetImageDetection(folderSplit);
            string paths = _uploadConfiguration.GetContentRootPath() + Utils.GetImageDetection(namafile);
            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }
            if (!File.Exists(paths))
            {
                using (var stream = await blobClient.OpenReadAsync())
                {
                    using(MemoryStream memoryStream = new MemoryStream())
                    {
                        FileStream fileStream = File.OpenWrite(paths);
                        await stream.CopyToAsync(fileStream);
                        fileStream.Close();
                    }
                    stream.Close();
                }

            }
            string result = _utils.GetValidUrl(Utils.GetImageDetection(namafile));
            return result;
        }
    }
}
