-- customer ���̺� ������ �߰�
insert into customer (
    customer_code
  , customer_name
  , phone_number
  , email
  , address
  , region_code
)
select '2024A1', 'ȫ�浿', '010-1234-5678', 'hong@example.com', '����� ������', '02' from dual
union all
select '2024A2', '��ö��', '010-9876-5432', 'kim@example.com', '��⵵ ������', '031' from dual
union all
select '2024A3', '�̿���', '010-1111-2222', 'lee@example.com', '��õ�� ����', '032' from dual
union all
select '2024A4', '�ڹ���', '010-3333-7777', 'park@example.com', '������ ��õ��', '033' from dual
union all
select '2024A5', '����ȣ', '010-2222-5555', 'jeong@example.com', '������ �߱�', '042' from dual
;

commit;