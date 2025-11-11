a) Minkä nimisiä osastoja (Departments) Employees-tietokannassa on ?

mysql> select * from departments;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d009    | Customer Service   |
| d005    | Development        |
| d002    | Finance            |
| d003    | Human Resources    |
| d001    | Marketing          |
| d004    | Production         |
| d006    | Quality Management |
| d008    | Research           |
| d007    | Sales              |
+---------+--------------------+

b) Tulosta, (yhden kerran kukin) mitä nimikkeitä (title) tietokannassa on.

mysql> SELECT DISTINCT title
    -> FROM titles;
+--------------------+
| title              |
+--------------------+
| Senior Engineer    |
| Staff              |
| Engineer           |
| Senior Staff       |
| Assistant Engineer |
| Technique Leader   |
| Manager            |
+--------------------+
c) Mikä on suurin ja pienin palkka (salary) ? VIHJE: MIN, MAX. Voi olla kaksi erillistä kyselyä.

mysql> SELECT MIN(salary) AS pienin_palkka
    -> FROM salaries;
+---------------+
| pienin_palkka |
+---------------+
|         38623 |
+---------------+

mysql> SELECT MAX(salary) AS isoin_palkka from salaries;
+---------------+
| isoin_palkka |
+---------------+
|        158220 |
+---------------+
d) Mikä on keskimääräinen palkka ? VIHJE: AVG

mysql> SELECT AVG(salary) AS keskimääräinen_palkka from salaries;
+--------------------------+
| keskimääräinen_palkka    |
+--------------------------+
|               63810.7448 |
+--------------------------+

e) Tulosta kaikki työntekijät, joiden sukunimi on Facello.

mysql> SELECT COUNT(*) FROM employees WHERE last_name LIKE "Facello";
+----------+
| COUNT(*) |
+----------+
|      186 |
+----------+

f) Kuinka moni työntekijä on syntynyt 1950-luvulla ?

mysql> SELECT COUNT(*) FROM employees WHERE birth_date BETWEEN '1950-01-01' AND '1959-12-31';
+----------+
| COUNT(*) |
+----------+
|   182886 |
+----------+

g) Montako miestä ja montako naista työntekijöissä on ?

mysql>  SELECT gender,count(*) FROM employees GROUP BY gender;
+--------+----------+
| gender | count(*) |
+--------+----------+
| M      |   179973 |
| F      |   120051 |
+--------+----------+


