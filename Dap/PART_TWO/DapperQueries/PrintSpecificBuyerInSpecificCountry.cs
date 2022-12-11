using Dapper;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Diagnostics.Metrics;
using System.Threading.Tasks;

// Відобразити конкретного покупця конкретної країни
internal class PrintSpecificBuyerInSpecificCountry : IQuery
{
    public async Task Print(SqlConnection connection)
    {
        using (IDbConnection db = new SqlConnection(connection.ConnectionString))
        {
            Console.Write("Введіть ім'я: ");
            string? name = Console.ReadLine();

            Console.Write("Введіть назву країни: ");
            string? country = Console.ReadLine();

            foreach (var t in connection.Query("SpecificBuyerInSpecificCountry", new { Name = name, Country = country }, commandType: CommandType.StoredProcedure).ToList()) // виклик процедури
                Console.WriteLine(t.ID_Buyer + " " + t.Name + " " + t.Birthday + " " + t.Email + " " + t.ID_Country + " " + t.ID_City);
        }
    }
}