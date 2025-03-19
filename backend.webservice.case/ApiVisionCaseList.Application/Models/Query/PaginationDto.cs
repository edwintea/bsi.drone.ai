using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.Models.Query
{
    public record PaginationDto : BaseDto
    {
        public PaginationData? Pagination { get; set; }
    }
    public class PaginationData
    {
        public int CurrentPage { get; set; }
        public int PageCount { get; set; }
        public int PageSize { get; set; }
        public int RowCount { get; set; }
        public int FirstRowOnPage { set; get; }
        public int LastRowOnPage { set; get; }
    }
}
