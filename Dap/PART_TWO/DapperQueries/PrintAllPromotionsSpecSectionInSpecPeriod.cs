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
            string[]? time = Console.ReadLine()?.Split(':');

            
            if (time != null)
            {
                var result = db.Query<PromotionalProducts> // виклик процедури
                (
                    "AllPromotionsSpecSectionInSpecPeriod", // назва процедури
                    new // параметри для процедури
                    {
                        Name = name,
                        Start = time[0],
                        End = time[1]
                    },
                    commandType: CommandType.StoredProcedure // тип команди збережувана процедура
                ).ToList();

                result.ForEach(t => Console.WriteLine(t.ID_Stock + " " + t.NameProduct + " " + t.ID_Section + " " + t.StartTime + " " + t.EndTime));
            }
        }

        return Task.CompletedTask;
    }
}