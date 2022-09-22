create database QuanLySinhvien;
/*Bước 2: Chọn Database QuanLySinhVien để thao tác với cơ sở dữ liệu này*/
USE QuanLySinhVien;
/*Bước 3: Tiếp theo sử dụng câu lệnh Create Table để tạo bảng Class với các trường 
ClassId, ClassName, StartDate, Status như sau:*/
create table Class (
ClassID int not null auto_increment primary key,
ClassName varchar(60) not null,
StartDate datetime not null,
Status bit
);
/*Bước 4: Tạo bảng Student với các thuộc tính 
StudentId, StudentName, Address, Phone, Status, ClassId với các ràng buộc giống như trong mô tả ở trên:*/
create table student(
StudentId int not null auto_increment primary key,
StudentName varchar(30) not null,
Address varchar(50),
Phone varchar(20),
Status bit,
ClassId int not null,
foreign key (ClassID) references class (ClassID)
);
/*Bước 5: Tạo bảng Subject với các thuộc tính SubId, SubName, Credit, Status 
với các ràng buộc giống như trong mô tả ở trên:*/
create table Subject(
SubId int not null auto_increment primary key,
SubName varchar(30) not null,
Credit tinyint not null default 1 check (Credit >= 1),
Status bit default 1
);
/*Bước 6: Tạo bảng Mark với các thuộc tính MarkId, SubId, StudentId, Mark, ExamTimes 
với các ràng buộc giống như trong mô tả ở trên:*/
create table Mark(
MardId int not null auto_increment primary key,
SubId int not null,
StudentId int not null,
Mark float default 0 check (Mark between 0 and 100),
ExamTimes tinyint default 1,
unique (SubID, StudentId),
foreign key (SubId) references Subject (SubId),
foreign key (StudentId) references Student (StudentId)
);