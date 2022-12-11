using Dapper;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Threading.Tasks;

// Відобразити всі розділи, у яких зацікавлені
internal class PrintAllSectionsOfInterest : IQuery
{
    public Task Print(SqlConnection connection)
    {
        using (IDbConnection db = new SqlConnection(connection.ConnectionString))
        {
            foreach (var t in db.Query<AllSectionsOfInterest>("EXEC AllSectionsOfInterest").ToList()) // виклик процедури
                Console.WriteLine(t.ID_Section + " " + t.NameSection);
        }

        return Task.CompletedTask;
    }
}

record class AllSectionsOfInterest(int ID_Section, string NameSection);