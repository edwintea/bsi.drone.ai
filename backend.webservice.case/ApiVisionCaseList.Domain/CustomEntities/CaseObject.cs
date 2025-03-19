using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Domain.CustomEntities
{
    public class CaseObject
    {
        public int Id { get; set; }
        public decimal Lat { get; set; }
        public decimal Long { get; set; }
        public int? AssignTo { get; set; }
        public string? Source { get; set; }
        public string? FirstImg { get; set; }
        public string? StatusName { get; set; }
        public string? Area { get; set; }
        public string? AreaCarPool { get; set; }
        public int? StatusId { get; set; }
    }
}
