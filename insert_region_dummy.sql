-- region ���̺� ������ �߰�
insert into region(
    region_code
  , region_name
)
select '02', '����Ư����' from dual
union all
select '031', '��⵵' from dual
union all
select '032', '��õ������' from dual
union all
select '033', '����Ư����ġ��' from dual
union all
select '041', '��û����' from dual
union all
select '042', '����������' from dual
union all
select '043', '��û�ϵ�' from dual
union all
select '044', '����Ư����ġ��' from dual
union all
select '051' , '�λ걤����' from dual
union all
select '052' , '��걤����' from dual
union all
select '053' , '�뱸������' from dual
union all
select '054' , '���ϵ�' from dual
union all
select '055' , '��󳲵�' from dual
union all
select '061' , '���󳲵�' from dual
union all
select '062' , '���ֱ�����' from dual
union all
select '063' , '����ϵ�' from dual
union all
select '064' , '����Ư����ġ��' from dual; 

commit;
select * from region;