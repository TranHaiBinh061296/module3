use c06_luyentap;
-- select MaSP,TenSP
-- from sanpham
-- where NuocSX in ("Trung Quoc", "Viet Nam") and (Gia >= 2000 and Gia <= 3000);

-- select distinct NuocSX
-- from sanpham
-- where NuocSX = "Viet Nam" or NuocSX = "Trung Quoc";

-- select kh.MaKH, kh.HoTen
-- from khachhang kh inner join hoadon hd on kh.MaKH = hd.MaKH
-- where hd.NgayMuaHang = "2007-01-01";

select kh.MaKH, kh.HoTen,sp.Tensp,hd.TriGia,ct.MaSP
from khachhang kh inner join hoadon hd on kh.MaKH = hd.MaKH
inner join cthd ct on ct.SoHD = hd.SoHoaDon inner join sanpham sp on ct.MaSP = sp.MaSP 
where hd.NgayMuaHang = '2007-01-01';


select kh.MaKH, kh.HoTen,sp.Tensp,hd.TriGia,ct.MaSP
from khachhang kh inner join hoadon hd on kh.MaKH = hd.MaKH
inner join cthd ct on ct.SoHD = hd.SoHoaDon inner join sanpham sp on ct.MaSP = sp.MaSP 
where kh.HOTEN = 'Nguyen Van A' and hd.NgayMuaHang like '2006-10-%';



/*2.In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cây”, ”quyển”*/
select MaSP,TenSP,DVT
from sanpham
where DVT = "cay" or sanpham.DVT = "quyen";

/*3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”*/
select MaSP,TenSP
from sanpham
where sanpham.MaSP like "B_%01";

/*4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 20.000 đến 30.000*/
select MaSP, TenSP,Gia
from sanpham
where NuocSX = "Trung Quoc" and (Gia >= 2000 and Gia <=10000 );

/*5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” hoặc “Thái Lan” sản xuất có giá từ
20.000 đến 30.000.*/
select MaSP,TenSP,Gia
from sanpham
where NuocSX in ("Trung Quoc", "Thai Lan") and (Gia >= 2000 and Gia <= 10000);

/*6.In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.*/
select SoHoaDon,TriGia,NgayMuaHang
from hoadon
where NgayMuaHang in ("2007-01-01", "2007-01-02");

/*7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007,
 sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).*/
select SoHoaDon,TriGia,NgayMuaHang
from hoadon
where NgayMuaHang like "2007-01-%"
order by TriGia desc;

/*8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.*/
select kh.MaKH, kh.HoTen, hd.NgayMuaHang
from khachhang kh inner join hoadon hd on kh.MaKH = hd.MaKH
where NgayMuaHang = "2007-01-01";

/*9. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyễn Văn A” mua trong háng 10/2006.*/
select kh.MaKH, kh.HoTen, hd.NgayMuaHang
from khachhang kh inner join hoadon hd on kh.MaKH = hd.MaKH
where HoTen = "Nguyen Van A" and NgayMuaHang like "2006-10-%";

/*10. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyễn Văn B” lập trong ngày 10/10/2006.*/
select hd.SoHoaDon,hd.TriGia,hd.NgayMuaHang ,nv.HoTen
from hoadon hd inner join nhanvien nv on hd.MaNV = nv.MaNV
where nv.HoTen = "Nguyen Van B" and hd.NgayMuaHang like "2006-10-28";

/*11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”*/
-- select hd.SoHoaDon, sp.MaSP, sp.TenSP,sp.NuocSX
-- from cthd ct inner join sanpham sp on ct.MaSP = sp.MaSP
-- inner join hoadon hd on hd.SoHoaDon = ct.SoHD
-- where sp.MaSP in ("BB01","BB02");
select * from hoadon hd 
inner join cthd ct on hd.SoHoaDon = ct.SoHD
where ct.MaSP in ("BB01","BB02");

/*12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, 
mỗi sản phẩm mua với số lượng từ 10 đến 20.*/
-- select hd.SoHoaDon, sp.MaSP, sp.TenSP,sp.NuocSX,ct.SoLuong
-- from cthd ct inner join sanpham sp on ct.MaSP = sp.MaSP
-- inner join hoadon hd on hd.SoHoaDon = ct.SoHD
-- where sp.MaSP in ("BB01","BB02") and (ct.SoLuong >= 10 and ct.SoLuong <=20);
select * from hoadon hd
inner join cthd ct on hd.SoHoaDon = ct.SoHD
where (ct.MaSP = 'BB01' or ct.MaSP = 'BB02') and (ct.SoLuong between 10 and 20);

/*13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, 
mỗi sản phẩm mua với số lượng từ 10 đến 20.*/
select * from 
hoadon hd inner join cthd ct on hd.SoHoaDon = ct.SoHD
where ct.MaSP = "BB01" and (ct.SoLuong between 10 and 20)
and hd.SoHoaDon in (select hd.SoHoaDon from 
hoadon hd inner join cthd ct on hd.SoHoaDon = ct.SoHD
where ct.MaSP = "BB02");

/*14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất 
hoặc các sản phẩm được bán ra trong ngày 1/1/2007.*/
select kh.MaKH, kh.HoTen,sp.Tensp,hd.TriGia,ct.MaSP, hd.NgayMuaHang , sp.NuocSX
from khachhang kh inner join hoadon hd on kh.MaKH = hd.MaKH
inner join cthd ct on ct.SoHD = hd.SoHoaDon inner join sanpham sp on ct.MaSP = sp.MaSP 
where hd.NgayMuaHang = '2007-01-01' or sp.NuocSX = "Trung Quoc";

/*15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.*/
-- select sp.MaSP, sp.TenSP from sanpham sp left join cthd ct
-- on sp.MaSP = ct.MaSP
-- where ct.SOHD is null;
select sp.MaSP, sp.TenSP 
from sanpham sp 
where sp.MaSP not in (select ct.MaSP from cthd ct);

/*16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.*/
select sp.MaSP, sp.TenSP
from sanpham sp
where sp.MaSP not in 
(select ct.MaSP from cthd ct 
inner join hoadon hd on ct.SoHD = hd.SoHoaDon 
where hd.NgayMuaHang like "2006-%-%");

/*17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất không bán được trong năm 2006.*/
select sp.MaSP, sp.TenSP
from sanpham sp
where (sp.MaSP not in 
(select ct.MaSP from cthd ct 
inner join hoadon hd on ct.SoHD = hd.SoHoaDon 
where hd.NgayMuaHang like "2006-%-%"))
and sp.NuocSX = "Trung Quoc";

/*18. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?*/
select * from hoadon
where MaKH is null;

/*19. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?*/
select max(TriGia) from hoadon;
select min(TriGia) from hoadon;

/*20. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?*/
select round(avg(hd.TriGia)) as "Trị giá trung bình nam 2006"
from hoadon hd
where hd.NgayMuaHang like "2006-%-%";

/*21. Tính doanh thu bán hàng trong năm 2006.*/
select sum(hd.TriGia) as "doanh thu 2006"
from hoadon hd
where NgayMuaHang like "2006%";

/*22. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.*/
select max(hd.TriGia) as "Hoa don co tri gia cao nhat 2006"
from hoadon hd
where NgayMuaHang like "2006%";

/*23. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.*/
select kh.HoTen, hd.TriGia, hd.NgayMuaHang
from hoadon hd inner join khachhang kh on hd.MaKH = kh.MaKH
and hd.SoHoaDon = 
(select hd.SoHoaDon 
from hoadon hd 
where TriGia = (select max(TriGia) from hoadon) and NgayMuaHang like "2006%"
);

/*24. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.*/
select MaKH, HoTen, DoanhSo
from khachhang 
order by DoanhSo desc
limit 0,3;

/*25. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.*/
select MaSP, TenSP, Gia
from sanpham
order by Gia desc
limit 0,3;

/*26. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất 
có giá bằng 1 trong 3 mức giá thấp nhất (của tất cả các sản phẩm).*/
-- select MaSP, TenSP, Gia, NuocSX
-- from sanpham
-- where NuocSX = "Trung Quoc" and Gia in (select distinct Gia
-- from sanpham
-- order by  Gia desc
-- );
select Gia from sanpham 
where NuocSX = "Trung Quoc" 
order by Gia
limit 0,3;

select sp.MaSP, sp.TenSP, sp.Gia from sanpham sp
inner join (
	select distinct * from sanpham where NuocSX = "Trung Quoc" order by Gia limit 0,3
	) as spMin 
	on sp.Gia = spMin.Gia
where sp.NuocSX = "Trung Quoc";

/*27. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất 
có giá bằng 1 trong 3 mức giá thấp nhất (của sản phẩm do “Trung Quốc” sản xuất).*/
select sp.MaSP, sp.TenSP, sp.Gia from sanpham sp
inner join (
	select distinct * from sanpham where NuocSX = "Trung Quoc" order by Gia limit 0,3
	) as spMin 
	on sp.Gia = spMin.Gia
where sp.NuocSX = "Trung Quoc";

/*28. * In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).*/
select  rank() over (order by kh.DoanhSo desc) MaKH, HoTen, DoanhSo
from khachhang kh
order by DoanhSo desc
limit 0,3;

/*29. Tính tổng số sản phẩm do “Trung Quốc” sản xuất.*/
select count(MaSP)
from sanpham
where NuocSX = "Trung Quoc";

/*30. Tính tổng số sản phẩm của từng nước sản xuất*/
select NuocSX, count(MaSP)
from sanpham
group by NuocSX;

/*31. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.*/
select NuocSX, max(Gia), min(Gia), avg(Gia)
from sanpham
group by NuocSX;

/*32. Tính doanh thu bán hàng mỗi ngày.*/
select NgayMuaHang, sum(TriGia) DoanhThu
from hoadon
group by NgayMuaHang;

/*33. Tính tổng số lượng của từng sản phẩm bán ra trong ngày 28/10/2006.*/
select * from 
hoadon hd inner join cthd ct on hd.SoHoaDon = ct.SoHD
where NgayMuaHang = "2006-10-28";

select MaSP, sum(SoLuong)
from hoadon hd, cthd ct
where ct.SoHD = hd.SoHoaDon and (NgayMuaHang = "2006-10-28")
group by MaSP;

/*34. Tính doanh thu bán hàng của từng tháng trong năm 2006.*/
select month(NgayMuaHang), sum(hd.TriGia) DoanhThu
from hoadon hd
where year(NgayMuaHang) = "2006"
group by month(NgayMuaHang);

/*35. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.*/
select hd.MaKH, kh.HoTen
from hoadon hd , khachhang kh
where hd.MaKH is not null and hd.MaKH = kh.MaKH
group by hd.MaKH, kh.HoTen
order by count(hd.MaKH) desc
limit 1;

/*36. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.*/
select ct.MaSP, sp.TenSP, sum(SoLuong) as Tong
from cthd ct inner join hoadon hd on ct.SoHD = hd.SoHoaDon
inner join sanpham sp on ct.MaSP = sp.MaSP
where year(NgayMuaHang) = "2006"
group by MaSP
order by Tong                                                   
limit 3;
-- SELECT B.MaSP, TenSP, SUM(SoLuong)
-- FROM  sanpham A, cthd B, hoadon C
-- WHERE A.MaSP=B.MaSP AND B.SoHD=C.SoHoaDon AND YEAR(NgayMuaHang)=2006
-- GROUP BY B.MASP,TENSP
-- HAVING SUM(SoLuong)<=ALL(SELECT  SUM(SoLuong)
--      FROM  cthd A, hoadon B
--      WHERE A.SoHD=B.SoHoaDon AND YEAR(NgayMuaHang)=2006
--      GROUP BY MaSP)
-- limit 1;


/*37. Tháng mấy trong năm 2006, doanh số bán hàng thấp nhất ?*/
select month(hd.NgayMuaHang)
from hoadon hd
where year(hd.NgayMuaHang)= "2006"
group by month(hd.NgayMuaHang)
having sum(hd.TriGia) <= all
(select sum(hd1.TriGia)
from hoadon hd1
where year(hd1.NgayMuaHang) = "2006"
group by month(hd1.NgayMuaHang));


/*38. Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.*/
SELECT sp1.NUOCSX, sp1.MASP, sp1.TENSP
FROM SANPHAM sp1, 
    (SELECT sp.NUOCSX, max(sp.GIA) giamax
    FROM SANPHAM sp
    GROUP BY sp.NUOCSX) gia_QG
WHERE sp1.NUOCSX = gia_QG.NUOCSX and sp1.GIA=gia_QG.giamax;

/*39. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.*/
-- SELECT hd1.MAKH, DS1.HOTEN
-- FROM 
-- (
--     SELECT  kh1.MAKH, KH1.HOTEN
--     FROM KHACHHANG kh1
--     WHERE kh1.MAKH is not null
--     ORDER BY kh1.DOANHSO DESC
-- ) DS1, HOADON hd1
-- WHERE DS1.MAKH = hd1.MAKH
-- GROUP BY hd1.MAKH, DS1.HOTEN
--  
-- HAVING COUNT(HD1.SOHD)>=
-- ALL(
--  
--     SELECT count(hd.SOHD)
--     FROM 
--     (
--         SELECT  kh.MAKH
--         FROM KHACHHANG kh
--         WHERE kh.MAKH is not null
--         ORDER BY kh.DOANHSO DESC
--     ) DS, HOADON hd
--     WHERE DS.MAKH = hd.MAKH
--     GROUP BY hd.MAKH 
-- );

/*40. *Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau*/
-- SELECT sp1.NUOCSX
-- FROM SANPHAM sp1,
-- (
--     SELECT sp.NUOCSX, sp.GIA, count(sp.MASP) SL
--     FROM SANPHAM sp
--     GROUP BY sp.NUOCSX, sp.GIA
-- ) groupgia
-- WHERE groupgia.NUOCSX = SP1.NUOCSX AND groupgia.GIA = sp1.GIA
-- group by sp1.NUOCSX
-- HAVING count(groupgia.SL)>=3;


SELECT sp.NUOCSX
FROM SANPHAM sp
GROUP BY sp.NUOCSX
HAVING count(distinct sp.GIA)>=3;