create
database bai_tap_ss3_bai_1;
drop
database bai_tap_ss3_bai_1;
use
bai_tap_ss3_bai_1;
create table class_r
(
    c_id         int primary key,
    c_name       varchar(255),
    c_start_date date,
    c_status     int
);
alter table class_r
    modify column c_id int;
insert into class_r(c_id, c_name, c_start_date, c_status)
    value ('1','A1','2008-12-20',1),('2','A2','2008-12-22',1),('3','B3',null,0);
select *
from class_r;
create table student
(
    s_id      int primary key,
    s_name    varchar(255),
    s_address varchar(255),
    s_phone   int,
    s_status  int,
    c_id      int,
    foreign key (c_id) references class_r (c_id)
);
insert into student(s_id, s_name, s_address, s_phone, s_status, c_id)
    value(1,'Hung','Ha Noi','0912113113',1,1),(2,'Hoa','Hai Phong',null,1,1),(3,'Manh','HCM','0123123123',0,2);
select *
from student;
create table subjectt
(
    su_id     int primary key,
    su_name   varchar(255),
    su_credit int,
    su_status int
);
insert into subjectt(su_id, su_name, su_credit, su_status)
    value (1,'CF',5,1),(2,'C',6,1),(3,'HDJ',5,1),(4,'RDBMS',10,1);
select *
from subjectt;
create table mark
(
    m_id       int primary key,
    su_id      int,
    s_id       int,
    m_mark     int,
    m_examtime int,
    foreign key (su_id) references subjectt (su_id),
    foreign key (s_id) references student (s_id)
);
insert into mark(m_id, su_id, s_id, m_mark, m_examtime)
    value (1,1,1,8,1),(2,1,2,10,2),(3,2,1,12,1);
select *
from mark;
select s_name
from student
where s_name like 'h%';
select *
from class_r
where c_start_date like '%12%';
select *
from subjectt
where su_credit between 3 and 5;
update student
set c_id = 2
where c_id = 1;
select *
from student;
update mark
set m_mark = 10
where m_id = 1;
select s_name, su_name, m_mark
from (student inner join mark on student.s_id = mark.s_id)
         inner join subjectt on subjectt.su_id = mark.su_id
order by m_mark desc, s_name;