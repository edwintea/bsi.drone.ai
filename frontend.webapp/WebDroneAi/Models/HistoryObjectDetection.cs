using System.Text.Json.Serialization;
namespace WebDroneAi.Models
{
    public class HistoryObjectDetection
    {
        public IList<HistoryObjectDetectionData>? Data { get; set; }
    }
    public class HistoryObjectDetectionData
    {
        [JsonPropertyName("url_file")]
        public string? urlFile { get;set; }
        [JsonPropertyName("url_fileobject")]
        public string? urlFileObject { get;set; }
    }
}
