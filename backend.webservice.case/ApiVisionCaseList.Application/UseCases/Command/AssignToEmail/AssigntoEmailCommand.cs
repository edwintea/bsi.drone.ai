using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.UseCases.Command.AssignToEmail
{
    public record AssigntoEmailCommand : IRequest<AssigntoEmailDto>
    {
        public int Id { get; set; }
        public string? Email { get; set; }
        public int Assignor { get; set; }
        public string? Name { get; set; }
        public decimal Lat { get; set; }
        public decimal Long { get; set; }
        public string? Area { get; set; }
    }
}
