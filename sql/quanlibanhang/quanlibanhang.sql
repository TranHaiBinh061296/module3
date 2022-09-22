create database `QuanLyBanHang`;
use QuanLyBanHang;
create table Customer(
cID int not null primary key,
cName varchar(20) not null,
cAge int not null
);
create table Orders(
oID int not null primary key,
oDate datetime,
oTatalPrice double,
cID int not null,
foreign key (cID) references Customer (cID)
);
create table Product(
pID int not null primary key,
pName varchar(20) not null,
pPrice double not null default 0
);
create table OrderDetail(
oID int not null,
pID int not null,
odQTY int not null,
foreign key (oID) references Orders (oID),
foreign key (pID) references Product (pID)
);