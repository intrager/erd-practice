-- Q1. 모든 고객의 이름과 이메일을 가져오는 질의
select customer_name, email
from customer;

-- Q2. 특정 지역(예: '서울특별시')에 사는 고객의 이름과 전화번호를 가져오는 질의
select c.customer_name, c.phone_number
from region r
inner join customer c
        on r.region_code = c.region_code 
where r.region_code = '02';

-- Q3. '2024ITEMA3'번 제품의 각 구매수량과 구매일자를 출력하세요.
select o.quantity, o.order_date
from product p
inner join "order" o
        on p.product_code = o.product_code
where o.product_code = '2024ITEMA3';

-- Q4. 제품별로 구매된 총 수량과 총 가격을 계산하여 출력하세요.
select p.product_name, sum(o.quantity), sum(p.price)
from "order" o
inner join product p
        on o.product_code = p.product_code
group by p.product_name;

-- Q5. 각 지역별로 고객 수를 계산하여 출력하세요.
select r.region_name, count(c.customer_code)
from region r
inner join customer c
        on r.region_code = c.region_code
group by r.region_name;

-- Q6. 특정 고객(2024A3)이 구매한 제품의 이름을 출력하세요.
select p.product_name
from customer c
inner join "order" o
        on c.customer_code = o.customer_code
inner join product p
        on o.product_code = p.product_code
where c.customer_code = '2024A3';

                         
