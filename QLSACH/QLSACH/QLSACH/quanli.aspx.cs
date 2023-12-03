using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace QLSACH
{
    public partial class quanli : System.Web.UI.Page
    {
        private KetNoiCSDL dbConnection;
        string fileName = string.Empty;

        #region LOAD
        protected void Page_Load(object sender, EventArgs e)
        {
            dbConnection = new KetNoiCSDL();
            dbConnection.open();

            if (!IsPostBack)
            {
                // Load data into GridView on initial page load
                LoadDataToDropDownList();
                BindGridView();
            }
        }
        #endregion

        #region Load dữ liệu lên DataGridView
        private void BindGridView()
        {
            string sqlSelect = "SELECT [sach].[masach], [sach].[tensach], [sach].[tacgia], [sach].[gia], [sach].[soluong], [sach].[mota], [sach].[maloai], [sach].[tenfile], [theloai].[tenloai] FROM [sach] INNER JOIN [theloai] ON [sach].[maloai] = [theloai].[maloai]";
            DataTable dt = dbConnection.laydulieu(sqlSelect);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        #endregion

        #region Trường hợp chọn trong GridView
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0 && GridView1.SelectedIndex < GridView1.Rows.Count)
            {
                int selectedIndex = GridView1.SelectedIndex;

                txtmasach.Text = GridView1.Rows[selectedIndex].Cells[0].Text;
                txttensach.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[selectedIndex].Cells[1].Text.ToString()));
                txttacgia.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[selectedIndex].Cells[2].Text.ToString()));
                txtgia.Text = GridView1.Rows[selectedIndex].Cells[3].Text;
                txtsoluong.Text = GridView1.Rows[selectedIndex].Cells[4].Text;
                txtmota.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[selectedIndex].Cells[5].Text.ToString()));
                string maloaiValue = GridView1.DataKeys[GridView1.SelectedIndex]["maloai"].ToString();
                string nameImage = GridView1.Rows[selectedIndex].Cells[6].Text;


                // Hiển thị hình ảnh
                Image1.ImageUrl = "~/img/" + nameImage;

                // Cập nhật giá trị của DropDownList
                DDLmasach.SelectedValue = maloaiValue;
            }
        }
        #endregion

        #region Button Thêm Mới Sách
        protected void btnthem_Click(object sender, EventArgs e)
        {
            try
            {
                string maSach = txtmasach.Text;
                string tenSach = txttensach.Text;
                string tacGia = txttacgia.Text;
                string gia = txtgia.Text;
                string soLuong = txtsoluong.Text;
                string moTa = txtmota.Text;
                string maLoai = DDLmasach.SelectedValue;

                dbConnection.open();
                string sqlInsert = string.Empty;
                sqlInsert = $"INSERT INTO sach (tensach, tacgia, gia, soluong, mota, tenfile, maloai) VALUES (N'{tenSach}', N'{tacGia}', {gia}, {soLuong}, N'{moTa}', N'{fileName}', {maLoai})";
                dbConnection.xuly(sqlInsert);
                dbConnection.close();
                Clear();
                BindGridView();

                string script = "alert('Thêm dữ liệu thành công.');";
                ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", script, true);
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có
                string script = $"alert('Lỗi: {ex.Message}');";
                ClientScript.RegisterStartupScript(this.GetType(), "Lỗi", script, true);
            }
        }
        #endregion

        protected void btnanh_Click(object sender, EventArgs e)
        {
            // Tắt validation
            RequiredFieldValidator1.Enabled = false;
            RequiredFieldValidator2.Enabled = false;
            RequiredFieldValidator3.Enabled = false;
            RequiredFieldValidator4.Enabled = false;
            RequiredFieldValidator5.Enabled = false;
            RegularExpressionValidator1.Enabled = false;
            RegularExpressionValidator2.Enabled = false;
            //RequiredFieldValidatorFile.Enabled = false;

            try
            {
                if (FileUpload2.HasFile)
                {
                    // Lưu hình ảnh vào thư mục trên server
                    fileName = Path.GetFileName(FileUpload2.PostedFile.FileName);

                    // Đường dẫn thư mục Images, đường dẫn tương đối
                    string imagePath = "~/img/" + fileName;

                    FileUpload2.SaveAs(Server.MapPath(imagePath));

                    // Hiển thị hình ảnh mới
                    Image1.ImageUrl = imagePath;
                }
                else
                {
                    string script = "alert('Bạn phải chọn hình ảnh.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", script, true);
                    return;
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có
                string script = $"alert('Lỗi: {ex.Message}');";
                ClientScript.RegisterStartupScript(this.GetType(), "Lỗi", script, true);
            }
            finally
            {
                // Bật validation
                RequiredFieldValidator1.Enabled = true;
                RequiredFieldValidator2.Enabled = true;
                RequiredFieldValidator3.Enabled = true;
                RequiredFieldValidator4.Enabled = true;
                RequiredFieldValidator5.Enabled = true;
                RegularExpressionValidator1.Enabled = true;
                RegularExpressionValidator2.Enabled = true;
                //RequiredFieldValidatorFile.Enabled = true;
            }
        }

        #region Button Làm lại
        protected void btnlamlai_Click(object sender, EventArgs e)
        {
            // Tắt validation
            RequiredFieldValidator1.Enabled = false;
            RequiredFieldValidator2.Enabled = false;
            RequiredFieldValidator3.Enabled = false;
            RequiredFieldValidator4.Enabled = false;
            RequiredFieldValidator5.Enabled = false;
            RegularExpressionValidator1.Enabled = false;
            RegularExpressionValidator2.Enabled = false;
            //RequiredFieldValidatorFile.Enabled = false;
            try
            {
                Clear();
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có
                string script = $"alert('Lỗi: {ex.Message}');";
                ClientScript.RegisterStartupScript(this.GetType(), "Lỗi", script, true);
            }
            finally
            {
                // Bật validation
                RequiredFieldValidator1.Enabled = true;
                RequiredFieldValidator2.Enabled = true;
                RequiredFieldValidator3.Enabled = true;
                RequiredFieldValidator4.Enabled = true;
                RequiredFieldValidator5.Enabled = true;
                RegularExpressionValidator1.Enabled = true;
                RegularExpressionValidator2.Enabled = true;
                //RequiredFieldValidatorFile.Enabled = true;
            }
        }
        #endregion

        // Xóa giá trị rỗng
        private void Clear()
        {
            txtmasach.Text = string.Empty;
            txttensach.Text = string.Empty;
            txttensach.Focus();
            txttacgia.Text = string.Empty;
            txtgia.Text = string.Empty;
            txtsoluong.Text = string.Empty;
            txtmota.Text = string.Empty;
            Image1.ImageUrl = null;
            DDLmasach.SelectedIndex = 1;
        }

        #region Button Sửa
        protected void btnsua_Click(object sender, EventArgs e)
        {
            try
            {
                string script = string.Empty;
                string maSach = txtmasach.Text;
                string tenSach = txttensach.Text;
                string tacGia = txttacgia.Text;
                string gia = txtgia.Text;
                string soLuong = txtsoluong.Text;
                string moTa = txtmota.Text;
                string maLoai = DDLmasach.SelectedValue;

                // Kiểm tra mã sách có tồn tại không
                if (string.IsNullOrEmpty(maSach))
                {
                    script = "alert('Bạn phải chọn sách cần sửa.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", script, true);
                    return;
                }

                dbConnection.open();
                string sqlInsert = string.Empty;
                if (string.IsNullOrEmpty(fileName))
                {
                    sqlInsert = $"UPDATE sach SET tensach = N'{tenSach}', tacgia = N'{tacGia}', gia = {gia}, soluong = {soLuong}, mota = N'{moTa}', maloai = {maLoai} WHERE masach = {maSach}";
                }
                else
                {
                    sqlInsert = $"UPDATE sach SET tensach = N'{tenSach}', tacgia = N'{tacGia}', gia = {gia}, soluong = {soLuong}, mota = N'{moTa}', tenfile = N'{fileName}', maloai = {maLoai} WHERE masach = {maSach}";
                }
                dbConnection.xuly(sqlInsert);
                dbConnection.close();
                Clear();
                BindGridView();

                script = "alert('Cập nhât dữ liệu thành công.');";
                ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", script, true);
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có
                string script = $"alert('Lỗi: {ex.Message}');";
                ClientScript.RegisterStartupScript(this.GetType(), "Lỗi", script, true);
            }
        }
        #endregion

        #region Button xóa
        protected void btnxoa_Click(object sender, EventArgs e)
        {
            try
            {
                string script = string.Empty;
                string maSach = txtmasach.Text;

                // Tắt validation
                RequiredFieldValidator1.Enabled = false;
                RequiredFieldValidator2.Enabled = false;
                RequiredFieldValidator3.Enabled = false;
                RequiredFieldValidator4.Enabled = false;
                RequiredFieldValidator5.Enabled = false;
                RegularExpressionValidator1.Enabled = false;
                RegularExpressionValidator2.Enabled = false;
                //RequiredFieldValidatorFile.Enabled = false;

                // Kiểm tra mã sách có tồn tại không
                if (string.IsNullOrEmpty(maSach))
                {
                    script = "alert('Bạn phải chọn sách cần xóa.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", script, true);
                    return;
                }

                dbConnection.open();
                string sqlInsert = $"DELETE FROM sach WHERE masach = {maSach}";
                dbConnection.xuly(sqlInsert);
                dbConnection.close();
                Clear();
                BindGridView();

                script = "alert('Xóa dữ liệu thành công.');";
                ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", script, true);
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có
                string script = $"alert('Lỗi: {ex.Message}');";
                ClientScript.RegisterStartupScript(this.GetType(), "Lỗi", script, true);
            }
            finally
            {
                // Bật validation
                RequiredFieldValidator1.Enabled = true;
                RequiredFieldValidator2.Enabled = true;
                RequiredFieldValidator3.Enabled = true;
                RequiredFieldValidator4.Enabled = true;
                RequiredFieldValidator5.Enabled = true;
                RegularExpressionValidator1.Enabled = true;
                RegularExpressionValidator2.Enabled = true;
                //RequiredFieldValidatorFile.Enabled = true;
            }
        }
        #endregion

        #region Sư kiện thay đổi index để phân trang
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // Set the new page index and rebind the GridView
            GridView1.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        #endregion

        #region Load dữ liệu lên combobox thể loại
        private void LoadDataToDropDownList()
        {
            string sqlSelect = "SELECT maloai, tenloai FROM theloai";


            dbConnection.open();
            DataTable dt = dbConnection.laydulieu(sqlSelect);
            dbConnection.close();

            DDLmasach.DataSource = dt;
            DDLmasach.DataTextField = "tenloai"; // Tên trường chứa dữ liệu hiển thị
            DDLmasach.DataValueField = "maloai"; // Tên trường chứa giá trị
            DDLmasach.DataBind();
        }
        #endregion

    }
}