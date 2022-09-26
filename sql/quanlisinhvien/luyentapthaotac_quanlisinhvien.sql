use QuanLySinhVien;

/*Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.*/
select * from subject
where Credit = (select max(Credit) from subject);
/*Hiển thị các thông tin môn học có điểm thi lớn nhất.*/
select * from subject
where SubId = 
(select SubId from mark 
where mark = (select max(Mark) from mark)
);
/*Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần*/
select *, avg(Mark) from student s inner join mark m on s.StudentId = m.StudentId
group by s.StudentId
order by avg(m.mark) desc;