-- product ���̺� ������ �߰�
insert into product (
    product_code
  , product_name
  , price
)
select '2024ITEMA1', '��Ʈ��', 2500000 from dual
union all
select '2024ITEMA2', '����Ʈ��', 1500000 from dual
union all
select '2024ITEMA3', 'Ű����', 100000 from dual
union all
select '2024ITEMA4', '���콺', 30000 from dual
union all
select '2024ITEMA5', '�̾���', 80000 from dual
;

commit;