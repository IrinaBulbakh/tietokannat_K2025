mysql> SELECT DISTINCT owner FROM pet;
+--------+
| owner  |
+--------+
| Harold |
| Gwen   |
| Diane  |
| Benny  |
+--------+
4 rows in set (0.06 sec)

mysql> SELECT name FROM pet ORDER BY name;
+----------+
| name     |
+----------+
| Bowser   |
| Buffy    |
| Chirpy   |
| Claws    |
| Fluffy   |
| Slim     |
| Whistler |
+----------+
7 rows in set (0.04 sec)

mysql> select name from pet where death is null;
+----------+
| name     |
+----------+
| Fluffy   |
| Claws    |
| Buffy    |
| Whistler |
| Slim     |
+----------+
5 rows in set (0.00 sec)

mysql> select * from pet where owner like 'H%';
+--------+--------+---------+------+------------+-------+
| name   | owner  | species | sex  | birth      | death |
+--------+--------+---------+------+------------+-------+
| Fluffy | Harold | cat     | f    | 1993-02-04 | NULL  |
| Buffy  | Harold | dog     | f    | 1989-05-13 | NULL  |
+--------+--------+---------+------+------------+-------+
2 rows in set (0.04 sec)

mysql> select name from pet where name like '%ff%';
+--------+
| name   |
+--------+
| Fluffy |
| Buffy  |
+--------+
2 rows in set (0.00 sec)

mysql> select name from pet where length(name) = 4;
+------+
| name |
+------+
| Slim |
+------+
1 row in set (0.00 sec)