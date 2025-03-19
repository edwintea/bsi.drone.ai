using System.Text.Json.Serialization;

namespace WebDroneAi.Models.Query
{
    public class PaginationQuery
    {
        [JsonPropertyName("current_page")]
        public int CurrentPage { get; set; }
        [JsonPropertyName("page_count")]
        public int PageCount { get; set; }
        [JsonPropertyName("page_size")]
        public int PageSize { get; set; }
        [JsonPropertyName("row_count")]
        public int RowCount { get; set; }
        [JsonPropertyName("first_row_on_page")]
        public int FirstRowOnPage { set; get; }
        [JsonPropertyName("last_row_on_page")]
        public int LastRowOnPage { set; get; }
    }
}
