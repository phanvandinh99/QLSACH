CREATE DATABASE QLSACH;
GO
USE QLSACH
GO
CREATE TABLE theloai
(
	maloai int identity(1,1) primary key,
	tenloai nvarchar(20) not null,
)
GO
INSERT INTO theloai (tenloai) VALUES (N'Tiểu Thuyết');
INSERT INTO theloai (tenloai) VALUES (N'Truyện Ngắn');
INSERT INTO theloai (tenloai) VALUES (N'Truyện Tranh');
INSERT INTO theloai (tenloai) VALUES (N'Pháp Luật');
INSERT INTO theloai (tenloai) VALUES (N'kinh Tế');
GO
CREATE TABLE sach
(
	masach int identity(1,1) primary key,
	tensach nvarchar(100) not null,
	tacgia nvarchar(30) not null,
	gia float not null,
	soluong int not null,
	mota nvarchar(200) not null,
	tenfile nvarchar(100) null,
	maloai int references theloai(maloai)
)
GO
INSERT INTO sach (tensach, tacgia, gia, soluong, mota, tenfile, maloai) VALUES (N'Nơi Không Có Tuyết', N'Huỳnh Trọng Khang', 60000, 10, N'Mô tả sách Demo...', N'NoiKhongCoTuyet.jpg', 1);
INSERT INTO sach (tensach, tacgia, gia, soluong, mota, tenfile, maloai) VALUES (N'Lũ Trẻ Ồn Ào', N'Astrid Lindgren', 50000, 10, N'Mô tả sách Demo...', N'LuTreOnAo.jpg', 1);
INSERT INTO sach (tensach, tacgia, gia, soluong, mota, tenfile, maloai) VALUES (N'Bờ Vai Nghiêng Nắng', N'Từ Kế Tường', 100000, 10, N'Mô tả sách Demo...', N'BoVaiNghiengNang.jpg', 1);
INSERT INTO sach (tensach, tacgia, gia, soluong, mota, tenfile, maloai) VALUES (N'Tổ Tiên Của Chúng Ta', N'Italo Calvino', 200000, 10, N'Mô tả sách Demo...', N'ToTienChungTa.jpg', 2);
INSERT INTO sach (tensach, tacgia, gia, soluong, mota, tenfile, maloai) VALUES (N'Đức Phật Thích Ca', N'Nguyễn Phước Minh Mẫn', 250000, 10, N'Mô tả sách Demo...', N'DucPhatThichCa.jpg', 3);
INSERT INTO sach (tensach, tacgia, gia, soluong, mota, tenfile, maloai) VALUES (N'Mùi Hương Trầm', N'Nguyễn Tường Bách', 300000, 10, N'Mô tả sách Demo...', N'MuihuongTram.jpg', 4);
INSERT INTO sach (tensach, tacgia, gia, soluong, mota, tenfile, maloai) VALUES (N'Con Đường Tơ Lụa', N'Trần Hồng Ngọc', 100000, 10, N'Mô tả sách Demo...', N'ConDuongToLua.jpg', 5);
INSERT INTO sach (tensach, tacgia, gia, soluong, mota, tenfile, maloai) VALUES (N'Nhà Giả Kim', N'Paulo Coelho', 50000, 20, N'Mô tả sách Demo...', N'NhaGiaKim.jpg', 1);
INSERT INTO sach (tensach, tacgia, gia, soluong, mota, tenfile, maloai) VALUES (N'Có Một Chuyện Tình', N'Nguyễn Nhật Ánh', 100000, 15, N'Mô tả sách Demo...', N'NgayXuaCoMotChuyenTinh.jpg', 2);
INSERT INTO sach (tensach, tacgia, gia, soluong, mota, tenfile, maloai) VALUES (N'Về Nghe Yêu Kể', N'Minh Chính', 40000, 30, N'Mô tả sách Demo...', N'VeNgheYeuKe.jpg', 3);


