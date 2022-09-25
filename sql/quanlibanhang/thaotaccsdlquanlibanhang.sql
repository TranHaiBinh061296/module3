use QuanLyBanHang;
insert into customer (cID,cName,cAge)
value (1,"Minh Quan", 10);
insert into customer (cID,cName,cAge)
value (2,"Ngoc Oanh", 20);
insert into customer (cID,cName,cAge)
value (3,"Hong Ha", 50);

insert into orders (oID,oDate,cID)
value (1,"2006-03-21",1);
insert into orders (oID,oDate,cID)
value (2,"2006-03-23",2);
insert into orders (oID,oDate,cID)
value (3,"2006-03-16",1);

insert into product (pID,pName,pPrice)
value (1,"May Giat",3);
insert into product (pID,pName,pPrice)
value (2,"Tu Lanh",5);
insert into product (pID,pName,pPrice)
value (3,"Dieu Hoa",7);
insert into product (pID,pName,pPrice)
value (4,"Quat",1);
insert into product (pID,pName,pPrice)
value (5,"Bep Dien",2);

insert into orderdetail (oID,pID,odQTY)
value (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

/*Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order*/
select oID,oDate,oTotalPrice from orders;
/*Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách*/
select distinct c.cID as "ID",
c.cName as "Name",
c.cAge as "Age",
p.pName as "Product",
p.pPrice as "Price",
od.odQTY as "Quantity",
o.oDate as "Date",
o.oTotalPrice as "Total"
from customer c 
inner join orders o ON c.cID = o.cID
inner join orderdetail od ON o.oID = od.oID 
inner join product p ON p.pID = od.pId;

/*Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào*/
select c.cID as "ID",
c.cName as "Name",
c.cAge as "Age"
from customer c 
where c.cID not in 
(select c.cID from (customer 
inner join orders o on c.cID = o.cID));
/*Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
(giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
 Giá bán của từng loại được tính = odQTY*pPrice)*/
 select o.oId as "Order ID",
 o.oDate as "Date",
 sum(od.odQTY * p.pPrice) as "Total"
 from ((orderdetail od inner join product p on od.pID = p.pID) 
 inner join orders o on od.oID = o.oID)
 group by o.oID;
