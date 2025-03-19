using ApiVisionCaseList.Application.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ApiVisionCaseList.Application.Models.Email;
using MimeKit;
using MailKit.Net.Smtp;
using ApiVisionCaseList.Application.Misc;
using ApiVisionCaseList.Domain.CustomEntities;
using ApiVisionCaseList.Application.Interface.Repository;
using ApiVisionCaseList.Application.Interface.Service;

namespace ApiVisionCaseList.Infrastructure.Notification
{
    public class EmailService : IEmailService
    {
        private readonly ICaseRepository _caseRepository;
        private readonly IUploadConfiguration _uploadConfiguration;
        public EmailService(ICaseRepository caseRepository, IUploadConfiguration uploadConfiguration)
        {
            _caseRepository = caseRepository;
            _uploadConfiguration = uploadConfiguration;
        }

        public async Task SendAsync(EmailMessage message, CancellationToken cancellationToken)
        {
            try
            {
                var getData = await _caseRepository.GetCaseJoinObjectById(message.IdCase, cancellationToken);

                var mimeMessage = new MimeMessage();
                mimeMessage.From.Add(new MailboxAddress("testingvision","jonathan45801@gmail.com"));
                mimeMessage.To.Add(new MailboxAddress("no Reply", message.To));
                mimeMessage.Subject = message.Subject;
                var builder = new BodyBuilder();
                mimeMessage.Body = BodyEmail(getData,message.NamaAssign,message.Area,builder);

                SmtpClient smtpClient = new SmtpClient();

                await smtpClient.ConnectAsync(
                   "smtp.gmail.com",587, false);

                await smtpClient.AuthenticateAsync(
                    "jonathan45801@gmail.com", "mycrpsccauopppca"
                    );

                await smtpClient.SendAsync(mimeMessage);
                await smtpClient.DisconnectAsync(true);
            }
            catch (Exception ex)
            { 
                throw new InvalidOperationException(ex.Message);
            }
        }
        private MimeEntity BodyEmail(CaseObject data, string namaAssign,string area, BodyBuilder builder)
        {
            string PathImage = _uploadConfiguration.GetContentRootPath() + Utils.GetImageDetection(data.FirstImg);

            var imageBuilder = builder.LinkedResources.Add(PathImage);
            imageBuilder.ContentId = "imagearea";
            StringBuilder bodyEmail = new StringBuilder();
            bodyEmail.Append("<table border=" + 1 + " width=" + 600 + ">");
            bodyEmail.Append("<tr> ");
            bodyEmail.Append("<th> Case Id </th> <th>Case Photo</th> <th>Lat</th> <th>Long</th> <th>Area</th> <th>AssignTo</th>");
            bodyEmail.Append("</tr>");
            bodyEmail.Append("<tbody>");
            bodyEmail.Append("<tr><td>" + data.Id + "</td> <td><img src=cid:imagearea width=" + 100 + " height=" + 100 + "/> </td>");
            bodyEmail.Append("<td>" + data.Lat + "</td> <td>" + data.Long + "</td> <td>" + area + "</td> <td>" + namaAssign + "</td></tr>");
            bodyEmail.Append("</tbody>");
            bodyEmail.Append("</table>");
            
            builder.HtmlBody = bodyEmail.ToString();
         
            return builder.ToMessageBody();
        }
    }
}
