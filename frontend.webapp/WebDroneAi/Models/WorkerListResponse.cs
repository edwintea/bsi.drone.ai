using System.Text.Json.Serialization;

namespace WebDroneAi.Models
{
    public class WorkerListResponse
    {
        public IList<WorkerListData>? Data { get; set; }
    }
    public class WorkerListData
    {
        [JsonPropertyName("id")]
        public int Id { get; set; }
        [JsonPropertyName("username")]
        public string? Username { get; set; }
        [JsonPropertyName("fullname")]
        public string? Fullname { get; set; }
        [JsonPropertyName("email")]
        public string? Email { get; set; }
        [JsonPropertyName("role")]
        public string? Role { get; set; }
    }
}
