 create database sales
    -> ;
Query OK, 1 row affected (0.00 sec)

mysql> use sales;
Database changed


mysql> CREATE TABLE telephones(
    -> id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(20) NOT NULL UNIQUE,
    -> manufacturer VARCHAR(15) NOT NULL,
    -> price SMALLINT NOT NULL,
    -> units_sold MEDIUMINT NOT NULL);
Query OK, 0 rows affected (0.01 sec)

mysql> show tables;
+-----------------+
| Tables_in_sales |
+-----------------+
| telephones      |
+-----------------+
1 row in set (0.00 sec)

mysql> INSERT INTO telephones(name,manufacturer,price,units_sold) VALUES(
    -> "N1280","Nokia",199,1925),
    -> ("Iphone 4","Apple",399,9436),
    -> ("Galaxy S 5","Samsung",299,2359),
    -> ("S5620 Monte","Samsung",250,2385),
    -> ("N8","Nokia",150,7543),
    -> ("Droid","Motorola",150,8395),
    -> ("Iphone 13 Pro Max","Apple",1300,12849),
    -> ("Galaxy Note 20","Samsung",1100,10353);


mysql> SELECT name FROM telephones;
+-------------------+
| name              |
+-------------------+
| Droid             |
| Galaxy Note 20    |
| Galaxy S 5        |
| Iphone 13 Pro Max |
| Iphone 4          |
| N1280             |
| N8                |
| S5620 Monte       |
+-------------------+

mysql> SELECT name,manufacturer FROM telephones WHERE price > 200;
+-------------------+--------------+
| name              | manufacturer |
+-------------------+--------------+
| Iphone 4          | Apple        |
| Galaxy S 5        | Samsung      |
| S5620 Monte       | Samsung      |
| Iphone 13 Pro Max | Apple        |
| Galaxy Note 20    | Samsung      |
+-------------------+--------------+

mysql> SELECT name,manufacturer FROM telephones WHERE price <= 200 AND price >= 150;
+-------+--------------+
| name  | manufacturer |
+-------+--------------+
| N1280 | Nokia        |
| N8    | Nokia        |
| Droid | Motorola     |
+-------+--------------+
mysql> select name,manufacturer from telephones where price between 150 and 200;
+-------+--------------+
| name  | manufacturer |
+-------+--------------+
| N1280 | Nokia        |
| N8    | Nokia        |
| Droid | Motorola     |
+-------+--------------+
3 rows in set (0.00 sec)


mysql> SELECT name,manufacturer FROM telephones WHERE manufacturer = "Samsung" OR manufacturer = "Apple";
+-------------------+--------------+
| name              | manufacturer |
+-------------------+--------------+
| Iphone 4          | Apple        |
| Galaxy S 5        | Samsung      |
| S5620 Monte       | Samsung      |
| Iphone 13 Pro Max | Apple        |
| Galaxy Note 20    | Samsung      |
+-------------------+--------------+

mysql> select name, price*units_sold from telephones;
+-------------------+------------------+
| name              | price*units_sold |
+-------------------+------------------+
| N1280             |           383075 |
| Iphone4           |          3764964 |
| Galaxy S 5        |           705341 |
| S5620 Monte       |           596250 |
| N8                |          1131450 |
| Droid             |          1259250 |
| Iphone 13 Pro Max |         16703700 |
| Galaxy Note 20    |         11388300 |
+-------------------+------------------+
8 rows in set (0.00 sec)





mysql> SELECT SUM(price * units_sold) FROM telephones;
+-------------------------+
| SUM(price * units_sold) |
+-------------------------+
|                35932330 |
+-------------------------+
1 row in set (0.00 sec)






