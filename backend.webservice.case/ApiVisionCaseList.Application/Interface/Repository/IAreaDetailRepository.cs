using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.Interface.Repository
{
    public interface IAreaDetailRepository
    {
        Task<string> GetDescriptionFromLongLat(decimal lat, decimal longti, CancellationToken cancellationToken);
    }
}
