using ApiVisionCaseList.Application.Interface;
using ApiVisionCaseList.Application.Interface.Repository;
using ApiVisionCaseList.Application.Interface.Service;
using ApiVisionCaseList.Application.Misc;
using ApiVisionCaseList.Application.Models.Email;
using ApiVisionCaseList.Domain.CustomEntities;
using ApiVisionCaseList.Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace ApiVisionCaseList.Application.UseCases.Command.AssignToEmail
{
    internal sealed class AssigntoEmailCommandHandler : IRequestHandler<AssigntoEmailCommand,AssigntoEmailDto>
    {
        private readonly IEmailService _emailService;
        private readonly ICaseRepository _case;
        private readonly Utils _utils;
        private readonly IUploadConfiguration _upload;
        public AssigntoEmailCommandHandler(IEmailService emailService, ICaseRepository caseRepository,Utils utils, IUploadConfiguration upload)
        {
            _emailService = emailService;
            _case = caseRepository;
            _utils = utils;
            _upload = upload;
        }
        public async Task<AssigntoEmailDto> Handle(AssigntoEmailCommand request,CancellationToken cancellationToken)
        {
            var emailMessage = new EmailMessage()
            {
                To = request.Email,
                Subject = "New Bird Drop Finding - Case ID "+request.Id,
                IdCase = request.Id,
                Area = request.Area,
                NamaAssign = request.Name
            };
            await _case.UpdateDataAssignTo(request.Id, request.Assignor, cancellationToken);

            await _emailService.SendAsync(emailMessage,cancellationToken);
            
            return new AssigntoEmailDto()
            {
                Success = true,
                Message="Berhasil"
            };
        }
        
    }
}
