using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.Models.Email
{
    public class EmailMessage
    {
        public EmailMessage()
        {
            CC = new HashSet<string>();
            BCC = new HashSet<string>();
            Attachments = new HashSet<string>();
        }

        public string? To { set; get; }
        public string? Subject { set; get; }
        public int IdCase { set; get; }
        public string? NamaAssign { get; set; }
        public string? Area { get; set; }
        public ICollection<string> CC { set; get; }
        public ICollection<string> BCC { set; get; }
        public ICollection<string> Attachments { set; get; }
    }
}
