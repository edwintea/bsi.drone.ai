using ApiVisionCaseList.Application.UseCases.Command.AssignToEmail;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ApiVisionCaseList.Presentation.Controllers.Assign
{
    [Route("/assign")]
    [ApiController]
    public class AssignController : BaseController
    {
        [HttpPost]
        [Route("/sendemail")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> read([FromBody] AssigntoEmailCommand request)
        {
            return Ok(await Mediator.Send(request));
        }
    }
}
