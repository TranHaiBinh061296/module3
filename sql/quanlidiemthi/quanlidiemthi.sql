CREATE DATABASE `QuanLyDiemThi`;
USE QuanLyDiemThi;
/*Bước 3: Tiếp theo sử dụng câu lệnh Create Table để tạo bảng HocSinh với các trường
 MaHS, TenHS, NgaySinh, Lop, GT với MaHS là khoá chính*/
CREATE TABLE HocSinh(
MaHs VARCHAR(20) PRIMARY KEY,
TenHS VARCHAR(50),
NgaySinh DATETIME,
Lop VARCHAR(20),
GT VARCHAR(20)
);
/*Bước 4: Tạo bảng MonHoc với các thuộc tính MaMH, TenMH. Trong đó có MaMH là khoá chính*/
CREATE TABLE MonHoc(
MaMH VARCHAR(20) PRIMARY KEY,
TenMH VARCHAR(50)
);
/*Bước 5: Tạo bảng BangDiem là bảng trung gian của mối quan hệ n - n giữa 2 thực thể HocSinh và MonHoc 
với các thuộc tính: MaHS, MaMH, DiemThi, NgayKT. Trong đó khoá chính là 2 trường MaHS và MaMH:*/
CREATE TABLE BangDiem(
MaHS VARCHAR(20),
MaMH VARCHAR(20),
DiemThi INT,
NgayKT DATETIME,
PRIMARY KEY (MaHs, MaMH),
FOREIGN KEY (MaHS) REFERENCES HocSinh(MaHS),
FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);
/*Bước 6: Tạo bảng GiaoVien với các trường MaGV, TenGV, SDT:*/
CREATE TABLE GiaoVien(
MaGV VARCHAR(20) PRIMARY KEY,
TenGV VARCHAR(20),
SDT VARCHAR(10)
);
/*Bước 7: Chỉnh sửa lại bảng MonHoc bổ sung thêm trường MaGV là khoá ngoại của bảng MonH*/
ALTER TABLE MonHoc ADD MaGV VARCHAR(20);
ALTER TABLE MonHoc ADD CONSTRAINT FK_MaGV FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV);