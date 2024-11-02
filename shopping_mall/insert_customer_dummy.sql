-- customer 테이블에 데이터 추가
insert into customer (
    customer_code
  , customer_name
  , phone_number
  , email
  , address
  , region_code
)
select '2024A1', '홍길동', '010-1234-5678', 'hong@example.com', '서울시 강남구', '02' from dual
union all
select '2024A2', '김철수', '010-9876-5432', 'kim@example.com', '경기도 수원시', '031' from dual
union all
select '2024A3', '이영희', '010-1111-2222', 'lee@example.com', '인천시 남구', '032' from dual
union all
select '2024A4', '박민지', '010-3333-7777', 'park@example.com', '강원도 춘천시', '033' from dual
union all
select '2024A5', '정기호', '010-2222-5555', 'jeong@example.com', '대전시 중구', '042' from dual
;

commit;