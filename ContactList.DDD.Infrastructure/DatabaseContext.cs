using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ContactList.DDD.Infrastructure
{
    public class DatabaseContext
    {
        public static string connRute
        {
            get { return "Server=sql_server;Database=master;User Id=SA;Password=Carta14123!;MultipleActiveResultSets=true"; }
        }
    }
}
