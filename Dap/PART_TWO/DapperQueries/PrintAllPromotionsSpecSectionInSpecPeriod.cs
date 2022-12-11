using Dapper;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Diagnostics.Metrics;
using System.Threading.Tasks;

// Відобразити всі акції товару конкретного розділу за вказаний проміжок часу
internal class PrintAllPromotionsSpecSectionInSpecPeriod : IQuery
{
    public Task Print(SqlConnection connection)
    {
        using (IDbConnection db = new SqlConnection(connection.ConnectionString))
        {
            Console.Write("Введіть назву розділу: ");
            string? name = Console.ReadLine();

            Console.Write("Введіть проміжок часу[mm.dd.yyyy:mm.dd.yyyy]: ");
            string[]? country = Console.ReadLine()?.Split(':');
            Console.WriteLine(string.Join(' ',country));

            /*
            var result = db.Query<Buyer> // виклик процедури
                (
                    "AllPromotionsSpecSectionInSpecPeriod", // назва процедури
                    new // параметри для процедури
                    {
                        Name = name,
                        Country = country
                    },
                    commandType: CommandType.StoredProcedure // тип команди збережувана процедура
                ).ToList();

            result.ForEach(t => Console.WriteLine(t.ID_Buyer + " " + t.Name + " " + t.Birthday + " " + t.Email + " " + t.ID_Country + " " + t.ID_City));
            */
        }

        return Task.CompletedTask;
    }
}