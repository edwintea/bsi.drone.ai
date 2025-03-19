using ApiVisionCaseList.Domain.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Domain.Entities
{
    public class ObjectCase : BaseEntity
    {
        public string? DetectedId { get; set; }
        public decimal DetectedConfidence { get; set; }
        public string? FirstImg { get; set; }
        public decimal FirstXmin { get; set; }
        public decimal FirstYmin { get; set;}
        public decimal FirstXmax { get; set;}
        public decimal FirstYmax { get; set;}
        public string? LastImg { get; set; }
        public decimal LastXmin { get; set; }
        public decimal LastYmin { get; set; }
        public decimal LastXmax { get; set; }
        public decimal LastYmax { get; set; }
        public decimal Lat { get; set; }
        public decimal Long { get; set; }
        public string? Location { get; set; }
        public string? Container { get; set; }


    }
}
