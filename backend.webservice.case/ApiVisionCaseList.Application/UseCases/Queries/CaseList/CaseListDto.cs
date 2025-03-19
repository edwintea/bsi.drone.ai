using ApiVisionCaseList.Application.Interface.Mapping;
using ApiVisionCaseList.Application.Mapster;
using ApiVisionCaseList.Application.Models.Query;
using ApiVisionCaseList.Domain.CustomEntities;
using ApiVisionCaseList.Domain.Entities;
using Mapster;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.UseCases.Queries.CaseList
{
    public record CaseListDto : PaginationDto
    {
        public IList<CaseListData>? Data { get; set; }
    }
    public class CaseListData : MapsterBase<CaseObject, CaseListData>
    {
        public int Id { get; set; }
        public int? AssignTo { get; set; }
        public string? Source { get; set; }
        public string? TextProgress { get; set; }
        public string? CasePhoto { get; set; }
        public decimal Long { get; set; }
        public decimal Lat { get; set; }
        public string? Area { get; set; }
        public string? AreaCarPool { get; set; }
        public int? StatusId { get; set; }
        public override void AddCustomMappings()
        {
            SetCustomMappings()
                .Map(bDto => bDto.Id, opt => opt.Id)
                .Map(bDto => bDto.AssignTo, opt => opt.AssignTo)
                .Map(bDto => bDto.Source, opt => opt.Source)
                .Map(bDto => bDto.TextProgress, opt => opt.StatusName)
                .Map(bDto => bDto.StatusId,opt=>opt.StatusId)
                .Map(bDto => bDto.CasePhoto,opt=>opt.FirstImg)
                .Map(bDto => bDto.Area,opt=>opt.Area)
                .Map(bDto => bDto.AreaCarPool, opt=>opt.AreaCarPool)
                .Map(bDto => bDto.Long,opt=>opt.Long)
                .Map(bDto => bDto.Lat,opt=>opt.Lat);
        }
    }

}
