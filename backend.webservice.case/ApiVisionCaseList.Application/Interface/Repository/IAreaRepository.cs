using ApiVisionCaseList.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.Interface.Repository
{
    public interface IAreaRepository
    {
        Task<Area> GetArea(decimal lat,decimal longti, CancellationToken cancellationToken);
        Task<string> GetDescriptionFromLatLong(decimal lat, decimal longti, CancellationToken cancellationToken);
        
    }
}
