/*[예제 6-2] 외부조인 : 모든 데이터를 연결하기
employees테이블과 departments테이블을 department_id로 외부 조인하여 
department_id가 NULL값인 Kimberely GRANT도 함께 출력 

SELECT A.employee_id, A.first_name, A.last_name, 
       B.department_id, B.department_name
FROM   employees A 
       LEFT OUTER JOIN departments B ON
                 A.department_id = B.department_id
ORDER BY A.employee_id;*/




1번

SELECT COUNT(*) 주문완료건,
       SUM(
  FROM reservation r, order_info o
  WHERE cancel = "n"
  AND r.reserv_no = o.reserv_no
  

#2번 전체 상품의 총 판매량과 총 매출액 전용상품의 판매량과 매출액을 출력
item_id="m0001"

SELECT COUNT(*) 총판매량,
       SUM(b.sales) 총 매출,
       SUM(case b.item_id when 'm0001'
                then 1 ELSE 0
           END) 전용상품판매량
       SUM(case b.item_id when 'm0001'
                then b.sales ELSE 0
           END) 전용상품매출
  FROM reservation a, order_info b
  WHERE a. reserv_no
분석2)

분석 3) 각 상품별 전체 매출액을 내림차순으로 출력

SELECT i.item_id 상품코드, 
       i.product_name 상품이름, 
		 sum(o.sales) 상품매출
  FROM reservation r, order_info o, item i; 
  WHERE r.reserv_no = o.reserv_no 
  AND r.cancel = 'n'
  AND o.item_id = i.item_id
  GROUP BY i.item_id, i.product_name
  ORDER BY SUM(o.sales) DESC;
