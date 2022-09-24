use QuanLySinhVien;
insert into class (className,StartDate,Status)
value ("C0322G1","2022-09-24", 1);
insert into class (className,StartDate,Status)
value ("C0722G1","2022-09-24", 1);
insert into class (className,StartDate,Status)
value ("C0822G1","2022-09-24", 1);
insert into class (className,StartDate,Status)
value ("C0622G1","2022-09-24", 1);

insert into student (StudentName,Address,Phone,Status,ClassId)
value ("Tran Hai Binh", "Quang Tri","0969455420",1,1);
insert into student (StudentName,Address,Phone,Status,ClassId)
value ("Tran Van Huong", "Phu Dien","0987654321",1,1);
insert into student (StudentName,Address,Phone,Status,ClassId)
value ("Dao Ba Loc", "Hue","0909090909",0,1);
insert into student (StudentName,Address,Phone,Status,ClassId)
value ("Hoang Duc Khanh", "Ha Noi","099999999",0,3);

insert into subject (SubName,Credit,Status) 
value ("SQL", 1,1);
insert into subject (SubName,Credit,Status) 
value ("Java", 2,1);
insert into subject (SubName,Credit,Status) 
value ("CSS", 3,1);
insert into subject (SubName,Credit,Status) 
value ("Javascript", 1,1);

insert into mark (SubId,StudentId,Mark,ExamTimes)
value (2,2,9.8,9);
insert into mark (SubId,StudentId,Mark,ExamTimes)
value (2,3,9.9,8);
insert into mark (SubId,StudentId,Mark,ExamTimes)
value (2,4,8,7);
insert into mark (SubId,StudentId,Mark,ExamTimes)
value (2,5,10,10);