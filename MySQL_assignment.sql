create database if not exists productsdb;
use productsdb;

create table if not exists SalesPeople (
Snum int,
Sname varchar(15) unique,
City varchar(15),
Comm int,
primary key(Snum)
);

create table if not exists Customers (
Cnum int,
Cname varchar (10) not null,
City varchar (10),
Snum int,
primary key(Cnum),
foreign key(Snum) references SalesPeople(Snum)
);

create table if not exists Orders (
Onum int,
Amt decimal(7,2),
Cnum int,
Snum int,
Odate date not null default '0000-00-00',
Primary key(Onum),
Foreign key(Cnum) references Customers(Cnum),
Foreign Key(Snum) references SalesPeople(Snum)
);

Desc table Salespeople;
Desc table Customers;
Desc table Orders;

insert into SalesPeople	values
(1001,'Peel','London',12),
(1002,'Serres','Sanjose',13),
(1004,'Motika','London',11),
(1007,'Rifkin','Barcelona',15),
(1003,'Axelrod','Newyork',10);


insert into Customers values
(2001,'Hoffman','London',1001),
(2002,'Giovanni','Rome',1003),
(2003,'Liu','Sanjose',1002),
(2004,'Grass','Berlin',1002),
(2005,'Clemens','London',1001),
(2006,'Cisneros','Sanjose',1007),
(2007,'Pereira','Rome',1004);


insert into Orders values
(3001, 18.69, 2005, 1007, '1990-10-03'),
(3003, 767.19, 2001, 1001, '1990-10-03'),
(3002, 1900.10, 2007, 1004, '1990-10-03'),
(3005, 5160.45, 2003, 1002, '1990-10-03'),
(3006, 1098.16, 2007, 1007, '1990-10-03'),
(3009, 1713.23, 2002, 1003, '1990-10-04'),
(3007, 75.75, 2004, 1002, '1990-10-04'),
(3008, 4273.00, 2006, 1001, '1990-10-05'),
(3010, 1309.95, 2004, 1002, '1990-10-06'),
(3011, 9891.88, 2006, 1001, '1990-10-06');


select * from SalesPeople;
select * from Customers;
select * from Orders;

select 
s.sname as 'SalesPersons Name',
s.city as 'SalesPerson City',
o.amt as 'Amount',
O.odate as 'Order Date'
from orders as o
inner join customers as c
inner join salespeople as s;

-- 1.Count the number of Salesperson whose name begin with ‘a’/’A’

select COUNT(*) from SalesPeople where Sname like 'A%' or Sname like 'a%';

-- 2.Display all the Salesperson whose all orders worth is more than Rs. 2000.

select * from Orders where Amt > 2000;
select * from Salespeople where Snum = 1002 or Snum=1001;

-- 3.Count the number of Salesperson belonging to Newyork.
select COUNT(*) from SalesPeople where city = 'Newyork';

--  4.Display the number of Salespeople belonging to London and belonging to Paris.
select COUNT(*) from SalesPeople where city = 'London' or city = 'Paris' ;

-- 5.Display the number of orders taken by each Salesperson and their date of orders.

select SalesPeople.Snum, count(Orders.Onum), Orders.Odate from Orders INNER JOIN SalesPeople ON Orders.Snum = SalesPeople.Snum GROUP BY Orders.Snum;














