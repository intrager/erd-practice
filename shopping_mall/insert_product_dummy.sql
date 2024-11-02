-- product 테이블에 데이터 추가
insert into product (
    product_code
  , product_name
  , price
)
select '2024ITEMA1', '노트북', 2500000 from dual
union all
select '2024ITEMA2', '스마트폰', 1500000 from dual
union all
select '2024ITEMA3', '키보드', 100000 from dual
union all
select '2024ITEMA4', '마우스', 30000 from dual
union all
select '2024ITEMA5', '이어폰', 80000 from dual
;

commit;