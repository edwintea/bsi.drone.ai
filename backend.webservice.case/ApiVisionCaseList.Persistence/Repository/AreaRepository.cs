using ApiVisionCaseList.Application.Interface.Context;
using ApiVisionCaseList.Application.Interface.Repository;
using ApiVisionCaseList.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Npgsql;
using ApiVisionCaseList.Application.Misc;

namespace ApiVisionCaseList.Persistence.Repository
{
    public class AreaRepository : IAreaRepository
    {
        private readonly IAreaContext _areaContext;
        public AreaRepository(IAreaContext areaContext) 
        {
            _areaContext = areaContext;
        }
        public async Task<Area> GetArea(decimal lat, decimal longti, CancellationToken cancellationToken)
        {
            var sqlparameter = new List<NpgsqlParameter>()
            {
                new NpgsqlParameter("lat",lat),
                new NpgsqlParameter("longti",longti)
            };
            string query = "select a.id, a.description from area a inner join area_detail b on a.id = b.area_id " +
                "where ST_Contains(b.geom, ST_SetSRID(ST_Point(@longti, @lat), 4326))";
            return await _areaContext.Area.FromSqlRaw(query,sqlparameter.ToArray()).FirstOrDefaultWithNoLockAsync(cancellationToken);
        }

        public async Task<string> GetDescriptionFromLatLong(decimal lat, decimal longti, CancellationToken cancellationToken)
        {
            var sqlparameter = new List<NpgsqlParameter>()
            {
                new NpgsqlParameter("lat",lat),
                new NpgsqlParameter("longti",longti)
            };
            string query = "select a.id, a.description from area a inner join area_detail b on a.id = b.area_id " +
                "where ST_Contains(b.geom, ST_SetSRID(ST_Point(@longti, @lat), 4326))";
            var data = await _areaContext.Area.FromSqlRaw(query, sqlparameter.ToArray()).FirstOrDefaultWithNoLockAsync(cancellationToken);
            string result = string.Empty;
            if(data is not null)
            {
                result = data.Description??string.Empty;
            }
            return result ; 
        }
    }
}
