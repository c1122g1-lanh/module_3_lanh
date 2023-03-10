CREATE
DATABASE bai_tap_ss2;
create table customer
(
    c_id int primary key,
    name varchar(225),
    age  int
);
insert into customer(c_id, name, age)
    value (1,'lanh',33),(2,'lanh1',33),(3,'lanh2',33);
select *
from customer;
create table product
(
    p_id    int primary key,
    p_name  varchar(225),
    p_price int
);
insert into product(p_id, p_name, p_price)
    value (1,'A',10),(2,'A',10),(3,'A',10);
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
    value (1,'2023-02-23',20,1);
select *
from bill;
drop table hoa_don;
drop table hoa_don_chi_tiet;
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
    value (1,1,10);
select *
from bill_detail;

