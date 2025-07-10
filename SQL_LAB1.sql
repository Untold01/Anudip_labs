mysql> create database Kitchen;
Query OK, 1 row affected (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| employees_data     |
| information_schema |
| kitchen            |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
8 rows in set (0.00 sec)

mysql> use kitchen;
Database changed
mysql> create table customer(Customer_id varchar(10) not null primary key, name varchar(20) not null, phone_no int not null, email varchar(25) not null, address varchar(20) not null, city varchar(15) not null, pin_code varchar(10) not null);
Query OK, 0 rows affected (0.05 sec)

mysql> create table product(Product_id varchar(10) not null primary key, Product_name varchar(20) not null, Category varchar(30) not null, Sub_category varchar(30) not null, Original_price varchar(20) not null, Selling_price varchar(20) not null, Stock varchar(20) not null);
Query OK, 0 rows affected (0.05 sec)

mysql> create table orders(Order_id varchar(10) not null primary key, Customer_id varchar(10) not null, Product_id varchar(10) not null, quantity varchar(20) not null, Total_price varchar(20) not null, Payment_mode varchar(20) not null, Order_date varchar(20) not null, Order_status varchar(30) not null, foreign key(Customer_id) references customer(Customer_id), foreign key(Product_id) references product(Product_id));
Query OK, 0 rows affected (0.06 sec)

mysql> show tables;
+-------------------+
| Tables_in_kitchen |
+-------------------+
| customer          |
| orders            |
| product           |
+-------------------+
3 rows in set (0.00 sec)
mysql> desc customer;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| Customer_id | varchar(10) | NO   | PRI | NULL    |       |
| name        | varchar(20) | NO   |     | NULL    |       |
| phone_no    | int         | NO   |     | NULL    |       |
| email       | varchar(25) | NO   |     | NULL    |       |
| address     | varchar(20) | NO   |     | NULL    |       |
| city        | varchar(15) | NO   |     | NULL    |       |
| pin_code    | varchar(10) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
7 rows in set (0.02 sec)

mysql> insert into customer values('C_101', 'Anish', '923510272', 'anish.10@gmail.com', 'Sarvam Apt', 'Mumbai', '202312'),('C_102', 'Nayak', '92214728', 'nayak.di@gmail.com', 'Ravi Society', 'Mumbai', '400239');
Query OK, 2 rows affected (0.03 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into customer values('C_103', 'Kashish', '900088319', 'kashish-21@gmail.com', 'Shyam nagar', 'Pune', '499829'),('C_104', 'Rakesh', '927809982', 'rakesh.di@gmail.com', 'Nair Villa', 'Mumbai', '408323'),('C_105', 'Ramesh', '900310002', 'ram.25@yahoo.com', 'Rakesh Apt.', 'Noida', '800889');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select *from customer;
+-------------+---------+-----------+----------------------+--------------+--------+----------+
| Customer_id | name    | phone_no  | email                | address      | city   | pin_code |
+-------------+---------+-----------+----------------------+--------------+--------+----------+
| C_101       | Anish   | 923510272 | anish.10@gmail.com   | Sarvam Apt   | Mumbai | 202312   |
| C_102       | Nayak   |  92214728 | nayak.di@gmail.com   | Ravi Society | Mumbai | 400239   |
| C_103       | Kashish | 900088319 | kashish-21@gmail.com | Shyam nagar  | Pune   | 499829   |
| C_104       | Rakesh  | 927809982 | rakesh.di@gmail.com  | Nair Villa   | Mumbai | 408323   |
| C_105       | Ramesh  | 900310002 | ram.25@yahoo.com     | Rakesh Apt.  | Noida  | 800889   |
+-------------+---------+-----------+----------------------+--------------+--------+----------+
5 rows in set (0.00 sec)

mysql> desc product;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| Product_id     | varchar(10) | NO   | PRI | NULL    |       |
| Product_name   | varchar(20) | NO   |     | NULL    |       |
| Category       | varchar(30) | NO   |     | NULL    |       |
| Sub_category   | varchar(30) | NO   |     | NULL    |       |
| Original_price | varchar(20) | NO   |     | NULL    |       |
| Selling_price  | varchar(20) | NO   |     | NULL    |       |
| Stock          | varchar(20) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> insert into product values('P1', 'Smartphone', 'Electronics', 'Gadget', '90000', '98000', '20'),('P2', 'Earbuds', 'Electonics', 'Wearables', '4000', '5000', '35'),('P3', 'Galaxy Tablet', 'Electronics', 'Gadgegt', '50000', '70000', '102'),('P4', 'Pens', 'Stationery', 'utensil', '15', '20', 1023),('P5', 'Rubber', 'Styling', 'accessories', '25', '40', '205');
Query OK, 5 rows affected (0.05 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from product;
+------------+---------------+-------------+--------------+----------------+---------------+-------+
| Product_id | Product_name  | Category    | Sub_category | Original_price | Selling_price | Stock |
+------------+---------------+-------------+--------------+----------------+---------------+-------+
| P1         | Smartphone    | Electronics | Gadget       | 90000          | 98000         | 20    |
| P2         | Earbuds       | Electonics  | Wearables    | 4000           | 5000          | 35    |
| P3         | Galaxy Tablet | Electronics | Gadgegt      | 50000          | 70000         | 102   |
| P4         | Pens          | Stationery  | utensil      | 15             | 20            | 1023  |
| P5         | Rubber        | Styling     | accessories  | 25             | 40            | 205   |
+------------+---------------+-------------+--------------+----------------+---------------+-------+
5 rows in set (0.00 sec)

mysql> desc orders;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| Order_id     | varchar(10) | NO   | PRI | NULL    |       |
| Customer_id  | varchar(10) | NO   | MUL | NULL    |       |
| Product_id   | varchar(10) | NO   | MUL | NULL    |       |
| quantity     | varchar(20) | NO   |     | NULL    |       |
| Total_price  | varchar(20) | NO   |     | NULL    |       |
| Payment_mode | varchar(20) | NO   |     | NULL    |       |
| Order_date   | varchar(20) | NO   |     | NULL    |       |
| Order_status | varchar(30) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> insert into orders values('O001', 'C_101', 'P1', 2, 196000, 'Credit Card', '2025-07-10', 'Shipped'),('O002', 'C_102', 'P2', 1, 5408, 'PayPal', '2025-07-09', 'Delivered'),('O003', 'C_103', 'P3', 3, 212000, 'Cash on Delivery', '2025-07-08', 'Pending'), ('O004', 'C_103', 'P1', 1, 98000, 'Credit Card', '2025-07-07', 'Cancelled'), ('O005', 'C_102', 'P3', 4, 270000, 'UPI', '2025-07-06', 'Processing'), ('O006', 'C_103', 'P5', 15, 620, 'UPI', '2025-07-09', 'Delivered'),('O007', 'C_104', 'P4', 40, 850, 'UPI', '2025-07-08', 'Processing'),('O008', 'C_105', 'P2', 1, 5110, 'Cash on Delivery', '2025-07-10', 'Shipped');
Query OK, 8 rows affected (1.41 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select *from orders;
+----------+-------------+------------+----------+-------------+------------------+------------+--------------+
| Order_id | Customer_id | Product_id | quantity | Total_price | Payment_mode     | Order_date | Order_status |
+----------+-------------+------------+----------+-------------+------------------+------------+--------------+
| O001     | C_101       | P1         | 2        | 196000      | Credit Card      | 2025-07-10 | Shipped      |
| O002     | C_102       | P2         | 1        | 5408        | PayPal           | 2025-07-09 | Delivered    |
| O003     | C_103       | P3         | 3        | 212000      | Cash on Delivery | 2025-07-08 | Pending      |
| O004     | C_103       | P1         | 1        | 98000       | Credit Card      | 2025-07-07 | Cancelled    |
| O005     | C_102       | P3         | 4        | 270000      | UPI              | 2025-07-06 | Processing   |
| O006     | C_103       | P5         | 15       | 620         | UPI              | 2025-07-09 | Delivered    |
| O007     | C_104       | P4         | 40       | 850         | UPI              | 2025-07-08 | Processing   |
| O008     | C_105       | P2         | 1        | 5110        | Cash on Delivery | 2025-07-10 | Shipped      |
+----------+-------------+------------+----------+-------------+------------------+------------+--------------+
8 rows in set (0.00 sec)