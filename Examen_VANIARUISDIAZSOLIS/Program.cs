using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.IO;

class Program
{
    static void Main()
    {
        var configuration = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json", optional: true, reloadOnChange: false)
            .Build();

        string connectionString = configuration.GetConnectionString("Default")
            ?? "Server=localhost;Database=EXAMEN_VANIARUISDIAZSOLIS;Trusted_Connection=True;TrustServerCertificate=True;";

        Console.WriteLine("Clientes:");
        LeerTabla(connectionString, "SELECT * FROM clientes");

        Console.WriteLine("\nProductos:");
        LeerTabla(connectionString, "SELECT * FROM productos");

        Console.WriteLine("\nProveedores:");
        LeerTabla(connectionString, "SELECT * FROM proveedores");
    }

    static void LeerTabla(string connectionString, string sql)
    {
        using var cn = new SqlConnection(connectionString);
        using var cmd = new SqlCommand(sql, cn);
        cn.Open();
        using var rd = cmd.ExecuteReader();
        var table = new DataTable();
        table.Load(rd);

        foreach (DataRow row in table.Rows)
        {
            for (int i = 0; i < table.Columns.Count; i++)
            {
                Console.Write($"{table.Columns[i].ColumnName}={row[i]}  ");
            }
            Console.WriteLine();
        }
    }
}
