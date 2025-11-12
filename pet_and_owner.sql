mysql> select * from pet;
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
7 rows in set (0.03 sec)

mysql> CREATE TABLE owner (owner_id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50) NOT NULL);
Query OK, 0 rows affected (0.11 sec)

mysql> show tables;
+----------------+
| Tables_in_mydb |
+----------------+
| owner          |
| pet            |
+----------------+
2 rows in set (0.04 sec)

mysql> ALTER TABLE pet DROP COLUMN owner, ADD COLUMN owner_id INT, ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owner(owner_id);
Query OK, 7 rows affected (0.17 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> INSERT INTO owner (name) VALUES ('Harold'), ('Gwen'), ('Diane'), ('Benny');
Query OK, 4 rows affected (0.05 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> UPDATE pet SET owner_id = (SELECT owner_id FROM owner WHERE name = 'Harold') WHERE name IN ('Fluffy', 'Buffy'); UPDATE pet SET owner_id = (SELECT owner_id FROM owner WHERE name = 'Gwen') WHERE name IN ('Claws', 'Chirpy', 'Whistler'); UPDATE pet SET owner_id = (SELECT owner_id FROM owner WHERE name = 'Diane') WHERE name = 'Bowser'; UPDATE pet SET owner_id = (SELECT owner_id FROM owner WHERE name = 'Benny') WHERE name = 'Slim';
Query OK, 2 rows affected (0.05 sec)
Rows matched: 2  Changed: 2  Warnings: 0

Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DESC owner; DESC pet;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| owner_id | int         | NO   | PRI | NULL    | auto_increment |
| name     | varchar(50) | NO   |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
2 rows in set (0.06 sec)

+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| name     | varchar(20) | YES  |     | NULL    |       |
| species  | varchar(20) | YES  |     | NULL    |       |
| sex      | char(1)     | YES  |     | NULL    |       |
| birth    | date        | YES  |     | NULL    |       |
| death    | date        | YES  |     | NULL    |       |
| owner_id | int         | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)