select * from student;

--ANY : �˻� ����� �ϳ� �̻��� ��ġ�ϸ� true
--ALL : �˻� ����� ��� ���� ��ġ�ϸ� true
select * from student where weight > any(70, 80);
select * from student where weight < any(60, 70);

select Deptno2, nvl(deptno2, 0) from student;

select * from professor;
select * from professor where deptno in(103, 203);
select * from professor where deptno=103 or deptno=203;
select * from professor where deptno not in(103,203);

select * from professor where position in('������', '������');
select * from professor where position in('^������', '������');
select * from professor where position not in('������', '������');

---------------------------------------------------------------------

select * from gift;

select sum(g_start), sum(g_end) from gift;
--title �ٸ��� �ؼ� ����
select sum(g_start) "���۰� �հ�", sum(g_end) "��ǰ�ִ��� ����" from gift;

select sum(g_start), avg(g_start), max(g_start), min(g_start) from gift;

select * from professor; --16��
--���� ����
select count(*) from gift;
select count(*) from professor; --count(*) : null ���� ���� �����ش�.
select count(hpage) from professor; -- null�� ������ hpage�� �����ش�. => null ������

insert into gift(gname, g_end) values('����', 3000);
desc gift;
select count(*) from gift;
select count(gname) from gift;

--rank(expr) whithin group(order by �÷��� asc | desc )
select RANK(600000) within group(order by g_end desc) from gift;

select g_start from gift;
--Oracle vs MySQL => Oracle�� null���� �켱���� �� / MySQL�� null���� �켱���� ��
select RANK(900001) within group(order by g_start desc) from gift; --1�� : null 2�� : 900001
select RANK(900001) within group(order by g_start desc) 
    from gift
    WHERE g_start is not null; -- null �����ϸ� 1�� ���´�.


--Q1.Ű�� 168�� ����� �� ��°�� ū��?
select * from student;
select RANK(168) within group(order by height desc)
    from student;
--Q2. �����԰� 58�� ����� �� ��°���� ��� ���ϱ�
select RANK(58) within group(order by weight desc) from student;
--Q3.g_end �� 200000, 600000���� ���� �� ���(any���)
select * from gift;
select * from gift where g_end < any(200000, 600000);
--Q4. �л����� Ű�� �հ� ���, ���� Ű�� ū ģ��, ���� ģ�� ���
select * from student;
select sum(height), avg(height), MAX(height), MIN(height) from student;


--�����Լ� ��� �� GROUP BY : �Ұ�(�κ���)
select * from student;
--�׷�(����)�Լ��� �Ϲ� �ʵ�� ���� �� �� X
select grade, sum(height), avg(height), max(height), min(weight)
    from student
    group by grade;
    
-- emp2 ���̺��� emp_type ���� pay ��, ���, �ְ� �޿�, ���� �޿� ���ϱ�
select * from emp2;
select emp_type, sum(pay), avg(pay), max(pay), min(pay) from emp2 GROUP BY emp_type;

--(where���� �ƴ�) ���� �ֱ� -> having �� �̿�      => having���� �ܵ����� �� �� ���� GROUP BY�� �Բ� ����Ѵ�. => ��, ���ǿ� �´� ���� �̾Ƴ��ڴ�.
--1.
select grade, sum(height), avg(height), max(height), min(weight)
    from student
    group by grade; 
--2. ��ü ���Ű ���ϱ�
select avg(height) from student; -- ��� : 172.1 => �� 173���� ����

select grade, sum(height), avg(height), max(height), min(weight)
    from student
    group by grade; 

--emp2 ���̺� �̿�
/*
1. �μ� deptno ���� pay �հ� ��� ���ϱ�
2. �μ� emp_type ���� pay �հ� ��� ���ϱ�
3. ���޺�(position)���� �޿� ��, ��� ���ؼ� �޿��� ��ü ��պ��� ���� �޴� ��� ���ϱ�
4. ���޺��� �޿� ��, ����� ���ϴµ� ������ ������ ����鸸 ���
*/
select * from emp2;

--1.
select deptno, sum(pay), avg(pay) from emp2 group by deptno;

--2.
select emp_type, sum(pay), avg(pay) from emp2 group by emp_type;

--3.
select avg(pay) from emp2;
select position, sum(pay), avg(pay) 
    from emp2 
    /*
    group by position
    where pay>any(43100000);  
    */
    where pay > (select avg(pay) from emp2)
    group by position;
    
--3�� ���� ��ȯ
select position, sum(pay), round(12.3456, 2), round(avg(nvl(pay, 0)), 2) 
    from emp2 
    where position is not null
    group by position
    having position = '����';


--4.
select position, sum(pay), avg(pay) 
    from emp2 
    group by position 
    having position='����';

-------------------------------�����Լ�-------------------------------
--�������̺� dual
-- round(����, �ڸ���) => �ݿø�
-- ceil(����) => �ø��� �� ������ȯ
-- floor(����)=>������ �� ���� ��ȯ
-- mod(����, ���� ��) => ������
-- trunc(����, �ڸ���) => ����
select round(12.356789, 0), round(12.3456789, 2), round(12.56789, 0) from dual;

--������ �ø�
select ceil(12.34), ceil(-12.34) from dual;
--������ ����
select floor(12.34), floor(-12.34) from dual;
--�ݿø� �ȵǰ� ����
select trunc(12.3456, 2), trunc(12.3756, 2), trunc(12.7456, 0) from dual;


/* 2�� 73 ~ */


select * from professor;
--1. ���� ���̺��� ���޿� �λ�� 2%�� ����� ���(�Ҽ��� 0���� ó��)
select pay from professor;
select pay*1.02 from professor;

--teacher
update professor set pay=(pay*0.2);
rollback;

--2. ���� ���̺��� ��� �������� ���ʽ� 1000���� �߰� �����ϱ� (null ó���� ��)
select bonus, nvl(bonus,0)+1000 from professor;

----------------���ڿ� �Լ�----------------
--upper
select UPPER(ID) from professor;
--initcap
select initcap(ID) from professor;

select length(id), length('abcd') from professor;

--���ڸ� ���� ���� �Ǻ��ϱ�
select substr(jumin, 7, 1) from gogak; --�����̺�
select instr('abcd', 'b') from dual; --java(�Ӹ� �ƴ϶� �ٸ� ���α׷��� �� ��������)�� �ٸ��� index number�� start Number�� 1����!
--DB�� index ��ȣ 1���� �����Ѵ�.

select id, instr(id, 'b') from professor;
-- '-1'�� ������ �տ������Ͱ� �ƴ϶� '��'�������� ã�´�
--�������� ������ �ڿ��� ���� ã�´�.
select instr('abcdefg', 'b', -1) from dual;
select instr('abcdefg', 'b', -3) from dual;

--���ʿ������� ������ ���ڷ� ä���ش�.
select lpad('abcd', 20, '#') from dual;
--�����ʿ���
select rpad('abcd', 20, '@') from dual;

--�ѱ� ���� �� ����(1����Ʈ)�� ����Ѵ�.
select length('�����') from dual;
/*
LENGTHB(char) �Լ� : ���ڿ��� ���̸� byte ������ ���ϴ� �Լ� 
*/ 
select length('�����'), lengthb('�����') from dual;

select * from dept2;
select dname, length(dname), lengthb(dname) from dept2;
--(������ ���� ���� ������)3��°���� �� �������� => substr(dname, 3)
select dname, substr(dname, 3) from dept2;
--2��° ���ں��� �� ���� �����Ͷ�
select dname, substr(dname, 2, 3) from dept2;

-- length(dname)+1 : dname�� ���� ���ں���
select rpad(dname, 10, substr('1234567890', length(dname)+1)) "RPAD����" from dept2;


/* 2�� p8 ~ */
select * from student;
--1. Student ���̺��� 1 ������ 201 ���� �л����� ID �� �̸��� �Բ� �ҹ���, �빮�ڷ� ����ϼ���.
select name, lower(id), upper(id) from student where deptno1=201;

--2. Student ���̺��� ID �� 9���� �̻��� �л����� �̸��� ID�� ���ڼ��� ����ϼ���.
select name, length(id) from student where length(id) >= 9;

--3. Student ���̺��� 1 ������ 201 ���� �л����� �̸��� �̸��� ���ڼ�, �̸��� ����Ʈ ���� ����ϼ���
select name, length(name), lengthb(name) from student where deptno1=201;

--4. Professor ���̺��� �������� �̸��� ������ ����ϼ���.
select name, position from professor;

--5. Student ���̺��� jumin �÷��� ����ؼ� 1 ������ 101���� �л�����  �̸��� ��������� ����ϼ���.
select * from student;
select name, substr(jumin,1, 6) from student where deptno1=101;

--6. Student ���̺��� jumin �÷��� ����ؼ� �¾ ���� 8���� ����� �̸��� ��������� ����ϼ���.
select name, substr(jumin, 1, 6) from student where substr(jumin, 3, 2)=08;
--select name, substr(jumin,3,2) from student;

--7. Student ���̺��� tel �÷��� ����Ͽ� �л��� �̸��� ��ȭ��ȣ, ��)�� �� ������ ��ġ�� ����ϼ���.
select name, tel, instr(tel, ')') from student;

--8. Student ���̺��� �����ؼ� �Ʒ� ȭ��� ���� 1 ������(deptno1 �÷�) 101���� �л��� �̸��� ��ȭ��ȣ�� ������ȣ�� ����ϼ���.
--�� ������ȣ�� ���ڸ� ���;� �մϴ�. 
select name, tel, substr(tel,1,instr(tel, ')')) from student where deptno1=101;

--9. Student ���̺��� 1 ������ 101 ���� �а� �л����� id�� �� 10�ڸ��� ����ϵ� ���� �� �ڸ��� ��$�� ��ȣ�� ä�켼��.
select lpad(id, 10, '$') from student where deptno1=101;

/*
�����Լ� ���� 2)
Dept2 ���̺��� ����Ͽ� dname�� �������� ����� 
�������� ������ �ۼ��ϼ���.
������ ����ȭ���� dname �� �� 10 ����Ʈ�� ����ϵ� ���� dname �� ������ ������ �� �ڸ��� �ش� �ڸ��� ���ڰ� ������ �˴ϴ�.
��, ������� �̸��� �� 6 ����Ʈ�̹Ƿ� ���ڰ� 1234 ���� ������ ���Դϴ�.
*/
select * from dept2;
select lengthb(dname) from dept2;
--?????????
select lpad(dname, 6, 1234) "LPAD ����" from dept2; 

select dname,length(dname), lengthb(dname) from dept2;

/* substrb ���? */
select dname,substr(dname, 10), substrb(dname, 10, 10) from dept2;


--11. Student ���̺��� �Ʒ��� ���� id �� 12�ڸ��� ����ϵ�, ������ ���ڸ����� ��*�� �� ä�켼��.
select rpad(id, 12, '*') from student;

--12. Dept2 ���̺��� ����Ͽ� dname �� �������� ����� �������� ������ �ۼ��ϼ���.
--?????????????????
select rpad(dname, 6, 7890) from dept2;

