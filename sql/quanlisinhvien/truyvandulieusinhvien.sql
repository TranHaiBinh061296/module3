use QuanLySinhVien;
/*Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’*/
select * from student
where StudentName like "h%";
/*Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.*/
select * from student s inner join class c on s.ClassId = c.ClassID 
where c.StartDate like "%-12-%";
/*Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.*/
select * from subject
where Credit between 3 and 5;
/*Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.*/
update student set ClassId = 2 where StudentName = 'Hung';
/*Hiển thị các thông tin: StudentName, SubName, Mark. 
Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần*/
select student.StudentName as "Ho va ten",
subject.SubName as "Mon hoc",
mark.Mark as "Diem"
from student, subject, markmark
order by mark desc, StudentName asc;



/*

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT student.StudentName as "Họ tên" , subject.SubName as "Môn học", mark.Mark as "Điểm" 
FROM student, subject, mark
ORDER BY mark DESC, studentName ASC ;*/