using Dapper;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Threading.Tasks;

// Відобразити кількість міст у кожній країні
internal class PrintCountCityInEachCountry : IQuery
{
    public Task Print(SqlConnection connection)
    {
        using (IDbConnection db = new SqlConnection(connection.ConnectionString))
        {
            var cmd = new SqlCommand()
            {
                Connection = connection,
                CommandText = "CountBuyersInEachCity",
                CommandType = CommandType.StoredProcedure
            };

            foreach (var t in db.Query<CountCityInEachCountry>("EXEC CountCityInEachCountry").ToList()) // виклик процедури
                Console.WriteLine(t.Count + " " + t.NameCountry);
        }

        return Task.CompletedTask;
    }
}

record class CountCityInEachCountry(int Count, string NameCountry);