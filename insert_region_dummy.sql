-- region 테이블에 데이터 추가
insert into region(
    region_code
  , region_name
)
select '02', '서울특별시' from dual
union all
select '031', '경기도' from dual
union all
select '032', '인천광역시' from dual
union all
select '033', '강원특별자치도' from dual
union all
select '041', '충청남도' from dual
union all
select '042', '대전광역시' from dual
union all
select '043', '충청북도' from dual
union all
select '044', '세종특별자치시' from dual
union all
select '051' , '부산광역시' from dual
union all
select '052' , '울산광역시' from dual
union all
select '053' , '대구광역시' from dual
union all
select '054' , '경상북도' from dual
union all
select '055' , '경상남도' from dual
union all
select '061' , '전라남도' from dual
union all
select '062' , '광주광역시' from dual
union all
select '063' , '전라북도' from dual
union all
select '064' , '제주특별자치도' from dual; 

commit;
select * from region;