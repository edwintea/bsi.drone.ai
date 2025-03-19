﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Domain.CustomEntities
{
    public class CaseJoinCaseStatus
    {
        public int Id { get; set; }
        public int Lat { get; set; }
        public int Long { get; set; }
        public int? AssignTo { get; set; }
        public string? Descripton { get; set; }
        public string? Source { get; set; }
        public int ObjectId { get; set; }
        public int StatusId { get; set; }
        public string? StatusName { get; set; }
    }
}
