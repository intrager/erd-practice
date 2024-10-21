-- Q1. 모든 고객의 이름과 이메일을 가져오는 질의
select customer_name, email
from customer;

-- Q2. 특정 지역(예: '서울특별시')에 사는 고객의 이름과 전화번호를 가져오는 질의
select c.customer_name, c.phone_number
from region r
inner join customer c
        on r.region_code = c.region_code 
where r.region_code = '02';

-- Q3. '2024ITEMA3'번 제품의 각 구매수량과 구매일자를 출력
select o.quantity, o.order_date
from product p
inner join "order" o
        on p.product_code = o.product_code
where o.product_code = '2024ITEMA3';