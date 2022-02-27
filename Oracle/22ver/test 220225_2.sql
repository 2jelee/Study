/*
[���ڵ� ����]

���� :
insert into ���̺��
    select �÷���, ... from ���̺��
*/
--��ü ����
select * from c_emp;
--����(�μ���ȣ�� 20�� ���ڵ�)�� �´� ���̺� ����
select * from c_emp_20;
--empno, ename, job, sal ���ϴ� �ʵ常 ����
select * from c_emp3;
--�������� ����� ���� (���ڵ� ���� ����)
select * from c_emp4;

--���ڵ� ����
insert into c_emp4 --���� ������ ���� �����Ƿ� error
    select ename, mar, sal, deptno from emp;

-- ���� ������ ���� ����
insert into c_emp4 (ename, mgr, sal, deptno)
    select ename, mgr, sal, deptno from emp;
select * from c_emp4; --���õ��� ���� ���� null�� �� ������ �� �� �ִ�.

--�ٸ� ���̺����� ���ڵ� ���� ����
desc c_emp4;
--data type, field ����, ������ ũ�⸦ ����� insert ����
insert into c_emp4 ( hiredate )
    select birthday from emp2; 
 
select * from c_emp4;  --4, 9, date, 7
desc emp2;             --4, 

/*
rownum : �˻� �� �� �ڵ� �� ��ȣ �߰�
�Խ��� ���� �� ����¡ ó�� �� ���
ex) 1 limit 7 : mySQL
*/ 
select * from emp;
select rownum, ename, job, sal from emp;

select rownum, job from emp where rownum=3; --���������� �� �ִ� field�� �ƴϹǷ�

select rowid, ename, job, sal from emp;

--0227�߰�
select  ename, job, rownum,sal from emp;

select rownum, job from emp where sal > 3000; -- rownum : ���� ���� X
select rownum, job sal, rowid from emp; --  where sal > 3000; 

-- ���� ���̺� : dual 
select sysdate from dual;
-- //

-----------------------Sequence-----------------------
/*
create sequence �������̸�    --1���� ���� 1�� ����
    [start with ���۰�]
    [increment by ����ġ]
    [maxvalue �ִ밪]
    [minvalue �ּҰ�]
    [cycle | nocycle ]
    [cache | nocache ]
*/
drop sequence autonum;

create sequence autonum; --1���� �����ؼ� 1�� ����

 --�������� ����
select autonum.nextval from dual;

 --���� �������� ��������
select autonum.currval from dual;
 
--Sequence�� number type�� ����.
create table kosa_T (
   no number,
   name varchar2(20)
);    

insert into kosa_T values(autonum.nextval, 'aa');
insert into kosa_T values(autonum.nextval, 'bb');
insert into kosa_T values(autonum.nextval, 'cc');

select * from kosa_T;
 
 
create SEQUENCE seq_kosa;
insert into kosa values(seq_kosa.nextval, 'aa', 'name');
insert into kosa values(seq_kosa.nextval, 'bb', 'name');
insert into kosa values(seq_kosa.nextval, 'cc', 'name');
insert into kosa values(seq_kosa.nextval, 'dd', 'name'); 
--re

create sequence seq_kosa
    increment by 100; --100�� ����  

create table kosa2(
    num number,
    id varchar2(20),
    name varchar2(20)
);
insert into kosa2 values(seq_board.nextval, 'aa', 'name');
insert into kosa2 values(seq_board.nextval, 'bb', 'name');
insert into kosa2 values(seq_board.nextval, 'cc', 'name');



---re---

create sequence seq_jumin_no
    increment by 10
    start with 10
    maxvalue 150
    minvalue 9
    cycle
    cache 2 --cycle���� cache�� 1���� Ŀ���Ѵ�.
;
 
drop table jumin;

create table jumin_T(
    seq number,
    name varchar2(10),
    phone varchar2(15)
) segment creation immediate;

--segment��?

insert into jumin_T values (seq_jumin_no.nextval, 'aa', 111);
insert into jumin_T values (seq_jumin_no.nextval, 'bb', 222);
insert into jumin_T values (seq_jumin_no.nextval, 'cc', 333);

select * from jumin_T;

delete jumin_T;
drop sequence seq_jumin_no;



-----Transaction-----
--���� ����(c_)
create table c_emp100
as
    select * from emp where 1=2; --���ǿ� ���� ���� ����

--������ �о�ֱ�

BEGIN --�� ���ݺ��� �������ν��� �����ҰŴ�
END; --���̴� 

BEGIN
    for i in 1..10000 LOOP
        insert into c_emp100
            select * from emp;
    END LOOP;
END;
 --10,000���� ����
 select * from c_emp100;
 
 ROLLBACK;
 COMMIT;
 
 update c_emp100 set sal=1000;
 
 -----------
 update c_emp100 set sal=10 where deptno=30;
 savepoint update_sal_30;
 
update c_emp100 set sal=1 where deptno=30;

 select * from c_emp100;
 select sum(sal) from c_emp100;
 rollback to savepoint update_sal;
 
 --�ǽ� X ..
 
 
 commit / rollback; -- DML ��ɿ� ����ȴ�.
 
 --�ٸ� ������ �ִ� ���̺� �����ϱ�
 /*
 ���� ���ӵ� user �˾ƿ���
show user;
- �ٸ������� �ִ� ���̺� �����ϱ� ���ؼ��� ���Ѽ��� �ʿ�.
1. system�������� �����Ͽ� ���Ѻο�
grant all on ������.���̺��̸� to ������;
2. �ٸ� �������� ����
conn ������/���
3. �ٸ� ������ �ִ� ���̺������ϱ�
SELECT * FROM ������.���̺��̸�;
4. ���� ���
revoke all on ������.���̺��̸� from ������;
 */
 
 show user;
 
 
 
 ----------------------------------------
 /*
 1. ���̺��� export �ϴ� ���.
    => data�� �ű�� ���� ���̺��� dmp ���Ϸ� �����.
    ���) cmd â������(cmdâ ��ġ�� ��� ����.)
    exp id/pwd tables=(xxx,xxx,xxx ...) file=c:\aaa.dmp
    exp id/pwd file=c:\aaa.dmp -> ������̺� ���
    => xxx�κ��� ���̺��̸����� ������ �������ϴ� ���̺� �̸����޸��� �����Ѵ�.
    => aaa.dmp�� aaa�� ���ϴ� ���ϸ������Ѵ�. c:\������ ���������.
2. ������� aaa.dmp ������ import �ϴ� ���.
    ���) cmd â�� ����.(cmdâ ��ġ�� ��� ����.)
    imp id/pwd ignore=y full=y file=c:\aaa.dmp
    imp id/pwd file=c:\aaa.dmp full=y 
    => c:\aaa.dmp�� export�� ���� ���� ������ �������
    ���� ��ǻ���� c:\������ �־���ƾ��Ѵ�.
    => ������ ���̺��� ���� �Ѵٸ� �����Ͱ� �߰� �ǰ�
    ���̺��� ���� ���� ������ ���̺��� �ڵ����� ����� �߰��ȴ�.
 */
 /*
 �ɷ��ִ� �������Ǳ��� ����
 drop table table�� [CASCADE CONSTRAINTS];
 */
 
 drop table dept CASCADE CONSTRAINTS; 