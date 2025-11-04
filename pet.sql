mysql> DESCRIBE pet;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(20) | YES  |     | NULL    |       |
| owner   | varchar(20) | YES  |     | NULL    |       |
| species | varchar(20) | YES  |     | NULL    |       |
| sex     | char(1)     | YES  |     | NULL    |       |
| birth   | date        | YES  |     | NULL    |       |
| death   | date        | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
6 rows in set (0.06 sec)

mysql> select * FROM pet;
Empty set (0.04 sec)

mysql> INSERT INTO pet VALUES('Fluffy','Harold','cat','f','1993-02-04',NULL);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO pet VALUES('Pufball','Diane','hamster','f','1999-03-30',NULL);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO pet VALUES('Claws','Gwen','cat','m','1994-03-17',NULL);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO pet VALUES('Buffy','Harold','dog','f','1989-05-13',NULL);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO pet VALUES('Bowser','Diane','dog','f','1979-08-31','1995-07-29');
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO pet VALUES('Chirpy','Gwen','bird','f','1998-09-11',NULL);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO pet VALUES('Whistler','Gwen','bird','NULL','1997-12-09',NULL);
ERROR 1406 (22001): Data too long for column 'sex' at row 1
mysql> INSERT INTO pet VALUES('Whistler','Gwen','bird','m','1997-12-09',NULL);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO pet VALUES('Slim','Benny','snake','m','1996-04-29',NULL);
Query OK, 1 row affected (0.04 sec)

mysql> select * FROM pet;
+----------+--------+---------+------+------------+------------+
| name     | owner  | species | sex  | birth      | death      |
+----------+--------+---------+------+------------+------------+
| Fluffy   | Harold | cat     | f    | 1993-02-04 | NULL       |
| Pufball  | Diane  | hamster | f    | 1999-03-30 | NULL       |
| Claws    | Gwen   | cat     | m    | 1994-03-17 | NULL       |
| Buffy    | Harold | dog     | f    | 1989-05-13 | NULL       |
| Bowser   | Diane  | dog     | f    | 1979-08-31 | 1995-07-29 |
| Chirpy   | Gwen   | bird    | f    | 1998-09-11 | NULL       |
| Whistler | Gwen   | bird    | m    | 1997-12-09 | NULL       |
| Slim     | Benny  | snake   | m    | 1996-04-29 | NULL       |
+----------+--------+---------+------+------------+------------+
8 rows in set (0.00 sec)

mysql> DELETE FROM pet where name='Puffball';
Query OK, 0 rows affected (0.04 sec)

mysql> select * FROM pet;
+----------+--------+---------+------+------------+------------+
| name     | owner  | species | sex  | birth      | death      |
+----------+--------+---------+------+------------+------------+
| Fluffy   | Harold | cat     | f    | 1993-02-04 | NULL       |
| Pufball  | Diane  | hamster | f    | 1999-03-30 | NULL       |
| Claws    | Gwen   | cat     | m    | 1994-03-17 | NULL       |
| Buffy    | Harold | dog     | f    | 1989-05-13 | NULL       |
| Bowser   | Diane  | dog     | f    | 1979-08-31 | 1995-07-29 |
| Chirpy   | Gwen   | bird    | f    | 1998-09-11 | NULL       |
| Whistler | Gwen   | bird    | m    | 1997-12-09 | NULL       |
| Slim     | Benny  | snake   | m    | 1996-04-29 | NULL       |
+----------+--------+---------+------+------------+------------+
8 rows in set (0.00 sec)

mysql> DELETE FROM pet where name='Pufball';
Query OK, 1 row affected (0.04 sec)

mysql> select * FROM pet;
+----------+--------+---------+------+------------+------------+
| name     | owner  | species | sex  | birth      | death      |
+----------+--------+---------+------+------------+------------+
| Fluffy   | Harold | cat     | f    | 1993-02-04 | NULL       |
| Claws    | Gwen   | cat     | m    | 1994-03-17 | NULL       |
| Buffy    | Harold | dog     | f    | 1989-05-13 | NULL       |
| Bowser   | Diane  | dog     | f    | 1979-08-31 | 1995-07-29 |
| Chirpy   | Gwen   | bird    | f    | 1998-09-11 | NULL       |
| Whistler | Gwen   | bird    | m    | 1997-12-09 | NULL       |
| Slim     | Benny  | snake   | m    | 1996-04-29 | NULL       |
+----------+--------+---------+------+------------+------------+
7 rows in set (0.00 sec)

mysql> UPDATE pet SET birth = '1989-08-31' WHERE name = 'Bowser';
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * FROM pet;
+----------+--------+---------+------+------------+------------+
| name     | owner  | species | sex  | birth      | death      |
+----------+--------+---------+------+------------+------------+
| Fluffy   | Harold | cat     | f    | 1993-02-04 | NULL       |
| Claws    | Gwen   | cat     | m    | 1994-03-17 | NULL       |
| Buffy    | Harold | dog     | f    | 1989-05-13 | NULL       |
| Bowser   | Diane  | dog     | f    | 1989-08-31 | 1995-07-29 |
| Chirpy   | Gwen   | bird    | f    | 1998-09-11 | NULL       |
| Whistler | Gwen   | bird    | m    | 1997-12-09 | NULL       |
| Slim     | Benny  | snake   | m    | 1996-04-29 | NULL       |
+----------+--------+---------+------+------------+------------+
7 rows in set (0.00 sec)

mysql> UPDATE pet SET birth = '1998-08-31' WHERE name = 'Bowser';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * FROM pet;
+----------+--------+---------+------+------------+------------+
| name     | owner  | species | sex  | birth      | death      |
+----------+--------+---------+------+------------+------------+
| Fluffy   | Harold | cat     | f    | 1993-02-04 | NULL       |
| Claws    | Gwen   | cat     | m    | 1994-03-17 | NULL       |
| Buffy    | Harold | dog     | f    | 1989-05-13 | NULL       |
| Bowser   | Diane  | dog     | f    | 1998-08-31 | 1995-07-29 |
| Chirpy   | Gwen   | bird    | f    | 1998-09-11 | NULL       |
| Whistler | Gwen   | bird    | m    | 1997-12-09 | NULL       |
| Slim     | Benny  | snake   | m    | 1996-04-29 | NULL       |
+----------+--------+---------+------+------------+------------+
7 rows in set (0.00 sec)

mysql> UPDATE pet SET death = '2000-09-15' WHERE name = 'Chirpy';
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * FROM pet;
+----------+--------+---------+------+------------+------------+
| name     | owner  | species | sex  | birth      | death      |
+----------+--------+---------+------+------------+------------+
| Fluffy   | Harold | cat     | f    | 1993-02-04 | NULL       |
| Claws    | Gwen   | cat     | m    | 1994-03-17 | NULL       |
| Buffy    | Harold | dog     | f    | 1989-05-13 | NULL       |
| Bowser   | Diane  | dog     | f    | 1998-08-31 | 1995-07-29 |
| Chirpy   | Gwen   | bird    | f    | 1998-09-11 | 2000-09-15 |
| Whistler | Gwen   | bird    | m    | 1997-12-09 | NULL       |
| Slim     | Benny  | snake   | m    | 1996-04-29 | NULL       |
+----------+--------+---------+------+------------+------------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM pet WHERE birth >= '1990-1-1';
+----------+--------+---------+------+------------+------------+
| name     | owner  | species | sex  | birth      | death      |
+----------+--------+---------+------+------------+------------+
| Fluffy   | Harold | cat     | f    | 1993-02-04 | NULL       |
| Claws    | Gwen   | cat     | m    | 1994-03-17 | NULL       |
| Bowser   | Diane  | dog     | f    | 1998-08-31 | 1995-07-29 |
| Chirpy   | Gwen   | bird    | f    | 1998-09-11 | 2000-09-15 |
| Whistler | Gwen   | bird    | m    | 1997-12-09 | NULL       |
| Slim     | Benny  | snake   | m    | 1996-04-29 | NULL       |
+----------+--------+---------+------+------------+------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM pet WHERE sex = 'm';
+----------+-------+---------+------+------------+-------+
| name     | owner | species | sex  | birth      | death |
+----------+-------+---------+------+------------+-------+
| Claws    | Gwen  | cat     | m    | 1994-03-17 | NULL  |
| Whistler | Gwen  | bird    | m    | 1997-12-09 | NULL  |
| Slim     | Benny | snake   | m    | 1996-04-29 | NULL  |
+----------+-------+---------+------+------------+-------+
3 rows in set (0.00 sec)

mysql> SELECT name FROM pet WHERE sex = 'm';
+----------+
| name     |
+----------+
| Claws    |
| Whistler |
| Slim     |
+----------+
3 rows in set (0.00 sec)

mysql> SELECT name, owner FROM pet WHERE sex = 'm';
+----------+-------+
| name     | owner |
+----------+-------+
| Claws    | Gwen  |
| Whistler | Gwen  |
| Slim     | Benny |
+----------+-------+
3 rows in set (0.00 sec)