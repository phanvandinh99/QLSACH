using System;
using System.Data;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public class KetNoiCSDL
{
    private SqlConnection connection;
    private string connectionString;
    private SqlCommand cmd;
    private SqlDataAdapter da;


    public void  open()
    {
        SqlConnection ketnoi;
        string chuoiketnoi = @"Data Source=NTH95-20201005E;Initial Catalog=QLSACH;Integrated Security=True";
        ketnoi = new SqlConnection(chuoiketnoi);
        ketnoi.Open();
         
    }
    public void close()
    {
        connection.Close();
    }
    public DataTable laydulieu(string sql)

    {
        cmd = new SqlCommand(sql, connection);
        da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public void xuly(string sql)
    {
        cmd = new SqlCommand(sql, connection);
        cmd.ExecuteNonQuery();
    }

   
   
}
