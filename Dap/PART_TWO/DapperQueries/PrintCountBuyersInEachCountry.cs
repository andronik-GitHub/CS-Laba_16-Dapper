using Dapper;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Threading.Tasks;

// Відобразити кількість покупців у кожній країні
internal class PrintCountBuyersInEachCountry : IQuery
{
    public Task Print(SqlConnection connection)
    {
        using (IDbConnection db = new SqlConnection(connection.ConnectionString))
        {
            foreach (var t in db.Query<CountCountry>("EXEC CountBuyersInEachCountry").ToList()) // виклик процедури
                Console.WriteLine(t.Count + " " + t.NameCountry);
        }

        return Task.CompletedTask;
    }
}

record class CountCountry(int Count, string NameCountry);