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

-- Q7. 고객이 속한 지역별 총 구매량을 출력하세요.
select r.region_name, oc.total
from region r
inner join (
            select c.region_code, sum(o.quantity) as total
            from customer c
            inner join "order" o
                    on c.customer_code = o.customer_code
            group by c.region_code
            ) oc
        on r.region_code = oc.region_code;
                         
select r.region_name, sum(o.quantity)
from region r
inner join customer c
        on r.region_code = c.region_code
inner join "order" o
        on c.customer_code = o.customer_code
group by r.region_name;

-- Q8. 제품의 평균 가격보다 높은 가격을 가진 제품의 이름과 가격을 출력하세요.
select p.product_name, p.price
from product p
where p.price > (
                 select avg(price)
                 from product
                );
                
                
-- Q9. 고객별 구매한 총 제품 종류 수를 출력하세요.
select c.customer_code, c.customer_name, count(o.quantity) as product_count
from customer c
inner join "order" o
        on c.customer_code = o.customer_code
group by c.customer_code, c.customer_name;

-- Q.10 고객 정보를 입력하세요.
insert into customer (
    customer_code
  , customer_name
  , phone_number
  , email
  , address
  , region_code
) values (
    '2024A6'
  , '임정민'
  , '010-1234-4321'
  , 'lim@example.com'
  , '경기도 의정부시'
  , '031'
);

select CUSTOMER_CODE ,
CUSTOMER_NAME ,
PHONE_NUMBER ,
EMAIL ,
ADDRESS ,
REGIST_DATE ,
REGION_CODE 
from customer;

-- TODO : regist_date가 default 처리가 안 되어서 다시 확인 해야함
update customer
set regist_date = sysdate;

commit;

insert into customer (
    customer_code
  , customer_name
  , phone_number
  , email
  , address
  , region_code
  , regist_date
) values (
    '2024A7'
  , '한정수'
  , '010-7777-8888'
  , 'han@example.com'
  , '서울시 관악구'
  , '02'
  , sysdate
);

-- Q11. 임정민 고객의 주소를 수정하세요.
update customer
set address = '서울시 도봉구'
  , region_code = '02'
where customer_name = '임정민'
  and customer_code = '2024A6';
  
select * from customer;

commit;

-- Q12. 홍길동 고객을 삭제하세요.

-- 주문 내역 먼저 삭제
delete from "order"
where customer_code = '2024A1';

delete from customer
where customer_name = '홍길동'
  and customer_code = '2024A1';
  
commit;

-- Q13. 한정수 고객이 노트북 2개를 주문했을 경우 구매 테이블에 입력하세요.
insert into "order" (
    customer_code
  , product_code
  , order_code
  , quantity
  , order_date
) values (
    (select customer_code from customer where customer_name = '한정수' and customer_code = '2024A7')
  , (select product_code from product where product_name = '노트북')
  , '2024ORDERA11'
  , 2
  , sysdate
);

select * from "order";

commit;
