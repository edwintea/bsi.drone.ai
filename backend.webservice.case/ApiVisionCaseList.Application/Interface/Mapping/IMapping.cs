using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.Interface.Mapping
{
    public interface IMapping
    {
        Task<string> GetArea(decimal longti, decimal lat, CancellationToken cancellationToken);
    }
}
