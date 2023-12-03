<%@ Page Title="" Language="C#" MasterPageFile="~/trangchu.Master" AutoEventWireup="true" CodeBehind="quanli.aspx.cs" Inherits="QLSACH.quanli" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="height: 560px; background-color: aquamarine; width: 100%">
        <tr>
            <td colspan="2" style="height: 23px; text-align: center"><strong>THÔNG TIN SÁCH</strong></td>
        </tr>
        <tr>
            <td style="height: 23px; width: 50px; padding-left: 20px">Mã sách</td>
            <td style="height: 23px; width: 74px;">
                <asp:TextBox ID="txtmasach" runat="server" Width="205px" BackColor="#e9e9e9" readonly="true"></asp:TextBox>
                &nbsp;&nbsp;&nbsp; </td>
            <td style="width: 10px;" rowspan="8">Chọn ảnh<asp:FileUpload ID="FileUpload2" runat="server" />
                <br />
                <asp:Button ID="btnanh" runat="server" OnClick="btnanh_Click" Text="UPLOAD ẢNH" />
                <br />
                <asp:Image ID="Image1" runat="server" Height="200px" Width="300px" />
            </td>
        </tr>
        <tr>
            <td style="width: 159px; padding-left: 20px">Tên sách</td>
            <td style="width: 74px">
                <asp:TextBox ID="txttensach" runat="server" Width="205px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="txttensach"
                    ErrorMessage="Vui lòng nhập tên sách."
                    Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td style="width: 159px; height: 31px; padding-left: 20px">Tác giả:</td>
            <td style="height: 31px; width: 74px;">
                <asp:TextBox ID="txttacgia" runat="server" Width="205px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txttacgia"
                    ErrorMessage="Vui lòng nhập tác giả."
                    Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td style="width: 159px; padding-left: 20px">Giá:</td>
            <td style="width: 74px">
                <asp:TextBox ID="txtgia" runat="server" Width="205px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtgia"
                    ErrorMessage="Vui lòng nhập giá bán."
                    Display="Dynamic" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ControlToValidate="txtgia"
                    ErrorMessage="Giá bán chỉ nhập số"
                    ValidationExpression="^\d+$"
                    Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td style="width: 159px; padding-left: 20px">Số lượng:</td>
            <td style="width: 74px">
                <asp:TextBox ID="txtsoluong" runat="server" Width="206px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ControlToValidate="txtsoluong"
                    ErrorMessage="Vui lòng nhập số lượng."
                    Display="Dynamic" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                    ControlToValidate="txtsoluong"
                    ErrorMessage="Số lượng chỉ nhập số"
                    ValidationExpression="^\d+$"
                    Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td style="width: 159px; padding-left: 20px">Mô tả:</td>
            <td style="width: 74px">
                <asp:TextBox ID="txtmota" runat="server" Width="206px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                    ControlToValidate="txtmota"
                    ErrorMessage="Vui lòng nhập mô tả."
                    Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td style="width: 159px; padding-left: 20px">Mã loại:</td>
            <td style="width: 74px">
                <%--                <asp:DropDownList ID="DropDownList1" runat="server" Width="214px" DataSourceID="SqlDataSource2" DataTextField="tenloai" DataValueField="maloai">
                </asp:DropDownList>--%>
                <asp:DropDownList ID="DDLmasach" runat="server" Width="214px">
                </asp:DropDownList>
            </td>
        </tr>


        <tr>
            <td style="text-align: center"><strong>
                <asp:Button ID="btnthem" runat="server" Style="font-weight: bold" Text="THÊM" OnClick="btnthem_Click" />
                <asp:Button ID="btnsua" runat="server" Style="font-weight: bold" Text="SỬA" OnClick="btnsua_Click" />
                <asp:Button ID="btnxoa" runat="server" Style="font-weight: bold" Text="XOÁ" OnClick="btnxoa_Click" CausesValidation="false" />
                <asp:Button ID="btnlamlai" runat="server" Style="font-weight: bold" Text="LÀM LẠI" OnClick="btnlamlai_Click" />
            </strong></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">&nbsp;</td>
            <td style="text-align: center; width: 10px;">&nbsp;</td>
        </tr>
        <tr style="background-color: antiquewhite!important;">
            <td colspan="3" style="text-align: center; background-color: white;">
                <asp:GridView ID="GridView1"
                    runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="maloai"
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                    AllowPaging="true"
                    PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <PagerStyle
                        HorizontalAlign="Center"
                        CssClass="pager" />
                    <Columns>
                        <asp:BoundField DataField="masach" HeaderText="MÃ SÁCH" InsertVisible="False" ReadOnly="True" SortExpression="masach" />
                        <asp:BoundField DataField="tensach" HeaderText="TÊN SÁCH" SortExpression="tensach" ItemStyle-Width="280px" ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField DataField="tacgia" HeaderText="TÁC GIẢ" SortExpression="tacgia" ItemStyle-Width="200px" ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField DataField="gia" HeaderText="GIÁ" SortExpression="gia" ItemStyle-Width="80px" />
                        <asp:BoundField DataField="soluong" HeaderText="SỐ LƯỢNG" SortExpression="soluong" />
                        <asp:BoundField DataField="mota" HeaderText="MÔ TẢ" SortExpression="mota" />
                        <asp:BoundField DataField="tenfile" HeaderText="TÊN FILE " SortExpression="tenfile" ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField DataField="maloai" HeaderText="MÃ LOẠI" SortExpression="maloai" Visible="false" />
                        <asp:BoundField DataField="tenloai" HeaderText="TÊN LOẠI" SortExpression="tenloai" ItemStyle-HorizontalAlign="Left" />
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>

                <%--   <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QLSACHConnectionString2 %>"
                    SelectCommand="SELECT [sach].[masach], [sach].[tensach], [sach].[tacgia], [sach].[gia], [sach].[soluong], [sach].[mota], [sach].[maloai], [sach].[tenfile], [theloai].[tenloai] FROM [sach] INNER JOIN [theloai] ON [sach].[maloai] = [theloai].[maloai]"></asp:SqlDataSource>--%>

                <%--          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QLSACHConnectionString2 %>"
                    SelectCommand="SELECT [sach].[masach], [sach].[tensach], [sach].[tacgia], [sach].[gia], [sach].[soluong], [sach].[mota], [sach].[maloai], [sach].[tenfile], [theloai].[tenloai] FROM [sach] INNER JOIN [theloai] ON [sach].[maloai] = [theloai].[maloai]"
                    OnInserted="btnthem_Click"
                    OnUpdated="btnsua_Click"
                    OnDeleted="btnxoa_Click"></asp:SqlDataSource>--%>


            </td>
        </tr>
    </table>
</asp:Content>
