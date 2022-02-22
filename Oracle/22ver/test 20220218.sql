-- table ��Ϻ���
select * from tab;

-- create�� ����� drop���� �����
-- ( ) : field list
-- �̸� �ڷ���
-- varchar varchar2 �뷮 ���� (2�� �� ũ��)
-- ������ ��찡 �ƴ϶�� ���ڸ� ���� ����
create table sampletable (
    num number,
    name varchar2(20) not null,
    phone varchar2(15),
    address varchar2(50)
);

-- ���� ���ڵ� ����
select * from sampletable;

--Ư�� �ʵ常 ����
select name, address from sampletable;

---------------------------------------insert---------------------------------------
-- ���ڵ� ����(�߰�)
-- oracle�� ���ڵ� ���ڿ��̵� ''     << ������!
-- ""�� AS(�˸��ƽ�_��Ī) �� ����
-- �ʵ�� ���� �����͸� ���� ��� ���� ���Ѽ� ����
insert into sampletable values (10, '2jelee', '010-1234-5678', '��õ');
insert into sampletable values (20, '2jelee2', '010-9876-5432', '��⵵');

-- �ʵ���� ���� �׿� ���� ���� ���Ѽ� ����
insert into sampletable (name, address, phone, num) values ('aa', '����', '010-1111-1111', 30);
insert into sampletable (name, address) values ('bb', '����');
insert into sampletable (address, phone) values ('�λ�', '12345');

insert into sampletable (name, address, phone) values ('3jelee','�λ�', '12345');


commit;

---------------------------------------update---------------------------------------
--insert�� �Ϳ� ���� ��ü ����
update sampletable set name='��Ÿ��';

--�ߴ� ���� ���(���󺹱�)
ROLLBACK;

select * from sampletable;

--���ǿ� �´� �͸� ����
update sampletable set name='��Ÿ��' where name='2jelee2';
--���ǿ� �°� ������ ����
update sampletable set name='2��Ÿ��', address='����' where name='��Ÿ��';

--���̺� ���� Ȯ��
desc sampletable;

---------------------------------------delete---------------------------------------
--���� ���� select�� �غ���!
--���� (from ��������)
--��ü ���ڵ� ����
delete sampletable;

--���ǿ� �´� ���ڵ� ����
delete sampletable where name='2jelee2';

---------------------------------------drop---------------------------------------
--drop : ���̺� ����
--�̴� rollback �� �� ����.
drop table sampletable;


select * from emp2;
desc emp2;
select empno, name, emp_type, deptno from emp2;

select *
    from emp2
    where emp_type='�����'
    order by name; --�������� ����(����� �����ټ�)
    
select *
    from emp2
    where emp_type='�����'
    order by name    desc; --�������� ����
    
--�۾��ڰ� �������� Ȯ��
show user;
    
--������ ��¥ �������� (���ڵ� ����ŭ ������)
select sysdate from emp2;

-- oracle�� ������ ���̺��� ������. �̴� dual
select sysdate from dual; 




------------------------��������------------------------

create table userlist (
    id varchar2(10) constraint id_pk primary key,
    name varchar2(10) not null 
);

select * from userlist;

insert into userlist values ('2jelee', '������');
insert into userlist values ('2jelee', '����');

insert into userlist (id) values('rrr');


select * from professor;
select * from student;
select * from department;


CREATE TABLE userlist2(
    id VARCHAR2(10) CONSTRAINT userlist2_id_pk PRIMARY key, 
    jumin char(13)  CONSTRAINT jumin_un unique  --not null
);

select * from userlist2;
insert into userlist2 values ('bb', '222');
insert into userlist2 values ('aa', '111');

insert into userlist2 values ('lee', '111');
insert into userlist2 values ('lee', '111222');

insert into userlist2 (id) values ('kim');



CREATE TABLE ck_Test(
    NAME VARCHAR2(10) NOT NULL,
    age NUMBER(2) NOT NULL 
    CHECK (age BETWEEN 20 AND 30 )  --age�÷��� ���� 20~30���̸� ���
);

select * from ck_test;

insert into ck_test values('aa', 20);
insert into ck_test values('aa', 31);
insert into ck_test values('bb', 30);
insert into ck_test values('cc', 25);

--drop table ck_test;

CREATE TABLE de_Test(
    NAME VARCHAR2(10) NOT NULL,
    addr VARCHAR2(10) DEFAULT '����'
);

select * from de_test;

desc de_test;

insert into de_test values('ii', 'incheon');
insert into de_test values('bb', 'busan');
insert into de_test (name) values('jj');
insert into de_test values('ss', default);
insert into de_test values('zz'); 