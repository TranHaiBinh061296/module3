use QuanLySinhVien;
/*Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi*/
select Address, count(StudentId) as 'So luong hoc vien'
from student
group by Address;
/*Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG*/
select S.StudentId, S.StudentName, AVG(Mark)
from student S join Mark M on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName;
/*Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
 Đầu tiên hiển thị điểm tb các môn học của mỗi học viên*/
-- select S.StudentId, S.StudentName, AVG(Mark)
-- from Student S join Mark M on S.StudentId = M.StudentId
-- group by S.StudentId, S.StudentName
-- having AVG(Mark) > 9;
SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);