using System.Text.Json.Serialization;

namespace WebDroneAi.Models
{
    public class SendEmailAssign
    {
        public int? Id { get; set; }
        public string? Email { get; set; }
        public int? Assignor { get; set; }
        public string? Name { get; set; }
        public decimal?  Long { get; set; }
        public decimal? Lat { get; set; }
        public string? Area { get; set; }
    }
}
