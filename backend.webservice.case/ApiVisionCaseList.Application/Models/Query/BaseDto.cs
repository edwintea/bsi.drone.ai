using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.Models.Query
{
    public record BaseDto
    {
        public bool Success { set; get; }
        public string? Message { set; get; }
        public string? Origin { set; get; }
    }
}
