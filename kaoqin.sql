create table user(
	username varchar(20) primary key,
	password varchar(20)
);

insert into user values('dmc','123'),
('dmc1','123'),
('毋涛','123');
insert into user values('代睦尘小仙女','123'),
('憨批李凡','123'),
('赵晓贝','123'),
('闵禧','123'),
('魏大星','123'),
('王昭君','123'),
('小妲己','123'),
('小甄姬','123'),
('小小乔','123'),
('奥里给','123'),
('小白起','123'),
('小貂婵','123');

create table students(
    student_id int primary key,
	student_name varchar(20),
	gender varchar(2),
	clazz varchar(50),
	password varchar(20)	
);

insert into students values(1,'dmc','女','计卓1702','123'),
(2,'dmc1','男','计卓1702','123');

insert into students values(3,'代睦尘小仙女','女','计卓1702','123'),
(4,'憨批李凡','男','计卓1702','123'),
(5,'赵晓贝','男','软工1601','123'),
(6,'魏大星','女','计卓1702','123'),
(7,'闵禧','男','计卓1702','123'),
(8,'王昭君','女','软工1601','123'),
(9,'小妲己','女','软工1601','123'),
(10,'小甄姬','女','软工1601','123'),
(11,'小小乔','女','计卓1702','123'),
(12,'小貂婵','女','计卓1702','123'),
(13,'小白起','男','软工1601','123');


create table teacher(
	name varchar(20) primary key,
	gender varchar(2),
	password varchar(20)
);
insert into teacher values('毋涛','男','123');
insert into teacher values('奥里给','男','123');



//班级表
create table clazz(
    clazz_id int primary key,
	clazz varchar(50),
	clazz_number int comment '班级人数'
);
insert into clazz values(1702,'计卓1702',10);
insert into clazz values(1601,'软工1601',10);



课程表
create table course(
	course_name varchar(50) primary key,
	clazz varchar(50) comment '上课班级',
	name varchar(20)  comment '上课老师',
	foreign key(name) references teacher(name)
);
insert into course values('软件工程','计卓1702','毋涛');
insert into course values('计算机基础','软件1601','奥里给');

//请假表
create table absence(
    student_id int,
	leave_person varchar(20),
	leave_time varchar(50),
	start_time varchar(50),
    leave_reason varchar(50),
	status varchar(10),
	deal_time varchar(50),
	deal_person varchar(20),
	deal_result varchar(20),
	foreign key(student_id) references students(student_id)	
);

//考勤表
create table att_student(
   student_id int,
   student_name varchar(20),
   course_name varchar(50),
   att_time varchar(50),
   operation varchar(20),
   foreign key(student_id) references students(student_id),
   foreign key(course_name) references course(course_name),
   foreign key(att_time) references co_time(att_time)
);

//上课时间表
create table co_time(
    course_name varchar(50),
	att_time varchar(50) primary key,
	foreign key(course_name) references course(course_name)
);

insert into co_time values('软件工程','周一8:00');
insert into co_time values('计算机基础','周五10:00');




//////
create table leave(
    student_id int,
    leave_person varchar(20),
	leave_time varchar(50),
	start_time varchar(50),
    leave_reason varchar(50),
	foreign key(student_id) references students(student_id)
);





