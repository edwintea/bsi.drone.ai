using Mapster;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.Mapster
{
    public abstract class MapsterBase<TDto, TSource> : IRegister
         where TDto : class, new()
         where TSource : class, new()
    {
        public TSource ToEntity()
        {
            return this.Adapt<TSource>();
        }

        public TSource ToEntity(TSource entity)
        {
            return (this as TDto).Adapt(entity);
        }

        public static TDto FromEntity(TSource entity)
        {
            return entity.Adapt<TDto>();
        }


        private TypeAdapterConfig Config { get; set; }

        public virtual void AddCustomMappings() { }


        protected TypeAdapterSetter<TDto, TSource> SetCustomMappings()
            => Config.ForType<TDto, TSource>();

        protected TypeAdapterSetter<TSource, TDto> SetCustomMappingsInverse()
            => Config.ForType<TSource, TDto>();

        public void Register(TypeAdapterConfig config)
        {

            Config = config;
            AddCustomMappings();
        }
    }
}
