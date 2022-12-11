using Dapper;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Threading.Tasks;

internal class PrintCountBuyersInEachCity
{
    public static async Task Print(SqlConnection connection)
    {
        using (IDbConnection db = new SqlConnection(connection.ConnectionString))
        {
            var cmd = new SqlCommand("CountBuyersInEachCity", connection)
            {
                CommandType = CommandType.StoredProcedure
            };

            foreach (var t in db.Query<CountBuyersInEachCity>("EXEC CountBuyersInEachCity").ToList())
                Console.WriteLine(t.Count + " " + t.NameCity);
        }
    }
}

record class CountBuyersInEachCity(int Count, string NameCity);