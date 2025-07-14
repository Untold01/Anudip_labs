Enter password: ***************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.0.42 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| employees_data     |
| information_schema |
| joins              |
| kitchen            |
| mysql              |
| performance_schema |
| sakila             |
| students_data      |
| sys                |
| world              |
+--------------------+
10 rows in set (0.00 sec)

-- Using database created for the lab students_data

mysql> use students_data;
Database changed

-- showing created tables in the database

mysql> show tables;
+-------------------------+
| Tables_in_students_data |
+-------------------------+
| enrollment_course       |
| students                |
+-------------------------+
2 rows in set (0.03 sec)

-- showing the structure of the database

mysql> desc students;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| Std_id     | varchar(10) | NO   | PRI | NULL    |       |
| first_name | varchar(20) | NO   |     | NULL    |       |
| last_name  | varchar(20) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> desc enrollment_course;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| enr_id      | varchar(20) | NO   | PRI | NULL    |       |
| course_id   | varchar(20) | NO   |     | NULL    |       |
| Std_id      | varchar(10) | YES  | MUL | NULL    |       |
| course_name | varchar(25) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

-- Showing data inserted in the table students

mysql> select *from students;
+--------+------------+-----------+
| Std_id | first_name | last_name |
+--------+------------+-----------+
| S1     | Raman      | Raghav    |
| S2     | Sharda     | Ravi      |
| S3     | Rakesh     | Jolly     |
| S4     | Sharan     | Yadav     |
| S5     | Shyam      | Verma     |
+--------+------------+-----------+
5 rows in set (0.00 sec)

-- Inserting data values in the table enrollment_course using following command

mysql> insert into enrollment_course values('E1', 'C101', 'S1', 'Java'), ('E2', 'C102', 'S3', 'Python'), ('E3', 'C103', 'S4', 'Data Science'), ('E4', 'C101', 'S5', 'Java'),('E5', 'C104', 'S4', 'Machine Learning');
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select *from enrollment_course;
+--------+-----------+--------+------------------+
| enr_id | course_id | Std_id | course_name      |
+--------+-----------+--------+------------------+
| E1     | C101      | S1     | Java             |
| E2     | C102      | S3     | Python           |
| E3     | C103      | S4     | Data Science     |
| E4     | C101      | S5     | Java             |
| E5     | C104      | S4     | Machine Learning |
+--------+-----------+--------+------------------+
5 rows in set (0.00 sec)

-- Performing inner join on both tables

mysql> select students.Std_id, students.first_name, students.last_name, enrollment_course.enr_id, enrollment_course.course_id from students inner join enrollment_course on students.Std_id = enrollment_course.Std_id;
+--------+------------+-----------+--------+-----------+
| Std_id | first_name | last_name | enr_id | course_id |
+--------+------------+-----------+--------+-----------+
| S1     | Raman      | Raghav    | E1     | C101      |
| S3     | Rakesh     | Jolly     | E2     | C102      |
| S4     | Sharan     | Yadav     | E3     | C103      |
| S4     | Sharan     | Yadav     | E5     | C104      |
| S5     | Shyam      | Verma     | E4     | C101      |
+--------+------------+-----------+--------+-----------+
5 rows in set (0.00 sec)

mysql> select students.Std_id, students.first_name, students.last_name, enrollment_course.enr_id, enrollment_course.course_id, enrollment_course.course_name from students inner join enrollment_course on students.Std_id = enrollment_course.Std_id;
+--------+------------+-----------+--------+-----------+------------------+
| Std_id | first_name | last_name | enr_id | course_id | course_name      |
+--------+------------+-----------+--------+-----------+------------------+
| S1     | Raman      | Raghav    | E1     | C101      | Java             |
| S3     | Rakesh     | Jolly     | E2     | C102      | Python           |
| S4     | Sharan     | Yadav     | E3     | C103      | Data Science     |
| S4     | Sharan     | Yadav     | E5     | C104      | Machine Learning |
| S5     | Shyam      | Verma     | E4     | C101      | Java             |
+--------+------------+-----------+--------+-----------+------------------+
5 rows in set (0.00 sec)

-- Performing Right Outer Join on both tables

mysql> select students.first_name, enrollment_course.course_id from students right join enrollment_course on students.Std_id = enrollment_course.Std_id;
+------------+-----------+
| first_name | course_id |
+------------+-----------+
| Raman      | C101      |
| Rakesh     | C102      |
| Sharan     | C103      |
| Shyam      | C101      |
| Sharan     | C104      |
+------------+-----------+
5 rows in set (0.00 sec)

-- Performing Left Outer Join on both tables

mysql> select students.first_name, enrollment_course.course_id from students left join enrollment_course on students.Std_id = enrollment_course.Std_id;
+------------+-----------+
| first_name | course_id |
+------------+-----------+
| Raman      | C101      |
| Sharda     | NULL      |
| Rakesh     | C102      |
| Sharan     | C103      |
| Sharan     | C104      |
| Shyam      | C101      |
+------------+-----------+
6 rows in set (0.00 sec)
