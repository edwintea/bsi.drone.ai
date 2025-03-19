using System.Text.Json.Serialization;

namespace WebDroneAi.Models
{
    public class PostHistoryObjectDetection
    {
        [JsonPropertyName("namefile")]
        public string? nameFile { get; set; }
        [JsonPropertyName("category")]
        public string? Category { get; set; }
    }
}
