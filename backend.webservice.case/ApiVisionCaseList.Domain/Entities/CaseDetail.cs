using ApiVisionCaseList.Domain.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Domain.Entities
{
    public class CaseDetail : BaseEntity
    {
        public int CaseId { get; set; }
        public string? Status { get; set; }
        public string? Assigned { get; set; }
        public string? Description { get; set; }
    }
}
