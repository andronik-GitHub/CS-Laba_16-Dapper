using Dapper;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Threading.Tasks;

// Відобразити кількість покупців у кожному місті
internal class PrintAVGCountCityInAllCountry : IQuery
{
    public async Task Print(SqlConnection connection)
    {
        using (IDbConnection db = new SqlConnection(connection.ConnectionString))
        {
            var cmd = new SqlCommand()
            {
                Connection = connection,
                CommandText = "AVGCountCityInAllCountry",
                CommandType = CommandType.StoredProcedure
            };

            var param = new SqlParameter
            {
                ParameterName = "@City",
                SqlDbType = SqlDbType.Float,
                Direction = ParameterDirection.Output
            };
            cmd.Parameters.Add(param);
            param = new SqlParameter
            {
                ParameterName = "@Country",
                SqlDbType = SqlDbType.Float,
                Direction = ParameterDirection.Output
            };
            cmd.Parameters.Add(param);

            await cmd.ExecuteNonQueryAsync();

            var City = (double)cmd.Parameters["@City"].Value;
            var Country = (double)cmd.Parameters["@Country"].Value;

            Console.WriteLine(City / Country);
        }
    }
}

record class AVGCountCityInAllCountry(float Count);