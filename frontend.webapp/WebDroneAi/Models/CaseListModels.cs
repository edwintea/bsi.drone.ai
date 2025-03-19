using System.Text.Json.Serialization;
using WebDroneAi.Models.Query;

namespace WebDroneAi.Models
{
    public class CaseListModelss
    {
        public IEnumerable<CaseListModels>? Data { get; set; }
        public PaginationQuery? Pagination { get; set; }
    }
    public class CaseListModels
    {
        [JsonPropertyName("id")]
        public int? caseId { get; set; }
        [JsonPropertyName("case_photo")]
        public string? casePhoto { get; set; }
        [JsonPropertyName("Lat")]
        public decimal? Lat { get; set; }

        [JsonPropertyName("Long")]
        public decimal? Long { get; set; }
        [JsonPropertyName("area")]
        public string? Area { get;set; }
        [JsonPropertyName("area_car_pool")]
        public string? AreaCarPool { get; set; }
        [JsonPropertyName("assign_to")]
        public int? assignTo { get; set; }
        [JsonPropertyName("status_id")]
        public int Progress { get; set; }
        [JsonPropertyName("text_progress")]
        public string? textProgress { get; set; }

        [JsonPropertyName("tanggal_detected")]
        public string? tanggalDetected { get; set; }
        
    }
    public class CaseListTableModels
    {
        public int TotalItems { get; set; }
        public IList<CaseListModels>? Data { get; set; }
    }
}
