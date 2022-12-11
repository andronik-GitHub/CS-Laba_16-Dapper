using Dapper;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Threading.Tasks;

// Відобразити топ-3 країн за кількістю покупців
internal class PrintTopCountryByCountBuyers : IQuery
{
    public Task Print(SqlConnection connection)
    {
        using (IDbConnection db = new SqlConnection(connection.ConnectionString))
        {
            foreach (var t in db.Query<TopCountryByCountBuyers>("EXEC TopThreeCountryByCountBuyers").ToList()) // виклик процедури
                Console.WriteLine($"{t.ID_Country} {t.Name,-30} {t.NumCount}");
        }

        return Task.CompletedTask;
    }
}