mysql> DROP DATABASE apartment_database;
Query OK, 1 row affected (0.03 sec)

mysql> CREATE DATABASE apartment_database;
Query OK, 1 row affected (0.02 sec)

mysql> USE apartment_database;
Database changed
mysql> CREATE TABLE Apartments (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     district VARCHAR(255) NOT NULL,
    ->     address VARCHAR(255) NOT NULL,
    ->     area DECIMAL(10, 2) NOT NULL,
    ->     rooms INT NOT NULL,
    ->     price DECIMAL(10, 2) NOT NULL
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> INSERT INTO Apartments (district, address, area, rooms, price)
    -> VALUES ('Центральный', 'ул. Хрещатик, 10 этаж, 75.5 м кв, 3 комнаты', 75.5, 3, 150000);
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM Apartments WHERE area > 80;
Empty set (0.01 sec)

mysql> SELECT * FROM Apartments;
+----+-------------+---------------------------------------------+-------+-------+-----------+
| id | district    | address                                     | area  | rooms | price     |
+----+-------------+---------------------------------------------+-------+-------+-----------+
|  1 | Центральный | ул. Хрещатик, 10 этаж, 75.5 м кв, 3 комнаты | 75.50 |     3 | 150000.00 |
+----+-------------+---------------------------------------------+-------+-------+-----------+
1 row in set (0.00 sec)
mysql> INSERT INTO Apartments (district, address, area, rooms, price)
    -> VALUES ('Центральный', 'ул. Хрещатик, 3 этаж, 79.5 м кв, 4 комнаты', 79.5, 4, 190000);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Apartments;
+----+-------------+---------------------------------------------+-------+-------+-----------+
| id | district    | address                                     | area  | rooms | price     |
+----+-------------+---------------------------------------------+-------+-------+-----------+
|  1 | Центральный | ул. Хрещатик, 10 этаж, 75.5 м кв, 3 комнаты | 75.50 |     3 | 150000.00 |
|  2 | Центральный | ул. Хрещатик, 3 этаж, 79.5 м кв, 4 комнаты  | 79.50 |     4 | 190000.00 |
+----+-------------+---------------------------------------------+-------+-------+-----------+
2 rows in set (0.00 sec)
mysql> ALTER TABLE Apartments
    -> add column level int not null;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0
mysql> SELECT level FROM Apartments;
+-------+
| level |
+-------+
|     0 |
|     0 |
+-------+
2 rows in set (0.00 sec)
mysql> UPDATE Apartments
    -> SET level = 10
    -> WHERE id = 1;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Apartments;
+----+-------------+---------------------------------------------+-------+-------+-----------+-------+
| id | district    | address                                     | area  | rooms | price     | level |
+----+-------------+---------------------------------------------+-------+-------+-----------+-------+
|  1 | Центральный | ул. Хрещатик, 10 этаж, 75.5 м кв, 3 комнаты | 75.50 |     3 | 150000.00 |    10 |
|  2 | Центральный | ул. Хрещатик, 3 этаж, 79.5 м кв, 4 комнаты  | 79.50 |     4 | 190000.00 |     0 |
+----+-------------+---------------------------------------------+-------+-------+-----------+-------+
2 rows in set (0.00 sec)
mysql> SET level =' at line 3
mysql> UPDATE Apartments
    -> set addres ('ул. Хрещатик 134')
    -> where id =1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '('ул. Хрещатик 134')
where id =1' at line 2
mysql> UPDATE Apartments
    -> SET address = 'ул. Хрещатик 134'
    -> WHERE id = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from apartments
    -> SELECT * FROM Apartments;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT * FROM Apartments' at line 2
mysql> SELECT * FROM Apartments;
+----+-------------+--------------------------------------------+-------+-------+-----------+-------+
| id | district    | address                                    | area  | rooms | price     | level |
+----+-------------+--------------------------------------------+-------+-------+-----------+-------+
|  1 | Центральный | ул. Хрещатик 134                           | 75.50 |     3 | 150000.00 |    10 |
|  2 | Центральный | ул. Хрещатик, 3 этаж, 79.5 м кв, 4 комнаты | 79.50 |     4 | 190000.00 |     0 |
+----+-------------+--------------------------------------------+-------+-------+-----------+-------+
2 rows in set (0.00 sec)

mysql> UPDATE Apartments
    ->     -> SET address = 'ул. Хрещатик 144'
    ->     -> WHERE id = 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> SET address = 'ул. Хрещатик 144'
    -> WHERE id = 1' at line 2
mysql> UPDATE Apartments
    ->  SET address = 'ул. Хрещатик 144'
    -> WHERE id = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Apartments;
+----+-------------+--------------------------------------------+-------+-------+-----------+-------+
| id | district    | address                                    | area  | rooms | price     | level |
+----+-------------+--------------------------------------------+-------+-------+-----------+-------+
|  1 | Центральный | ул. Хрещатик 144                           | 75.50 |     3 | 150000.00 |    10 |
|  2 | Центральный | ул. Хрещатик, 3 этаж, 79.5 м кв, 4 комнаты | 79.50 |     4 | 190000.00 |     0 |
+----+-------------+--------------------------------------------+-------+-------+-----------+-------+
2 rows in set (0.00 sec)

mysql> UPDATE Apartments
    ->  SET address = 'ул. Хрещатик 144'
    -> WHERE id = 2;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Apartments;
+----+-------------+------------------+-------+-------+-----------+-------+
| id | district    | address          | area  | rooms | price     | level |
+----+-------------+------------------+-------+-------+-----------+-------+
|  1 | Центральный | ул. Хрещатик 144 | 75.50 |     3 | 150000.00 |    10 |
|  2 | Центральный | ул. Хрещатик 144 | 79.50 |     4 | 190000.00 |     0 |
+----+-------------+------------------+-------+-------+-----------+-------+
2 rows in set (0.00 sec)

mysql> UPDATE Apartments
    ->  SET address = 'ул. Хрещатик 134'
    -> WHERE id = 2;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Apartments;
+----+-------------+------------------+-------+-------+-----------+-------+
| id | district    | address          | area  | rooms | price     | level |
+----+-------------+------------------+-------+-------+-----------+-------+
|  1 | Центральный | ул. Хрещатик 144 | 75.50 |     3 | 150000.00 |    10 |
|  2 | Центральный | ул. Хрещатик 134 | 79.50 |     4 | 190000.00 |     0 |
+----+-------------+------------------+-------+-------+-----------+-------+
2 rows in set (0.00 sec)

mysql> UPDATE Apartments
    ->  SET level  = 3
    -> WHERE id = 2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Apartments;
+----+-------------+------------------+-------+-------+-----------+-------+
| id | district    | address          | area  | rooms | price     | level |
+----+-------------+------------------+-------+-------+-----------+-------+
|  1 | Центральный | ул. Хрещатик 144 | 75.50 |     3 | 150000.00 |    10 |
|  2 | Центральный | ул. Хрещатик 134 | 79.50 |     4 | 190000.00 |     3 |
+----+-------------+------------------+-------+-------+-----------+-------+
2 rows in set (0.00 sec)
