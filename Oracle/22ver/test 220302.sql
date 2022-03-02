--���Խ� ǥ��
select * from reg_test;
/*
���ڿ�(�Ǵ� ���ڿ� ���� �ʵ��), ����, [�ɼ�] i: ��ҹ��� ���� X
*/
select * from reg_test where REGEXP_LIKE (text, '([aeiou])\1', 'i');


-- [ �� ] ���̿� �ִ� ���ڵ� �� �ϳ�
select * from reg_test where REGEXP_LIKE (text, '([abc])');

--�ҹ��� a~z ���� ����
select * from reg_test
    where regexp_like(text, '[a-z] [0-9]');

insert into reg_test values('789ABC');
insert into reg_test values('789 ABC');
insert into reg_test values('123kbs');
insert into reg_test values('mbc567');
insert into reg_test values('sbs 123');

select * from reg_test;

--�ҹ��ڳ� �����̳� ���ڰ� ���� ��
select * from reg_test where regexp_like(text, '[a-z]?[0-9]'); --��ҹ��� ���� X [?]
select * from reg_test where regexp_like(text, '[0-9]?[a-z]');
select * from reg_test where regexp_like(text, '[A-Z]*[0-9]'); --��ҹ��� ���� X [*]
select * from reg_test where regexp_like(text, '[A-Z]?[0-9]');
select * from reg_test where regexp_like(text, '[0-9]?[A-Z]'); --(text, '[0-9]?[a-z]');�� �����ϱ�

rollback;



create user jel
  identified by xxxxxxAt22cc
  default tablespace data   --data����
  temporary tablespace temp --temp����
  quota 10G on data;
  
--����, ���� ���� �ο�
grant connect, resource to jel;

--drop user jel;

--lock ����
alter user jel account unlock; 

--���������� lock ���� ���ÿ�
create user jel identified by xxxxxxAt22cc account unlock;

show user;