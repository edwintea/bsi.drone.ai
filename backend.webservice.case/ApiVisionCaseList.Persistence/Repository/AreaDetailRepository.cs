using ApiVisionCaseList.Application.Interface.Context;
using ApiVisionCaseList.Application.Interface.Repository;
using Microsoft.EntityFrameworkCore;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ApiVisionCaseList.Application.Misc;
namespace ApiVisionCaseList.Persistence.Repository
{
    public class AreaDetailRepository : IAreaDetailRepository
    {
        private readonly IAreaContext _areaContext;
        public AreaDetailRepository(IAreaContext areaContext) 
        {
            _areaContext= areaContext;
        }
        public async Task<string> GetDescriptionFromLongLat(decimal lat, decimal longti, CancellationToken cancellationToken)
        {
            var sqlparameter = new List<NpgsqlParameter>()
            {
                new NpgsqlParameter("lat",lat),
                new NpgsqlParameter("longti",longti)
            };
            string query = "select id, description from area_detail " +
                "where ST_Contains(geom, ST_SetSRID(ST_Point(@longti, @lat), 4326))";
            var data = await _areaContext.Area.FromSqlRaw(query, sqlparameter.ToArray()).FirstOrDefaultWithNoLockAsync(cancellationToken);
            string result = string.Empty;
            if (data is not null)
            {
                result = data.Description ?? string.Empty;
            }
            return result;
        }
    }
}
