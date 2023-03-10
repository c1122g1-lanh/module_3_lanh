-- B1;
create
database demo;
-- B2;
create table products
(
    id                  int primary key,
    product_Code        int,
    product_Name        varchar(255),
    product_Price       int,
    product_Amount      int,
    product_Description varchar(255),
    product_Status      int
);
insert into products
    value (1,1,'A',1,1,'co',1),(2,2,'B',1,1,'co',0),(3,3,'C',1,1,'ko',1),(4,4,'D',1,1,'ko',0);
select *
from products;
-- B3;
create unique index product_Code on products (product_Code);
create index product_Code_Name on products (product_Code, product_Name);
explain
select *
from products
-- where id = 1
where product_Code = 1;
-- B4;
create view product_view
as
select product_Code, product_Name, product_Price, product_Status
from products;
update product_view
set product_Status = 0
where product_Code = 1;
drop view product_view;
-- B5;
delimiter
$$
create procedure display_products()
begin
select*
from products;
end$$
delimiter ;
call display_products();

drop procedure display_products;

drop procedure add_products;

delimiter
$$
create procedure add_products(in id int, in product_Code int, in product_Name varchar (255),
                              in product_Price int,
                              in product_Amount int,
                              in product_Description varchar (255),
                              in product_Status int)
begin
insert into products
    value (id,
product_Code,  
product_Name, 
product_Price, 
product_Amount, 
product_Description, 
product_Status );
end$$
delimiter ;
call add_products(6,6,'E',1,1,'co',0);
call display_products();

drop procedure update_products;

delimiter
$$
create procedure update_products(in new_id int, in new_product_Code int, in new_product_Name varchar (255),
                                 in new_product_Price int,
                                 in new_product_Amount int,
                                 in new_product_Description varchar (255),
                                 in new_inproduct_Status int)
begin
update products
set product_Status      = new_product_Code,
    product_Name        = new_product_Name,
    product_Price       = new_product_Price,
    product_Amount      = new_product_Amount,
    product_Description = new_product_Description,
    product_Status      = new_inproduct_Status
where id = new_id;
end$$
delimiter ;
call update_products(5,5,'E',1,1,'co',1);
call display_products();

delimiter
$$
create procedure delete_products(in new_id int)
begin
delete
from products
where id = new_id;
end$$
delimiter ;
call delete_products(6);
call display_products();