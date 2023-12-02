using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLSACH
{
    public partial class quanli : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        KetNoiCSDL kn = new KetNoiCSDL();
        public void load()
        {
            KetNoiCSDL.Open(); 
            GridView1.DataSource= KetNoiCSDL.laydulieu
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            int t = GridView1.SelectedIndex;
            
            txtmasach.Text = GridView1.Rows[t].Cells[0].Text;
            txttensach.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[1].Text.ToString()));
            txttacgia.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[2].Text.ToString()));
            txtgia.Text = GridView1.Rows[t].Cells[3].Text;
            txtsoluong.Text = GridView1.Rows[t].Cells[4].Text;
            txtmota.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[5].Text.ToString()));
            txtmaloai.Text = GridView1.Rows[t].Cells[6].Text;


        }

        protected void btnthem_Click(object sender, EventArgs e)
        {

            KetNoiCSDL.Open();
            KetNoiCSDL.xuly("insert into sach values (N'"+txttensach.Text+ "',N'" + txttacgia.Text + "','" +txtgia.Text + "','" + txtsoluong.Text + "',N'" + txtmota.Text + "',N'" + txttensach.Text + "','" + txtmaloai.Text + "')");
            KetNoiCSDL.Close();
            Load();


        }

        protected void btnanh_Click(object sender, EventArgs e)
        {
            string tenanh;
            tenanh = FileUpload2.FileName;
            FileUpload2.SaveAs(MapPath("~/img/") + tenanh);
            Image1.ImageUrl = "~/img/" + tenanh;

        }
    }
}