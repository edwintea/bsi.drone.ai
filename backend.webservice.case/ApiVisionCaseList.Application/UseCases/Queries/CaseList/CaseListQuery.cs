using ApiVisionCaseList.Application.Models.Query;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.UseCases.Queries.CaseList
{
    public record CaseListQuery : PaginationQuery, IRequest<CaseListDto>
    {
    }
}
