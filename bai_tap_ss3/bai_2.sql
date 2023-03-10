create
database bai_tap_ss3_bai_2;
use
bai_tap_ss3_bai_2;
create table customer
(
    c_id   int primary key,
    c_name varchar(225),
    age    int
);
insert into customer(c_id, c_name, age)
    value (1,'Minh Quan',10),(2,'Ngoc Anh',20),(3,'Hong Ha',50);
select *
from customer;
create table product
(
    p_id    int primary key,
    p_name  varchar(225),
    p_price int
);
insert into product(p_id, p_name, p_price)
    value (1,'May Giat',3),(2,'Tu Lanh',5),(3,'Dieu Hoa',7),(4,'Quat',1),(5,'Bep Dien',2);
select *
from product;
create table bill
(
    o_id          int primary key,
    o_date        date,
    o_total_price int,
    c_id          int,
    foreign key (c_id) references customer (c_id)
);
insert into bill(o_id, o_date, o_total_price, c_id)
    value (1,'2006-03-21',null,1),(2,'2006-03-23',null,2),(3,'2006-03-16',null,1);
select *
from bill;
create table bill_detail
(
    o_id   int,
    p_id   int,
    od_qty int,
    primary key (o_id, p_id),
    foreign key (o_id) references bill (o_id),
    foreign key (p_id) references product (p_id)
);
insert into bill_detail(o_id, p_id, od_qty)
    value (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);
select *
from bill_detail;
select o_id, o_date, o_total_price
from bill;
select c_name, p_name
from (((customer inner join bill on customer.c_id = bill.o_id) inner join bill_detail
    on bill.o_id = bill_detail.o_id)
         inner join product on product.p_id = bill_detail.p_id);
select c_name
from customer
         left join bill
                   on bill.c_id = customer.c_id
where bill.o_id is null;
SET
SQL_SAFE_UPDATES = 0;
update bill
    inner join bill_detail
on bill_detail.o_id = bill.o_id
    inner join product on product.p_id = bill_detail.p_id
    set o_total_price = bill_detail.od_qty * product.p_price;
select o_id, o_date, o_total_price
from bill;

