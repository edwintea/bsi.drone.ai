using ApiVisionCaseList.Domain.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Domain.Entities
{
    public class CaseStatus : BaseEntity
    {
        public string? Name { get; set; }
        public DateTime? TerminatedAt { get; set; }
    }
}
