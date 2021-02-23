mysql> show databases;
+-----------------------+
| Database              |
+-----------------------+
| company               |
| information_schema    |
| matrimony             |
| mysql                 |
| performance_schema    |
| sakila                |
| science_fiction_novel |
| sys                   |
| trv11                 |
| world                 |
| xworkz                |
+-----------------------+
11 rows in set (0.07 sec)

Database changed
mysql> show tables;
+-------------------+
| Tables_in_company |
+-------------------+
| dept              |
+-------------------+
1 row in set (0.04 sec)

mysql> desc dept;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| deptno   | int         | NO   | PRI | NULL    |       |
| dname    | varchar(45) | NO   |     | NULL    |       |
| location | varchar(45) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> create table emp(
    -> empno int not null primary key,
    -> ename varchar(50) not null,
    -> job varchar(50) not null,
    -> mgr int,
    -> hiredate date,
    -> sal decimal(10,2),
    -> comm decimal(10,2),
    -> deptno int not null,
    -> foreign key(deptno) references dept(deptno));
Query OK, 0 rows affected (0.81 sec)

mysql> desc emp;
+----------+---------------+------+-----+---------+-------+
| Field    | Type          | Null | Key | Default | Extra |
+----------+---------------+------+-----+---------+-------+
| empno    | int           | NO   | PRI | NULL    |       |
| ename    | varchar(50)   | NO   |     | NULL    |       |
| job      | varchar(50)   | NO   |     | NULL    |       |
| mgr      | int           | YES  |     | NULL    |       |
| hiredate | date          | YES  |     | NULL    |       |
| sal      | decimal(10,2) | YES  |     | NULL    |       |
| comm     | decimal(10,2) | YES  |     | NULL    |       |
| deptno   | int           | NO   | MUL | NULL    |       |
+----------+---------------+------+-----+---------+-------+
8 rows in set (0.22 sec)

mysql> insert into dept values(10,'Accounting','New York'),
    -> (20,'Research','Dallas'),
    -> (30,'Sales','Chicago'),
    -> (40,'Operation','Baston');
Query OK, 4 rows affected (0.14 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from dept;
+--------+------------+----------+
| deptno | dname      | location |
+--------+------------+----------+
|     10 | Accounting | New York |
|     20 | Research   | Dallas   |
|     30 | Sales      | Chicago  |
|     40 | Operation  | Baston   |
+--------+------------+----------+
4 rows in set (0.00 sec)

mysql> insert into dept values(50,'Production','India'),
    -> (60,'Marketing','Bangalore'),
    -> (70,'Finance','Mumbai');
Query OK, 3 rows affected (0.08 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from dept;
+--------+------------+-----------+
| deptno | dname      | location  |
+--------+------------+-----------+
|     10 | Accounting | New York  |
|     20 | Research   | Dallas    |
|     30 | Sales      | Chicago   |
|     40 | Operation  | Baston    |
|     50 | Production | India     |
|     60 | Marketing  | Bangalore |
|     70 | Finance    | Mumbai    |
+--------+------------+-----------+
7 rows in set (0.04 sec)

mysql>
mysql> insert into emp values(7000,'Jhon','Manager',7698,'2020-06-18',2500.00,null,50),
    -> (7002,'Sham','Manager',7698,'2020-06-18',2500.00,null,50);
Query OK, 2 rows affected (0.25 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from emp;
+-------+-------+---------+------+------------+---------+------+--------+
| empno | ename | job     | mgr  | hiredate   | sal     | comm | deptno |
+-------+-------+---------+------+------------+---------+------+--------+
|  7000 | Jhon  | Manager | 7698 | 2020-06-18 | 2500.00 | NULL |     50 |
|  7002 | Sham  | Manager | 7698 | 2020-06-18 | 2500.00 | NULL |     50 |
+-------+-------+---------+------+------------+---------+------+--------+
2 rows in set (0.00 sec)

mysql> insert into emp values(7004,'Ravi','Clerk',7782,'2000-12-12',500.00,null,50),
    -> (7369,'Smith','Clerk',7902,'1993-06-13',800,0.00,20),
    -> (7499,'Allen','Salesman',7698,'1998-08-15',1600,300.00,30),
    -> (7521,'Ward','Salesman',7698,'1996-03-26',1250.00,500.00,30),
    -> (7566,'Jones','Manager',7839,'1995-10-31',2975.00,null,20),
    -> (7654,'Martin','Salesman',7698,'1998-12-05',1250.00,1400.00,30),
    -> (7698,'Blake','Manager',7839,'1992-06-11',2850.00,null,30),
    -> (7782,'Clark','Manager',7839,'1993-05-14',2450.00,null,10),
    -> (7788,'Scott','Analyst',7566,'1996-03-05',3000.00,null,20),
    -> (7839,'King','President',null,'1990-06-09',5000.00,0.00,10),
    -> (7844,'Turner','Salesman',7698,'1995-06-04',1500.00,0.00,30),
    -> (7876,'Adams','Clerk',7788,'1999-06-04',1100,null,20),
    -> (7900,'James','Clerk',7698,'2000-06-23',950.00,null,30),
    -> (7902,'Ford','Analyst',7566,'1997-12-05',3000.00,null,20),
    -> (7934,'Miller','Clerk',7782,'2000-01-21',1300.00,null,10);
Query OK, 15 rows affected (0.10 sec)
Records: 15  Duplicates: 0  Warnings: 0

mysql> select * from emp;
+-------+--------+-----------+------+------------+---------+---------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm    | deptno |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7000 | Jhon   | Manager   | 7698 | 2020-06-18 | 2500.00 |    NULL |     50 |
|  7002 | Sham   | Manager   | 7698 | 2020-06-18 | 2500.00 |    NULL |     50 |
|  7004 | Ravi   | Clerk     | 7782 | 2000-12-12 |  500.00 |    NULL |     50 |
|  7369 | Smith  | Clerk     | 7902 | 1993-06-13 |  800.00 |    0.00 |     20 |
|  7499 | Allen  | Salesman  | 7698 | 1998-08-15 | 1600.00 |  300.00 |     30 |
|  7521 | Ward   | Salesman  | 7698 | 1996-03-26 | 1250.00 |  500.00 |     30 |
|  7566 | Jones  | Manager   | 7839 | 1995-10-31 | 2975.00 |    NULL |     20 |
|  7654 | Martin | Salesman  | 7698 | 1998-12-05 | 1250.00 | 1400.00 |     30 |
|  7698 | Blake  | Manager   | 7839 | 1992-06-11 | 2850.00 |    NULL |     30 |
|  7782 | Clark  | Manager   | 7839 | 1993-05-14 | 2450.00 |    NULL |     10 |
|  7788 | Scott  | Analyst   | 7566 | 1996-03-05 | 3000.00 |    NULL |     20 |
|  7839 | King   | President | NULL | 1990-06-09 | 5000.00 |    0.00 |     10 |
|  7844 | Turner | Salesman  | 7698 | 1995-06-04 | 1500.00 |    0.00 |     30 |
|  7876 | Adams  | Clerk     | 7788 | 1999-06-04 | 1100.00 |    NULL |     20 |
|  7900 | James  | Clerk     | 7698 | 2000-06-23 |  950.00 |    NULL |     30 |
|  7902 | Ford   | Analyst   | 7566 | 1997-12-05 | 3000.00 |    NULL |     20 |
|  7934 | Miller | Clerk     | 7782 | 2000-01-21 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
17 rows in set (0.00 sec)