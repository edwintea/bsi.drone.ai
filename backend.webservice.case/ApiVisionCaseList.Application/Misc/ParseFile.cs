using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace ApiVisionCaseList.Application.Misc
{
    public static class ParseFile
    {
        public static T? ParseFileJson<T>(string path)
        {
            JsonSerializerOptions options = new JsonSerializerOptions();
            options.Converters.Add(new DateTimeOffsetConverterUsingDateTimeParse());
            string fullpath = Path.GetFullPath(path);
            using (StreamReader jsonfile = new StreamReader(fullpath))
            {
                var json = jsonfile.ReadToEnd();
                T? config = JsonSerializer.Deserialize<T>(json)!;
                return config;
            }
        }
    }
}
