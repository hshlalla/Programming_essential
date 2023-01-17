SELECT * FROM USER;

SELECT * FROM help_category;

# database 생성
CREATE DATABASE testdb;

# DataBase 삭제
DROP DATABASE testdb;

# testDb내에 Table생성

CREATE TABLE test_tb1
         (id          INT,
          class       VARCHAR(3),
          my_date     DATE,
          remark      VARCHAR(10),
         PRIMARY KEY (id) );
         
/* 데이터 삭제하기*/
DROP TABLE test_tb1;

/* 데이터 테이블은 놔두고 내용만 지우기*/
TRUNCATE TABLE test_tb1;

#기존테이블이 있으면 실행하지 말고 없으면 생성하라
CREATE TABLE if not exists test_tb1
         (id          INT,
          class       VARCHAR(3),
          my_date     DATE,
          remark      VARCHAR(10),
         PRIMARY KEY (id) );

#잘못만들었다면 alter로 변경할 수 있다.        
ALTER TABLE test_tb1
  
  MODIFY class VARCHAR
  
DESC test_tb1


1, "A", "2021-07-21", "하나"

INSERT INTO test_tb1 VALUES (1, "A", "2021-07-21", "하나");

INSERT INTO test_tb1 (id,class,my_date,remark)
            VALUES (2,"B","2021-07-21","둘");
            
INSERT INTO test_tb1 VALUES (3, "C","2021-07-21","33");

INSERT INTO test_tb1 (id, class, remark)
                     VALUES (4, "D", "444");
                     