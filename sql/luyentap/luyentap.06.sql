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

/*cau 20 : tinh trung binh hoa don 2006 va lam tron*/
select round(avg(hoadon.TriGia))
from hoadon
where NgayMuaHang like "2006-%-%";

/* In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức giá thấp nhất 
(của tất cả các sản phẩm).*/
select *
from sanpham
where NuocSX = 'Trung Quoc'
group by Gia
order by Gia asc
limit 0,3;
select sp.MaSP, sp.TenSP
from sanpham sp inner join (select * from sanpham 
group by Gia
order by Gia 
asc limit 0,3) as spmin on sp.Gia = spmin.Gia
where sp.NuocSX = 'Trung Quoc';