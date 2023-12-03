using System;
using System.Data;
using System.Data.SqlClient;

public class KetNoiCSDL
{
    private SqlConnection connection;
    private string connectionString;
    private SqlCommand cmd;
    private SqlDataAdapter da;


    public void open()
    {
        if (connection == null)
        {
            string chuoiketnoi = @"Data Source=PHANDINH\SQLEXPRESS;Initial Catalog=QLSACH;Integrated Security=True";
            connection = new SqlConnection(chuoiketnoi);
        }

        if (connection.State == ConnectionState.Closed)
        {
            connection.Open();
        }

    }

    public void close()
    {
        connection.Close();
    }

    public DataTable laydulieu(string sql)
    {
        if (connection.State == ConnectionState.Closed)
        {
            open();
        }
        cmd = new SqlCommand(sql, connection);
        da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public void xuly(string sql)
    {
        if (connection.State == ConnectionState.Closed)
        {
            open();
        }

        cmd = new SqlCommand(sql, connection);
        cmd.ExecuteNonQuery();
    }

    public void Dispose()
    {
        Dispose(true);
        GC.SuppressFinalize(this);
    }

    protected virtual void Dispose(bool disposing)
    {
        if (disposing)
        {
            if (connection != null)
            {
                connection.Dispose();
                connection = null;
            }
        }
    }
}
