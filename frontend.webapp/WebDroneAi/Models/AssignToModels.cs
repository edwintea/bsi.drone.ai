using System.Text.Json.Serialization;

namespace WebDroneAi.Models
{
    public class AssignModelsReponse
    {
        public IList<AssignToModels>? Data { get; set; }
    }
    public class AssignToModels
    {
        public int Id { get; set; }
        [JsonPropertyName("fullname")]
        public string? NamaAssign { get; set; }
        public string? Email { get; set; }
        public decimal? Lat { get; set; }
        public decimal? Long { get; set; }
        public string? Area { get; set; }
    }
}
