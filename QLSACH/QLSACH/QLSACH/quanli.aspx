<%@ Page Title="" Language="C#" MasterPageFile="~/trangchu.Master" AutoEventWireup="true" CodeBehind="quanli.aspx.cs" Inherits="QLSACH.quanli" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 129%; height: 560px;">
    <tr>
        <td colspan="2" style="height: 23px; text-align: center"><strong>THÔNG TIN SÁCH</strong></td>
        <td style="height: 23px; text-align: center; width: 10px;">&nbsp;</td>
    </tr>
    <tr>
        <td style="height: 23px; width: 159px">Mã sách</td>
        <td style="height: 23px; width: 74px;">
            <asp:TextBox ID="txtmasach" runat="server" Width="208px"></asp:TextBox>
&nbsp;&nbsp;&nbsp; </td>
        <td style="width: 10px;" rowspan="8">Chọn ảnh<asp:FileUpload ID="FileUpload2" runat="server" />
            <br />
            <asp:Button ID="btnanh" runat="server" OnClick="btnanh_Click" Text="UPLOAD ẢNH" />
            <br />
            <asp:Image ID="Image1" runat="server" Height="200px" Width="300px" />
        </td>
    </tr>
    <tr>
        <td style="width: 159px">Tên sách</td>
        <td style="width: 74px">
            <asp:TextBox ID="txttensach" runat="server" Width="205px"></asp:TextBox>
            </td>
    </tr>
    <tr>
        <td style="width: 159px; height: 31px;">Tác giả:</td>
        <td style="height: 31px; width: 74px;">
            <asp:TextBox ID="txttacgia" runat="server" Width="204px"></asp:TextBox>
            </td>
    </tr>
    <tr>
        <td style="width: 159px">Giá:</td>
        <td style="width: 74px">
            <asp:TextBox ID="txtgia" runat="server" Width="205px"></asp:TextBox>
            </td>
    </tr>
    <tr>
        <td style="width: 159px">Số lượng:</td>
        <td style="width: 74px">
            <asp:TextBox ID="txtsoluong" runat="server" Width="206px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 159px">Mô tả:</td>
        <td style="width: 74px">
            <asp:TextBox ID="txtmota" runat="server" Width="206px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 159px">Mã loại:</td>
        <td style="width: 74px">
            <asp:TextBox ID="txtmaloai" runat="server" Width="201px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center"><strong>
            <asp:Button ID="btnthem" runat="server" style="font-weight: bold" Text="THÊM" OnClick="btnthem_Click" />
            <asp:Button ID="btnsua" runat="server" style="font-weight: bold" Text="SỬA" />
            <asp:Button ID="btnxoa" runat="server" style="font-weight: bold" Text="XOÁ" />
            <asp:Button ID="btnlamlai" runat="server" style="font-weight: bold" Text="LÀM LẠI" />
            </strong></td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">&nbsp;</td>
        <td style="text-align: center; width: 10px;">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="masach" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="masach" HeaderText="MÃ SÁCH" InsertVisible="False" ReadOnly="True" SortExpression="masach" />
                    <asp:BoundField DataField="tensach" HeaderText="TÊN SÁCH" SortExpression="tensach" />
                    <asp:BoundField DataField="tacgia" HeaderText="TÁC GIẢ" SortExpression="tacgia" />
                    <asp:BoundField DataField="gia" HeaderText="GIÁ" SortExpression="gia" />
                    <asp:BoundField DataField="soluong" HeaderText="SỐ LƯỢNG" SortExpression="soluong" />
                    <asp:BoundField DataField="mota" HeaderText="MÔ TẢ" SortExpression="mota" />
                    <asp:BoundField DataField="tenfile" HeaderText="TÊN FILE " SortExpression="tenfile" />
                    <asp:BoundField DataField="maloai" HeaderText="MÃ LOẠI" SortExpression="maloai" />
                    <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QLSACHConnectionString2 %>" SelectCommand="SELECT [masach], [tensach], [tacgia], [gia], [soluong], [mota], [maloai], [tenfile] FROM [sach]"></asp:SqlDataSource>
        </td>
        <td style="text-align: center; width: 10px;">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">&nbsp;</td>
        <td style="text-align: center; width: 10px;">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">&nbsp;</td>
        <td style="text-align: center; width: 10px;">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">&nbsp;</td>
        <td style="text-align: center; width: 10px;">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">&nbsp;</td>
        <td style="text-align: center; width: 10px;">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">&nbsp;</td>
        <td style="text-align: center; width: 10px;">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">&nbsp;</td>
        <td style="text-align: center; width: 10px;">&nbsp;</td>
    </tr>
</table>
</asp:Content>
