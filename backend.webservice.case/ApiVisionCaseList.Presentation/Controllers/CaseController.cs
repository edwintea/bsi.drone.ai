using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ApiVisionCaseList.Application.UseCases.Queries.CaseList;
namespace ApiVisionCaseList.Presentation.Controllers
{
    [ApiController]
    public class CaseController : BaseController
    {
        [HttpGet]
        [Route("/case/list")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> GetCase([FromQuery] CaseListQuery Query)
        {
            return Ok(await Mediator.Send(Query));
        }
    }
}
