create database QLSACH;
USE QLSACH

create table theloai(
maloai int identity(1,1) primary key,
tenloai nvarchar(20))

create table sach(
masach int identity(1,1) primary key,
tensach nvarchar(20),
tacgia nvarchar(30),
gia int,
soluong int,
mota nvarchar(200),
tenfile nchar(10),
maloai int references theloai(maloai))

