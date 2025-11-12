a) Tulosta kymmenen aakkosjärjestyksessä ensimmäisen työntekijän tiedot sukunimen mukaan lajiteltuna. Vihje: LIMIT rajoittaa tulostettavien tietojen määrän.

mysql> SELECT * FROM employees ORDER BY last_name LIMIT 10;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  11761 | 1964-07-17 | Bartek     | Aamodt    | M      | 1991-06-12 |
|  15427 | 1959-03-06 | Aluzio     | Aamodt    | M      | 1985-03-03 |
|  18182 | 1963-02-23 | Dekang     | Aamodt    | F      | 1988-05-25 |
|  16572 | 1956-11-26 | Matt       | Aamodt    | M      | 1987-06-16 |
|  12791 | 1960-06-16 | Mokhtar    | Aamodt    | M      | 1994-08-14 |
|  12516 | 1958-06-25 | Sreenivas  | Aamodt    | F      | 1990-03-06 |
|  12982 | 1952-12-08 | Sachem     | Aamodt    | F      | 1992-01-11 |
|  17400 | 1962-03-22 | Basim      | Aamodt    | F      | 1991-09-15 |
|  19898 | 1957-03-09 | Vidar      | Aamodt    | M      | 1988-08-06 |
|  17885 | 1954-02-01 | Takanari   | Aamodt    | M      | 1996-08-19 |
+--------+------------+------------+-----------+--------+------------+

b) Sama kuten edellä, mutta sukunimen JA etunimen mukaan lajiteltuna.

mysql> SELECT * FROM employees ORDER BY last_name, first_name LIMIT 10;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
| 258641 | 1961-05-23 | Abdelkader | Aamodt    | M      | 1994-12-02 |
| 258005 | 1953-02-17 | Adhemar    | Aamodt    | F      | 1991-01-21 |
| 455773 | 1960-05-04 | Aemilian   | Aamodt    | M      | 1988-04-21 |
| 436560 | 1959-03-16 | Alagu      | Aamodt    | F      | 1991-10-17 |
| 266651 | 1959-05-28 | Aleksander | Aamodt    | F      | 1989-03-29 |
| 487598 | 1962-03-03 | Alexius    | Aamodt    | M      | 1994-12-30 |
| 216963 | 1960-07-16 | Alois      | Aamodt    | M      | 1995-08-24 |
|  15427 | 1959-03-06 | Aluzio     | Aamodt    | M      | 1985-03-03 |
| 100860 | 1964-06-20 | Amabile    | Aamodt    | F      | 1993-02-06 |
| 107070 | 1954-04-24 | Anestis    | Aamodt    | M      | 1990-10-30 |
+--------+------------+------------+-----------+--------+------------+

c) Tulosta viiden viimeksi palkatun työntekijän tiedot.

mysql> SELECT * FROM employees ORDER BY hire_date DESC LIMIT 5;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
| 463807 | 1964-06-12 | Bikash     | Covnot    | M      | 2000-01-28 |
| 428377 | 1957-05-09 | Yucai      | Gerlach   | M      | 2000-01-23 |
| 499553 | 1954-05-06 | Hideyuki   | Delgrande | F      | 2000-01-22 |
| 222965 | 1959-08-07 | Volkmar    | Perko     | F      | 2000-01-13 |
|  47291 | 1960-09-09 | Ulf        | Flexer    | M      | 2000-01-12 |
+--------+------------+------------+-----------+--------+------------+

Seuraavissa tehtävissä tarvitaan tietoja useammasta kuin yhdestä taulusta (JOIN).

d) Kenellä on suurin palkka ? Tulosta etunimi, sukunimi ja palkka.

mysql> SELECT e.first_name, e.last_name, s.salary
    -> FROM employees e
    -> JOIN salaries s ON e.emp_no = s.emp_no
    -> ORDER BY s.salary DESC
    -> LIMIT 1;
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| Tokuyasu   | Pesch     | 158220 |
+------------+-----------+--------+

e) Kenellä on pienin palkka ? Tulosta etunimi, sukunimi ja palkka.

mysql> SELECT e.first_name, e.last_name, s.salary
    -> FROM employees e
    -> JOIN salaries s ON e.emp_no = s.emp_no
    -> ORDER BY s.salary ASC
    -> LIMIT 1;
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| Olivera    | Baek      |  38623 |
+------------+-----------+--------+

f) Tulosta työntekijät (etunimi, sukunimi, palkka), jotka ansaitsevat yli 150000. 

mysql> SELECT e.first_name, e.last_name, s.salary
    -> FROM employees e
    -> JOIN salaries s ON e.emp_no = s.emp_no
    -> WHERE s.salary > 150000;
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| Tokuyasu   | Pesch     | 151115 |
| Tokuyasu   | Pesch     | 153166 |
| Tokuyasu   | Pesch     | 153458 |
| Tokuyasu   | Pesch     | 157821 |
| Tokuyasu   | Pesch     | 158220 |
| Ibibia     | Junet     | 150345 |
| Xiahua     | Whitcomb  | 151929 |
| Xiahua     | Whitcomb  | 155709 |
| Lansing    | Kambil    | 150052 |
| Willard    | Baca      | 151768 |
| Willard    | Baca      | 154459 |
| Tsutomu    | Alameldin | 151484 |
| Tsutomu    | Alameldin | 154885 |
| Tsutomu    | Alameldin | 155377 |
| Tsutomu    | Alameldin | 154888 |
| Tsutomu    | Alameldin | 155190 |
| Charmane   | Griswold  | 151596 |
| Charmane   | Griswold  | 153715 |
| Weicheng   | Hatcliff  | 150994 |
| Weicheng   | Hatcliff  | 152687 |
| Mitsuyuki  | Stanfel   | 152220 |
| Sanjai     | Luders    | 150378 |
| Sanjai     | Luders    | 154227 |
| Sanjai     | Luders    | 155513 |
| Honesty    | Mukaidono | 150754 |
| Honesty    | Mukaidono | 152576 |
| Honesty    | Mukaidono | 156286 |
| Weijing    | Chenoweth | 151080 |
| Weijing    | Chenoweth | 152710 |
| Shin       | Birdsall  | 150467 |
| Shin       | Birdsall  | 152412 |
| Mohammed   | Moehrke   | 150740 |
| Lidong     | Meriste   | 150993 |
| Lidong     | Meriste   | 151565 |
| Lidong     | Meriste   | 152208 |
| Lidong     | Meriste   | 154376 |
+------------+-----------+--------+

g) Kuinka monta työntekijää työskentelee myynnissä (Sales) ? Entä markkinoinnissa (Marketing) ?

mysql> SELECT d.dept_name, COUNT(*) AS maara
    -> FROM employees e
    -> JOIN dept_emp de ON e.emp_no = de.emp_no
    -> JOIN departments d ON de.dept_no = d.dept_no
    -> WHERE d.dept_name IN ('Sales', 'Marketing')
    -> GROUP BY d.dept_name;
+-----------+-------+
| dept_name | maara |
+-----------+-------+
| Marketing | 20211 |
| Sales     | 52245 |
+-----------+-------+

h) Tulosta kaikkien osastonjohtajien (Department Managers) etunimi, sukunimi ja osasto, jolla työskentelee.

SELECT e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
JOIN departments d ON dm.dept_no = d.dept_no;
+-------------+--------------+--------------------+
| first_name  | last_name    | dept_name          |
+-------------+--------------+--------------------+
| Tonny       | Butterworth  | Customer Service   |
| Marjo       | Giarratana   | Customer Service   |
| Xiaobin     | Spinelli     | Customer Service   |
| Yuchang     | Weedman      | Customer Service   |
| DeForest    | Hagimont     | Development        |
| Leon        | DasSarma     | Development        |
| Ebru        | Alpin        | Finance            |
| Isamu       | Legleitner   | Finance            |
| Shirish     | Ossenbruggen | Human Resources    |
| Karsten     | Sigstam      | Human Resources    |
| Margareta   | Markovitch   | Marketing          |
| Vishwani    | Minakawa     | Marketing          |
| Krassimir   | Wegerle      | Production         |
| Rosine      | Cools        | Production         |
| Shem        | Kieras       | Production         |
| Oscar       | Ghazalie     | Production         |
| Peternela   | Onuegbe      | Quality Management |
| Rutger      | Hofmeyr      | Quality Management |
| Sanjoy      | Quadeer      | Quality Management |
| Dung        | Pesch        | Quality Management |
| Arie        | Staelin      | Research           |
| Hilary      | Kambil       | Research           |
| Przemyslawa | Kaelbling    | Sales              |
| Hauke       | Zhang        | Sales              |
+-------------+--------------+--------------------+

i) Mikä on myynnissä työskentelevien keskipalkka ? Entä markkinoinnissa ?

mysql> SELECT d.dept_name, AVG(s.salary) AS keskipalkka
    -> FROM employees e
    -> JOIN dept_emp de ON e.emp_no = de.emp_no
    -> JOIN departments d ON de.dept_no = d.dept_no
    -> JOIN salaries s ON e.emp_no = s.emp_no
    -> WHERE d.dept_name IN ('Sales', 'Marketing')
    -> GROUP BY d.dept_name;
+-----------+-------------+
| dept_name | keskipalkka |
+-----------+-------------+
| Marketing |  71913.2000 |
| Sales     |  80667.6058 |
+-----------+-------------+


