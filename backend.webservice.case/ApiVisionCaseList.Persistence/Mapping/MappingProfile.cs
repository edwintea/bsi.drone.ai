using ApiVisionCaseList.Application.Interface.Mapping;
using ApiVisionCaseList.Application.Interface.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Persistence.Mapping
{
    public class MappingProfile : IMapping
    {
        public IAreaRepository _areaRepository;
        public MappingProfile(IAreaRepository areaRepository)
        {
            _areaRepository = areaRepository;
        }
        public async Task<string> GetArea(decimal longti, decimal lat, CancellationToken cancellationToken)
        {
            var data = await _areaRepository.GetArea(lat, longti, cancellationToken);
            return data.Description;
        }
    }
}
