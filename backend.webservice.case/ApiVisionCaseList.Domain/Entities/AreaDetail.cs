using ApiVisionCaseList.Domain.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Domain.Entities
{
    public class AreaDetail : BaseEntityArea
    {
        public int AreaId { get; set; }
        public string? Description { get; set; }
    }
}
