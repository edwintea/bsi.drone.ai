using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.Models.Query
{
    public record PaginationQuery
    {
        [FromQuery(Name ="paging[limit]")]
        public int PagingLimit { get; set; }
        [FromQuery(Name ="paging[page]")]
        public int PagingPage { get; set; }

        [FromQuery(Name ="search")]
        public string? QuerySearch { get; set; }


    }
}
