using ApiVisionCaseList.Application.Interface;
using ApiVisionCaseList.Application.Interface.Context;
using ApiVisionCaseList.Application.Interface.Repository;
using ApiVisionCaseList.Application.Misc;
using ApiVisionCaseList.Domain.CustomEntities;
using ApiVisionCaseList.Domain.Entities;
using Azure.Core;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Persistence.Repository
{
    public class CaseRepository : ICaseRepository
    {
        private readonly ICaseContext _context;
        public CaseRepository(ICaseContext context, IAzureBlob azureBlob) 
        { 
            _context = context;
        }
        public async Task<IList<Case>> GetCase(CancellationToken cancellationToken)
        {
            return await _context.CaseList.ToListWithNoLockAsync(cancellationToken);
        }

        public async Task<IList<CaseJoinCaseStatus>> GetCaseJoinStatus(CancellationToken cancellationToken)
        {
            var join = await (from a in _context.CaseList
                       join b in _context.CaseStatus on a.StatusId equals b.Id
                       select new CaseJoinCaseStatus()
                       {
                           Id = a.Id,
                           Lat=a.Lat,
                           Long=a.Long,
                           AssignTo=a.AssignTo,
                           Descripton=a.Descripton,
                           Source=a.Source,


                       }).ToListWithNoLockAsync(cancellationToken);
            return join;
        }

        public async Task<CaseObject> GetCaseJoinObjectById(int Id, CancellationToken cancellationToken)
        {
            var join = await (from a in _context.CaseList
                              join b in _context.ObjectCase on a.ObjectId equals b.Id
                              where a.Id == Id
                              select new CaseObject()
                              {
                                  Id = a.Id,
                                  Lat = a.Lat,
                                  Long = a.Long,
                                  AssignTo = a.AssignTo,
                                  Source = a.Source,
                                  FirstImg = b.FirstImg

                              }).FirstOrDefaultWithNoLockAsync(cancellationToken);
            return join;
        }

        public async Task<IList<CaseObject>> GetCaseObject(int pagingLimit, int pagingPage, CancellationToken cancellationToken)
        {
            var skip = (pagingPage - 1) * pagingLimit;
            var join = await (from a in _context.CaseList
                              join b in _context.ObjectCase on a.ObjectId equals b.Id
                              from c in _context.CaseStatus.Where(x=>x.Id == a.StatusId).DefaultIfEmpty()
                              select new CaseObject()
                              {
                                  Id = a.Id,
                                  Lat = a.Lat,
                                  Long = a.Long,
                                  AssignTo = a.AssignTo,
                                  Source = a.Source,
                                  FirstImg = b.FirstImg,
                                  StatusName = c.Name,
                                  StatusId = a.StatusId


                              }).OrderBy(x=>x.Id).Skip(skip).Take(pagingLimit).ToListWithNoLockAsync(cancellationToken);

            return join;
        }

        public async Task<int> UpdateDataAssignTo(int Id, int IdAssignNor, CancellationToken cancellationToken)
        {
            try
            {
                var getData = await _context.CaseList.Where(x => x.Id == Id).FirstOrDefaultWithNoLockAsync(cancellationToken);
                if (getData is not null)
                {
                    getData.AssignTo = IdAssignNor;
                    getData.UpdatedAt = DateTime.Now;
                    getData.StatusId = 2;
                }
                return await _context.SaveChangesAsync(cancellationToken);
            }
            catch(Exception ex)
            {
                return 0;
            }
        }

        public async Task<int> CountCaseObject(CancellationToken cancellationToken)
        {
            var join = await(from a in _context.CaseList
                             join b in _context.ObjectCase on a.ObjectId equals b.Id
                             select new CaseObject()
                             {
                                 Id = a.Id,
                                 Lat = a.Lat,
                                 Long = a.Long,
                                 AssignTo = a.AssignTo,
                                 Source = a.Source,
                                 FirstImg = b.FirstImg

                             }).CountWithNoLockAsync(cancellationToken);
            return join;
        }
    }
}
