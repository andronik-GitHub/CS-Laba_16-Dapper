using Dapper;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Threading.Tasks;

internal class MENU
{
    public static async Task Menu(SqlConnection connection, IMenu item) => await item.Menu(connection);
}