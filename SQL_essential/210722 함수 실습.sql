 /* 2021.7.22 목요일 */
 
 
# 1. select 부분에 출력원하는 컬럼데이터를 입력하면  출력할 수 있다.
# *을 입력시키면 모든데이터 출력된다
SELECT *
FROM CUSTOMERS

SELECT customerid, city
  FROM customers;

# 2. 원하는 컬럼의 개수를 표현하는 함수 COUNT
SELECT COUNT(*)
  FROM customers;


# 3. s로끝나는 문자열 검색 
SELECT city
  fROm customers
  WHERE CITY LIKE "%S";
  
  
  
/* 논리 연산자 */
# 4. and를 사용하여 2개 조건을 충족하는 데이터를 찾는것도 가능하다.
SELECT *
  FROM customers
 WHERE SUBSTR(country,1,7) = "germany" 
 #SUBSTR은 = 에 오는 글자수에 같은글자를 찾아주는 명령어
   AND SUBSTR(city,1,6) = "berlin" ;

# 5. OR은 2개 조건중 한가지만을 충족하면 출력된다.
SELECT *
  FROM customers
 WHERE SUBSTR(city,1,6) = "berlin"
    OR SUBSTR(city,1,9) = "stuttgart";
 
SELECT *
  FROM customers
 WHERE SUBSTR(country,1,7) = "germany"
    OR SUBSTR(country,1,5) = "spain";

# 6. not는 조건 이외의 데이터륾 찾아준다.    
SELECT country AS 나라
  FROM customers
 WHERE not SUBSTR(country,1,7) = "germany";
 
SELECT *
  FROM customers
 WHERE SUBSTR(country,1,7) = "germany"
   AND (SUBSTR(city,1,6) = "berlin"
        OR SUBSTR(city,1,9) = "stuttgart");
        
        
SELECT country
  FROM customers
 WHERE NOT SUBSTR(country,1,7)="germany"
   AND not SUBSTR(country,1,3)="usa"
   
# customers에서 germany가 아니고, usa도 아니면서 중복이 아닌 숫자는?

SELECT COUNT ( DISTINCT country) #중복을 제거하는 distinct, 고른 문장의 숫자를 세어주는 count
  FROM customers
 WHERE NOT SUBSTR(country,1,7)="germany"
   AND NOT SUBSTR(country,1,3)="usa";
   
   
SELECT *
  FROM customers
 WHERE SUBSTR(city,1,6)= "berlin"
   AND substr(postalcode,1,5) = "12209";
   
   
DESC customers; #구성이 어떻게 되어 있는지 볼수 있다.

SELECT COUNT(DISTINCT country)
  FROM customers
 WHERE NOT country ="germany"
 
 
# order by
SELECT *
  FROM customers
 ORDER BY country DESC; # desc는 디센딩으로 내림차순으로 정렬한다. 위의 desc와 다르다
 
SELECT COUNTRY, CUSTOMERNAME
  FROM customers
 ORDER BY COUNTRY, CUSTOMERNAME DESC; #두개의 컬럼을 볼수도 있다.
 
#DEFAULT 기능 , ORDER BY ASC가 기본기능으로 되어 있다.

select country, customername
  from customers
 order by country asc, customername ASC; 
 #두개의 컬럼을 다르게 저장할 수 있다. 컨트리로 먼저 내림차순으로 정렬한뒤 각 나라에 디센딩이 적용된다.


#테이블과 데이터가 있으면 삽입 가능하다
INSERT INTO customers (CUSTOMERNAME, CONTACTNAME, ADDRESS, CITY, POSTALCODE, COUNTRY)
                VALUES('CARDINAL', 'TOM B. ERICHSEN', 'SKAGEN 21', 'STAVANGER', '4006', 'NORWAY')
                


SELECT CUSTOMERNAME, CONTACTNAME
  FROM customers
 WHERE ADDRESS IS NOT NULL;
#null이 아닌것만 불러오고 싶다. not룰 빼면 not로 사용할 수 있다.

SELECT customerid, contactname, city
  FROM customers
 WHERE customerid=1;
 
 UPDATE customers
   SET contactname = "alfred schmidt",
       city = "frankfurt"
 WHERE customerid=1;
 
 
 # update 전에 대상을 확인하기
 SELECT postalcode
   FROM customers
 WHERE country = "mexico";
 # update 후 바뀌었는지 확인한다.
 UPDATE customers
    SET postalcode = "00000"
 WHERE country = "mexico";
 
 
 # 지우기 전에 확인 먼저 하기
 SELECT *
   FROM customers
  WHERE customername = "alfreds futterkiste";

#DELETE는 가장 주의해서 사용해야 한다.
DELETE FROM customers
  WHERE customername = "alfreds futterkiste";
  
SELECT *
  FROM customers
  LIMIT 3;
#LIMIT는 몇개를 출력할것인지를 보여주는것이다.

SELECT *
  FROM customers
 WHERE COUNTRY= "GERMANY"
 LIMIT 3;
 #COUNTRY에서 GERMANY를 찾고 3줄만 출력해라

# MIN(), max() 함수fanction 최저가 최고가 찾기
SELECT min(price) AS 최저가,
       MAX(price) AS 최고가
  FROM products;
  
  
# 평균내기as는 써도되고 안써도 되지만 쓰는것이 좋다. 띄어쓰기 하려면 더블코데이션 사용해야한다.
SELECT COUNT(productid) AS "총 제품수",
       AVG(price) AS "평균가",
       MIN(price) AS "최저가",
       MAX(price) AS "최고가"
  FROM products;
  
#
SELECT *
  FROM order_details;
  
#덧셈
SELECT SUM(quantity)
  FROM order_details;
  
  
SELECT *
  FROM customers
 WHERE country IN ('germany','france','uk')
 
#위에 문장과 아래문장은 같다. in을 사용하면 문장을 줄여서 사용할 수 있다. 
SELECT *
  FROM customers
 WHERE country = 'germany'
    OR country = 'france'
    OR country = 'uk'
    
SELECT *
  FROM customers
 WHERE country IN (SELECT distinct country
                     FROM customers
                    WHERE country = 'germany'
                       OR country = 'france'
                       OR country = 'uk');
                       

SELECT *
  FROM customers
 WHERE country IN (SELECT distinct country
                     FROM suppliers);
                     
                     


# 10부터 20 사이에 가격의 값을 뽑아라
SELECT *
  FROM products
 WHERE price BETWEEN 10 AND 20;
 

#10 부터 20사이에 값을 뽑아라 값을 포함해서
SELECT *
  FROM products
 WHERE price >= 10
   and price <= 20;
   

#
SELECT CUSTOMERNAME,
       CONCAT_WS(',',ADDRESS,POSTALCODE,CITY,COUNTRY) AS ADDRESS
  FROM customers;
  
  
# 나눠져 있는테이블에서 여러가지 데이터를 찾아서 찾아와라. 축약하는 방법 
SELECT O.ORDERID, O.ORDERDATE, C.CUSTOMERNAME
  FROM customers AS C, orders AS O
 WHERE C.CUSTOMERNAME= 'AROUND THE HORN' # c는 테이블을 말하고.뒤에 컬럼이 온다.
   AND C.CUSTOMERID= O.CUSTOMERID;
   
SELECT * FROM customers;

SELECT * FROM orders;

#join
/* 
INNER JOIN 공통 부분만 뽑아낼때 사용
left join 왼쪽을 중심으로 공통부분까지 뽑아낸다
right join 오른쪽을 기준으로 공통부분까지 뽑아낸다.
crossjoin  양쪽 모든 데이터를 가지고 온다.*/

SELECT orders.OrderID
       customers.CustomerName
       orders.OrderDate
  FROM orders
 INNER JOIN customers
       ON orders.CustomerID = customers.CustomerID;
 ORDER BY orders.oderid;

SELECT orders.OrderID,
       orders.OrderDate
  FROM orders
  ORDER BY orders.OrderID;



#LEFT JOIN
SELECT customers.CustomerName, orders.OrderID
FROM customers, orders
WHERE customers.CustomerID = orders.CustomerID
ORDER BY customers.CustomerName;   

#RIGHT JOIN
SELECT orders.OrderID, employees.LastName, employees.FirstName
FROM customers, orders
WHERE customers.CustomerID = orders.CustomerID
ORDER BY customers.CustomerName;   

#CROSS JOIN
SELECT customers.CustomerName, orders.OrderID
FROM orders
RIGHT JOIN employees ON orders.
ORDER BY customers.CustomerName;   



# UNION 붙여넣기
select city from customers
union # 중복값은 지운다
select city from suppliers
order by city;

# UNION 붙여넣기
SELECT CITY FROM customers
UNION ALL# 중복값을 모두 포함시킨다.
SELECT CITY FROM SUPPLIERS
ORDER BY CITY;



SELECT COUNTRY, COUNT(CUSTOMERID)
  FROM customers
  GROUP BY COUNTRY
  ORDER BY COUNT(CUSTOMERID) DESC #가장 많은순서로 뽑아줘
  LIMIT 3; #중요한 3가지만 보고싶어
  
SELECT shippers.ShipperName, COUNT(orders.OrderID) AS NUMBEROFORDERS FROM orders
LEFT JOIN shippers ON ORDER



SELECT country, COUNT(customerid)
  FROM customers
GROUP BY country
HAVING COUNT(customerid) > 5;
ORDER BY COUNT(customerid) DESC;

SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM Order_Details
  WHERE Quantity = 10);