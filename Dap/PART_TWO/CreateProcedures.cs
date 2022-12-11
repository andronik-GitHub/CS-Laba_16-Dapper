using Dapper;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Threading.Tasks;

internal class CreateProcedures
{
    public static async Task Create(SqlConnection connection)
    {
        string query = ""; // для код запиту
        var command = new SqlCommand(query,connection); // для виконування команд

        // Створення процедури [CountBuyersInEachCity]
        // Відобразити кількість покупців у кожному місті
        try
        {
            query =
            @"
                CREATE PROCEDURE CountBuyersInEachCity
                AS
                BEGIN
                    SELECT COUNT(A.[ID покупця]) AS Count, B.[Назва міста] AS NameCity
                    FROM [Покупці] A, [Міста] B
                    WHERE A.[ID міста] = B.[ID міста]
                    GROUP BY B.[ID міста],B.[Назва міста]
                END
            ";
            command.CommandText = query;

            await command.ExecuteNonQueryAsync();
            Console.WriteLine("Процедуру [CountBuyersInEachCity] створено успішно");
        }
        catch (SqlException e)
        {
            Console.WriteLine(e.Message);

            Console.Write("\nНатисніть для продовження...");
            Console.ReadKey(); Console.Clear();
        }

        // Створення процедури [CountBuyersInEachCountry]
        // Відобразити кількість покупців у кожній країні
        try
        {
            query =
            @"
                CREATE PROCEDURE CountBuyersInEachCountry
                AS
                BEGIN
                    SELECT COUNT(A.[ID покупця]) AS Count, B.[Назва країни] AS NameCountry
                    FROM [Покупці] A, [Країни] B
                    WHERE A.[ID Країни] = B.[ID Країни]
                    GROUP BY B.[ID Країни],B.[Назва Країни]
                END
            ";
            command.CommandText = query;

            await command.ExecuteNonQueryAsync();
            Console.WriteLine("Процедуру [CountBuyersInEachCountry] створено успішно");
        }
        catch (SqlException e)
        {
            Console.WriteLine(e.Message);

            Console.Write("\nНатисніть для продовження...");
            Console.ReadKey(); Console.Clear();
        }

        // Створення процедури [CountCityInEachCountry]
        // Відобразити кількість міст у кожній країні
        try
        {
            query =
            @"
                CREATE PROCEDURE CountCityInEachCountry
                AS
                BEGIN
                    SELECT COUNT(A.[ID міста]) AS Count, B.[Назва країни] AS NameCountry
                    FROM [Міста] A, [Країни] B
                    WHERE A.[ID Країни] = B.[ID Країни]
                    GROUP BY B.[ID Країни],B.[Назва Країни]
                END
            ";
            command.CommandText = query;

            await command.ExecuteNonQueryAsync();
            Console.WriteLine("Процедуру [CountCityInEachCountry] створено успішно");
        }
        catch (SqlException e)
        {
            Console.WriteLine(e.Message);

            Console.Write("\nНатисніть для продовження...");
            Console.ReadKey(); Console.Clear();
        }

        // Створення процедури [CountCityInEachCountry]
        // Відобразити середню кількість міст по всіх країнах
        try
        {
            query =
            @"
                CREATE PROCEDURE CountCityInEachCountry
                AS
                BEGIN
                    SELECT COUNT(A.[ID міста]) AS Count, B.[Назва країни] AS NameCountry
                    FROM [Міста] A, [Країни] B
                    WHERE A.[ID Країни] = B.[ID Країни]
                    GROUP BY B.[ID Країни],B.[Назва Країни]
                END
            ";
            command.CommandText = query;

            await command.ExecuteNonQueryAsync();
            Console.WriteLine("Процедуру [CountCityInEachCountry] створено успішно");
        }
        catch (SqlException e)
        {
            Console.WriteLine(e.Message);

            Console.Write("\nНатисніть для продовження...");
            Console.ReadKey(); Console.Clear();
        }
    }
}