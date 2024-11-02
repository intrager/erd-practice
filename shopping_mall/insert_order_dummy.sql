-- order 테이블에 데이터 추가
insert into "order" (
    customer_code
  , product_code
  , order_code
  , quantity
  , order_date
)
select '2024A1', '2024ITEMA1', '2024ORDERA1', 2, sysdate from dual
union all
select '2024A2', '2024ITEMA2', '2024ORDERA2', 1, sysdate from dual
union all
select '2024A3', '2024ITEMA3', '2024ORDERA3', 5, sysdate from dual
union all
select '2024A4', '2024ITEMA4', '2024ORDERA4', 3, sysdate from dual
union all
select '2024A5', '2024ITEMA5', '2024ORDERA5', 2, sysdate from dual
union all
select '2024A1', '2024ITEMA2', '2024ORDERA6', 3, sysdate from dual
union all
select '2024A2', '2024ITEMA1', '2024ORDERA7', 1, sysdate from dual
union all
select '2024A3', '2024ITEMA4', '2024ORDERA8', 2, sysdate from dual
union all
select '2024A4', '2024ITEMA3', '2024ORDERA9', 4, sysdate from dual
union all
select '2024A5', '2024ITEMA5', '2024ORDERA10', 1, sysdate from dual
;

commit;

