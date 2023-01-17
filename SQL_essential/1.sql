#데이터 베이스 생성
create database w3schooldb
DROP TABLE w3schoolDB;
#테이블 생성
CREATE TABLE customers
            (
             customerid           INT,
             customername         VARCHAR(30),
             contactname          VARCHAR(30),
             address              VARCHAR(30),
             city                 VARCHAR(30),
             postalcode           VARCHAR(30),
             country              VARCHAR(30),
             PRIMARY KEY (customerid));
             
ALTER TABLE customers
  MODIFY customerid VARCHAR(30);
             

INSERT INTO customers VALUES (89, "White clover", "karl jablonski", "305-14th", "seattle", "98128", "USA");
INSERT INTO customers VALUES (90, "White clover", "karl jablonski", "305-14th", "seattle", "98128", "USA");
INSERT INTO customers VALUES (91, "wolskir", "zbyszek", "filtrowa 68", "walla", "01-012", "poland");


UPDATE customers
SET contactname = 'Alfred', City = 'Frankfurt'
WHERE customerid = 89;

DELETE FROM customers
 WHERE customerid = 91;