using ApiVisionCaseList.Application.Interface;
using ApiVisionCaseList.Application.Interface.Repository;
using ApiVisionCaseList.Application.Models.Query;
using Mapster;
using MapsterMapper;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.UseCases.Queries.CaseList
{
    internal sealed class CaseListQueryHandler : IRequestHandler<CaseListQuery,CaseListDto>
    {
        private readonly IAzureBlob _azureBlob;
        private readonly ICaseRepository _caseRepository;
        private readonly IAreaRepository _areaRepository;
        private readonly IAreaDetailRepository _areaDetailRepository;
        public CaseListQueryHandler(IAzureBlob azureBlob , ICaseRepository caseRepository, 
            IAreaRepository areaRepository, IAreaDetailRepository areaDetailRepository) 
        {
            _azureBlob = azureBlob;
            _caseRepository = caseRepository;
            _areaRepository = areaRepository;
            _areaDetailRepository  = areaDetailRepository;
        }
        public async Task<CaseListDto> Handle(CaseListQuery request,CancellationToken cancellationToken)
        {
            var data =await _caseRepository.GetCaseObject(request.PagingLimit,request.PagingPage,cancellationToken);
            foreach (var item in data.Select(x=>x.Id))
            {
                foreach(var item2 in data.Where(x=>x.Id == item))
                {
                    item2.FirstImg = await _azureBlob.DownloadAzureBlobByName(item2.FirstImg, cancellationToken);
                    item2.Area = await _areaRepository.GetDescriptionFromLatLong(item2.Lat, item2.Long, cancellationToken);
                    item2.AreaCarPool = await _areaDetailRepository.GetDescriptionFromLongLat(item2.Lat, item2.Long, cancellationToken);
                }
            }
            int totalData = await _caseRepository.CountCaseObject(cancellationToken);
            var result = data.Adapt<IList<CaseListData>>();
            var pagination = new PaginationData()
            {
                CurrentPage = request.PagingPage,
                PageSize = request.PagingLimit,
                FirstRowOnPage = (request.PagingPage - 1) * request.PagingLimit + 1,
                LastRowOnPage = Math.Min(request.PagingPage * request.PagingLimit, totalData),
                RowCount = totalData
            };
            return new CaseListDto()
            {
                Data = result,
                Success = true,
                Message = "Berhasil",
                Pagination = pagination
            };
        }
    }
}
