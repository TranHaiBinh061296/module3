create database demo;
use demo;
/*Bước 2: Tạo bảng Products với các trường dữ liệu sau:
Id
productCode
productName
productPrice
productAmount
productDescription
productStatus
Chèn một số dữ liệu mẫu cho bảng Products.*/
	create table Products(
	id int auto_increment,
	productCode varchar(20) not null unique,
	productName varchar(50) not null unique,
	productPrice double not null
	check (productPrice > 0),
		productAmount int not null
	check (productAmount >= 0),
	productDescription varchar(100),
	productStatus varchar(50),
	primary key(id)
);

/*Bước 3:
Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
So sánh câu truy vấn trước và sau khi tạo index*/

	