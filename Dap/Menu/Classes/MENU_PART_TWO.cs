﻿using Dapper;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Threading.Tasks;

internal class MENU_PART_TWO : IMenu
{
    public async Task Menu(SqlConnection connection)
    {
        while (true) // міні-менюшка
        {
            Console.WriteLine("1 - Відображення всіх покупців");
            Console.WriteLine("2 - Відображення email всіх покупців");
            Console.WriteLine("3 - Відображення списку розділів");
            Console.WriteLine("4 - Відображення списку акційних товарів");
            Console.WriteLine("5 - Відображення всіх міст");
            Console.WriteLine("6 - Відображення всіх країн");
            Console.WriteLine("7 - Відображення всіх покупців із конкретного міста");
            Console.WriteLine("8 - Відображення всіх покупців із конкретної країни");
            Console.WriteLine("9 - Відображення всіх акцій для конкретної країни");
            Console.WriteLine("Exit - Відключення від БД");

            switch (Console.ReadLine()?.ToLower().Trim())
            {
                case ("1"):
                    Console.WriteLine();
                    break;
                case ("2"):
                    Console.WriteLine();
                    break;
                case ("3"):
                    Console.WriteLine();
                    break;
                case ("4"):
                    Console.WriteLine();
                    break;
                case ("5"):
                    Console.WriteLine();
                    break;
                case ("6"):
                    Console.WriteLine();
                    break;
                case ("7"):
                    Console.WriteLine();
                    break;
                case ("8"):
                    Console.WriteLine();
                    break;
                case ("9"):
                    Console.WriteLine();
                    break;
                case ("exit"):
                    Console.WriteLine();
                    return;
                default:
                    Console.Write("\nВведено некоректне значення...");
                    break;
            }

            Console.ReadKey(); // щоб можна було продивитись результат команди
            Console.Clear(); // очищення консолі
        }
    }
}