﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using ApiVisionCaseList.Application.Models.Email;
namespace ApiVisionCaseList.Application.Interface
{
    public interface IEmailService
    {
        Task SendAsync(EmailMessage message, CancellationToken cancellationToken);
    }
}
