using Dapper;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Threading.Tasks;

// Показати найкраще місто за кількістю покупців
internal class PrintTopCityByCountBuyers : IQuery
{
    public Task Print(SqlConnection connection)
    {
        using (IDbConnection db = new SqlConnection(connection.ConnectionString))
        {
            foreach (var t in db.Query<TopCityByCountBuyers>("EXEC TopCityByCountBuyers").ToList()) // виклик процедури
                Console.WriteLine($"{t.ID_City} {t.Name,-30} {t.ID_Country} {t.NumCount}");
        }

        return Task.CompletedTask;
    }
}