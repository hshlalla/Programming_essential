#데이터 베이스 생성
create database modu_sql_hr
DROP TABLE modu_sql_hr;
#테이블 생성
CREATE TABLE countries
            (
             country_ID         CHAR(2),
             country_name       VARCHAR(40),
             region_id          INT(11),
             PRIMARY KEY (country_ID));
             

CREATE TABLE departments
            (
             department_ID       int,
             department_name     VARCHAR(30),
             manager_id          int,
             location_id         INT,
             PRIMARY KEY (department_ID));
             

CREATE TABLE Employees
            (
             EMPLOYEE_ID      INT(6),
             FIRST_NAME       VARCHAR(30),
             LAST_NAME        VARCHAR(30),
             EMAIL            VARCHAR(30),     
             PHONE_NUMBER     VARCHAR(30),
             HIRE_DATE        DATE,
             JOB_ID           VARCHAR(30),
             SALARY           DECIMAL(8,2),
             COMMISSION_PCT   DECIMAL(8,2),
             MANAGER_ID       INT(6),
             DEPARTMENT_ID    INT(4),
      
             PRIMARY KEY (EMPLOYEE_ID));
             

CREATE TABLE job
            (
             JOB_ID          VARCHAR(10),
             JOB_TITLE       VARCHAR(35),
             MIN_SALARY      INT(6),            
             MAX_SALARY      INT(6),
             PRIMARY KEY (JOB_ID));
             

CREATE TABLE Job_history
            (
             EMPLOYEE_ID      INT(6),
             START_DATE       DATE,
             END_DATE         DATE,
             JOB_ID           VARCHAR(10),
             DEPARTMENT_ID    INT,
             PRIMARY KEY (EMPLOYEE_ID, START_DATE));
             

CREATE TABLE locations
            (
             LOCATION_ID         INT(4),
             STREET_ADDRESS      VARCHAR(40),
             POSTAL_CODE         VARCHAR(12),
             CITY                VARCHAR(30),
             STATE_PROVINCE      VARCHAR(25),
             COUNTRY_ID          CHAR(2),


             PRIMARY KEY (LOCATION_ID));
             

CREATE TABLE regions
            (
             REGION_ID         INT(11),
             REGION_name       VARCHAR(25),
            
             PRIMARY KEY (REGION_ID));
             

CREATE TABLE Sample_product
            (
             PRODUCT_ID         INT(11),
             PRODUCT_name       VARCHAR(30),
             MANU_DATE          DATE,
             FACTORY            VARCHAR(10));

             
INSERT INTO countries VALUES ("AR","Argentina",2);
INSERT INTO countries VALUES ("AU","Australia",3)
INSERT INTO countries VALUES ("BE","Belgium",1)
INSERT INTO countries VALUES ("BR","Brazil",2)
INSERT INTO countries VALUES ("CA","Canada",2)
INSERT INTO countries VALUES ("CH","Switzerland",1)
INSERT INTO countries VALUES ("CN","China",3)
INSERT INTO countries VALUES ("DE","Germany",1)
INSERT INTO countries VALUES ("DK","Denmark",1)
INSERT INTO countries VALUES ("EG","Egypt",4)
INSERT INTO countries VALUES ("FR","France",1)
INSERT INTO countries VALUES ("IL","Israel",4)
INSERT INTO countries VALUES ("IN","India",3)
INSERT INTO countries VALUES ("IT","Italy",1)
INSERT INTO countries VALUES ("JP","Japan",3)
INSERT INTO countries VALUES ("KW","Kuwait",4)
INSERT INTO countries VALUES ("ML","Malaysia",3)
INSERT INTO countries VALUES ("MX","Mexico",2)
INSERT INTO countries VALUES ("NG","Nigeria",4)
INSERT INTO countries VALUES ("NL","Netherlands",1)
INSERT INTO countries VALUES ("SG","Singapore",3)
INSERT INTO countries VALUES ("UK","United Kingdom",1)
INSERT INTO countries VALUES ("US","United States of America",2)
INSERT INTO countries VALUES ("ZM","Zambia",4)
INSERT INTO countries VALUES ("ZW","Zimbabwe",4);