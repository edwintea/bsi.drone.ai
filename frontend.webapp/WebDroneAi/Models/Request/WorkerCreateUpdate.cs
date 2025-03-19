using System.Text.Json.Serialization;

namespace WebDroneAi.Models.Request
{
    public class WorkerCreateUpdate
    {
        public WorkerCreateUpdateData? Data { get; set; }
    }
    public class WorkerCreateUpdateData
    {
        [JsonPropertyName("user_name")]
        public string? UserName { get; set; }
        public string? Password { get; set; }
        public string? Email { get; set; }
        [JsonPropertyName("full_name")]
        public string? FullName { get; set; }
        [JsonPropertyName("status_id")]
        public int StatusId { get; set; }
        [JsonPropertyName("role_id")]
        public int RoleId { get; set; }
    }
}
