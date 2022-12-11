﻿using Dapper;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Threading.Tasks;

// Відобразити конкретного покупця конкретної країни
internal class PrintSpecificBuyerInSpecificCountry : IQuery
{
    public Task Print(SqlConnection connection)
    {
        using (IDbConnection db = new SqlConnection(connection.ConnectionString))
        {
            Console.Write("Введіть ім'я: ");
            string? name = Console.ReadLine();

            Console.Write("Введіть назву країни: ");
            string? country = Console.ReadLine();

            foreach (var t in db.Query<Buyer>($"EXEC SpecificBuyerInSpecificCountry '{name}', '{country}'").ToList()) // виклик процедури
                Console.WriteLine();
        }

        return Task.CompletedTask;
    }
}