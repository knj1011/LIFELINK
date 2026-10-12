using System.Configuration;
using System.Data.SqlClient;

public class DB
{
    private static readonly string connectionString =
        ConfigurationManager.ConnectionStrings["LifeLinkDBConnection"].ConnectionString;

    public static SqlConnection GetConnection()
    {
        return new SqlConnection(connectionString);
    }
}