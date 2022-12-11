using Dapper;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Threading.Tasks;

// Відобразити кількість покупців у кожному місті
internal class PrintAVGCountCityInAllCountry : IQuery
{
    public Task Print(SqlConnection connection)
    {
        using (IDbConnection db = new SqlConnection(connection.ConnectionString))
        {
            var cmd = new SqlCommand()
            {
                Connection = connection,
                CommandText = "AVGCountCityInAllCountry",
                CommandType = CommandType.StoredProcedure
            };

            foreach (var t in db.Query<AVGCountCityInAllCountry>("EXEC AVGCountCityInAllCountry")) // виклик процедури
                Console.WriteLine(t.Count + " " + t.NameCity);
        }

        return Task.CompletedTask;
    }
}

record class AVGCountCityInAllCountry(int Count, string NameCity);