/******************************
���ϸ� : Or10SubQuery.sql
��������
���� : ������ �ȿ� �Ǵٸ� �������� ���� ������ select��
******************************/

/*
������ ��������
    ����] 
        select * from ���̺�� where �÷�=(
            select �÷� from ���̺�� where ����
        );
        �ذ�ȣ ���� ���������� �ݵ�� �ϳ��� ����� �����ؾ� �Ѵ�.
*/
/*
�ó����� ] ������̺��� ��ü����� ��� �޿����� ���� �޿��� �޴� �������
                �����Ͽ� ����Ͻÿ�.
                ����׸� : �����ȣ, �̸�, �̸���, ����ó, �޿�
*/
select
    employee_id, first_name, last_name, email, salary
from employees
where salary < round(avg(salary)); /*
        �ش� �������� ���ƻ� �´µ��ϳ�,
        �׷��Լ��� �����࿡ ������ �߸��� �������̴�.       >> error
*/ 
--1�ܰ� ��ձ޿��� �������� ���Ѵ�.
select
    round(avg(salary))
from employees;

--2�ܰ� : 1�ܰ� ������(6462)���� ���� �޿��� �޴� ������ �����Ѵ�.
select * 
    from employees
where salary<6462;          --3�ܰ迡�� 6462�� ()�� �ٲ� �� 1�ܰ踦 ������

--3�ܰ� : 2���� ������ �ϳ��� �������������� ��ģ�� (1+2�ܰ�)
select * from employees
    where salary<(select round(avg(salary)) from employees);
    

/*
�ó�����] ��ü ����� �޿��� ���� ���� ����� �̸��� �޿��� ����ϴ� ������������ �ۼ��Ͻÿ�.
    ����׸� : �̸�1, �̸�2, �̸���, �޿�
*/
--1
select
    min(salary)
from employees;
--2
select
    first_name, last_name, email, salary from employees
where salary=2100;
--3
select
    first_name, last_name, email, salary from employees
where salary=(select min(salary) from employees);


/*
�ó�����] ��ձ޿����� ���� �޿��� �޴� ������� ����� ��ȸ�� �� �ִ�
            ������������ �ۼ��Ͻÿ�.
            ��³��� : �̸�1, �̸�2, ��������, �޿�
            �� ���������� jobs ���̺� �����Ƿ� join�ؾ� �Ѵ�.
*/
--1�ܰ� : ��ձ޿� ���ϱ�
select 
    trunc(avg(salary),2)
from employees;

--2�ܰ� : 6461.83���� �޿��� ���� ��� ����
select * from employees where salary>6461.83;

--3�ܰ� : jobs ���̺�� ������ �Ǵ�.
select
    first_name, last_name, job_title
from employees inner join jobs using (job_id)
where salary>6461.83;

--4�ܰ� : ���������� ����
select
    first_name, last_name, job_title
from employees inner join jobs using (job_id)
where salary>(select trunc(avg(salary),2) from employees);


/*
������ ��������
    ����]
        select * from ���̺�� where �÷� in(
            select �÷� from ���̺�� where ����
        );
        �ذ�ȣ ���� ���������� 2�� �̻��� ����� �����ؾ� �Ѵ�.
*/
/*
�ó�����] ���������� ���� ���� �޿��� �޴� ����� ����� ��ȸ�Ͻÿ�.
    ��¸�� : ������̵�, �̸�, ���������̵�, �޿�
*/
--1 : ������̺��� �ܼ� ������ ���� ������ ��׿����� Ȯ��
select
    job_id, salary
from employees
order by job_id, salary desc;

--2 : 1������ Ȯ���� ���ڵ带 group by���� �׷�ȭ�Ͽ� �� ������ �ִ�޿��� Ȯ���Ѵ�.
select
    job_id, max(salary)
from employees
group by job_id;

--3 : 2���� ����� ������� �ܼ� ������ �ۼ�
select
    employee_id, first_name, job_id, salary
from employees
where
    (job_id= 'IT PROG' and salary=9000) or
    (job_id= 'AC_MGR' and salary=12008) or
    (job_id= 'AC_ACCOUNT' and salary=8300) or
    (job_id= 'ST_MAN' and salary=8200) or
    (job_id= 'PU_MAN' and salary=11000); /*
            2������ �έ��� 19���� ����� �ܼ� ������ �ۼ��ϸ�
            ���� ���� or�����ڸ� ���� ������ �� �ִ�.
            ������ ����� ���ٸ� �ۼ��� �Ұ����� ���̴�.
            */
--4 : 3���� �������� ���������� �����Ѵ�. �������̹Ƿ� in�� ���.
select
    employee_id, first_name, job_id, salary
from employees
where
    (job_id, salary) in (
            select
                  job_id, max(salary)
            from employees
            group by job_id
    );
    
    
/*
������ ������2 : any
    ���������� �������� ���������� �˻������ �ϳ� �̻� ��ġ�ϸ� ���� �Ǵ� ������.
    ��, ���� �ϳ��� �����Ѵٸ� �ش� ���ڵ带 �����´�.
*/
/*
�ó�����] ��ü ����߿��� �μ���ȣ�� 20�� ������� �޿����� ���� �޿��� �޴� ��������
                �����ϴ� ������������ �ۼ��Ͻÿ�.
*/
--1�ܰ� : 20�� �μ��� �޿��� �켱 Ȯ��
select  * from employees
where department_id=20;
--2�ܰ� : 1�� ����� �ܼ������� �����ٸ�,
select * from employees
where salary>=13000 or salary>=6000;
--3�ܰ� : 2�� ����� ���������� �ۼ�. �̶� any�� ����Ѵ�.
--select * from employees
 --   where salary>=any(select  * from employees where department_id=20);       --������������ *�� ��ü�� �ǹ��Ͽ� error >> salary�� �ٲ��ش�.
select 
    first_name, last_name, department_id, salary
from employees
    where salary>=any(select  salary from employees where department_id=20); /*
                            ������ ������ any�� ����ϸ� 2���� ���� or �������� ������� �����ϰ� �ȴ�.
                            6000 �Ǵ� 13000 �̻��� ���ڵ常 ����ȴ�.
                            */
                            
                            
/*
�����࿬����3 : all
    : ���������� �������� ���������� �˻������ ��� ��ġ�ؾ� ���� �ȴ�.
*/
select 
    first_name, last_name, department_id, salary
from employees
    where salary>=all(select  salary from employees where department_id=20); /*
                6000���� ũ�� 13000���ٵ� Ŀ���ϹǷ� ��������� 13000�̻��� ���ڵ常 �����ϰ� �ȴ�.
                */
                
                
/*
Top ���� : ��ȸ�� ������� ������ ���� ���ڵ带 ������ �� ����Ѵ�.
                �ַ� �Խ����� ����¡�� ����.
                
                rownum : ���̺��� ���ڵ带 ��ȸ�� ������� ������ �ο��Ǵ� ������ �÷��� ����.
                                �ش� �÷��� ��� ���̺� ����.
*/
select * from employees;
select employee_id, first_name, rownum from employees;
select employee_id, first_name, rownum from employees order by first_name;
select employee_id, first_name, rownum from (
    select * from employees order by first_name
);


/*
������̺��� ������ ������ ���� �������� ���� ����������
*/
select * from
    (select Tb.*, rownum rNum from (                        --rownum�ο� �� 2��
        select * from employees order by employee_id desc   --rownum�ο� �� 1��(rownum�� ����Ŭ���� �ڵ����� �ο��ϹǷ� �� ����� ���� '����'�Ѵ�.)
    )  Tb) --(select Tb.~ Tb)���� ���̺� �� �ڸ�
--where rNum between 1 and 10;        -- rNum>=1 and rNum<=10   --�Խ��� �ۼ��� 1page
where rNum between 11 and 20;                                   --�Խ��� �ۼ��� 2page

/*
    between�� ������ ���� ���� �������ָ� �ش� �������� ���ڵ常 �������� �ȴ�.
    ���� ������ ���� JSP���� �������� ������ �����ϰ� ����ؼ� �����ϰ� �ȴ�.

�� ���� ��� ��ü�� �����ͼ�..
    (�� ���� ����� rownum�� ���������� �ο���  (
        �������̺��� ��� ���ڵ带 �������� �����ؼ� ����
    )  Tb)
�ʿ��� �κ��� rownu,���� ������ ���� ����  
*/

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--��������                                               #scott �������� ����
set serveroutput on;

--01.�����ȣ�� 7782�� ����� ��� ������ ���� ����� ǥ��(����̸��� ������)�Ͻÿ�.
--1�ܰ� : �����ȣ�� 7782�� ����� ������
select
    job
from emp
where empno=7782;
--2�ܰ� : 1�ܰ��� �������� ���� ��� ǥ��
select
    ename, job
from emp
where job='MANAGER';
--3�ܰ� : ��ġ��
select
    ename, job
from emp
where job=(select job from emp where empno=7782);


--02.�����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ��(����̸��� ������)�Ͻÿ�.
--1 : �����ȣ�� 7499�� ���
select
    sal
from emp
where empno=7499;

--2 : allen(7499)���� �޿��� ���� ���
select
    ename, job
from emp
where sal>(select sal from emp where empno=7499);


--03.�ּ� �޿��� �޴� ����� �̸�, ��� ���� �� �޿��� ǥ���Ͻÿ�(�׷��Լ� ���).
--1 : �ּ� �޿� Ȯ��  >> 800
select
    ename, job, sal
from emp
order by sal asc;

--2 : 1������ Ȯ���� ���ڵ带 group by���� �׷�ȭ, �ּ� �޿� Ȯ��
select
    job, min(sal)
from emp
group by job;

--3
select
    ename, job, sal
from emp
where
    (job, sal) in (
            select
                job, min(sal)
            from emp
            group by job);

/*������ Ǯ��*/
select min(sal) from emp;
select * from emp where sal=800;
--���������� ����
select empno, ename, job, sal from emp
    where sal=(select min(sal) from emp);

--04.��� �޿��� ���� ���� ����(job)�� ��� �޿��� ǥ���Ͻÿ�. �ڡڡ�
--0. ��ձ޿� Ȯ��
select
    trunc(avg(sal),2)
from emp;

select* from emp;
select * from emp group by job;    --error : group by�� �׷�ȭ�� �����Ϳ��� �׷��Լ��� ���� ��� �̿��� ���� ����� �ָ��ϹǷ�


--2. ���޺� ��ձ޿� Ȯ��
select
    job, trunc(avg(sal),2)
from emp
group by job;

-- : 1���� ���� ��ձ޿��� ���� ����    >> CLERK
select
    trunc(avg(sal),2)
from emp
where job='CLERK';

--4
select
    trunc(avg(sal),2)
from emp
where (job,sal) in (select
                        job, trunc(avg(sal),2)
                    from emp
                    group by job);

/*������ Ǯ��*/
--�������� �׷�ȭ�Ͽ� ������ ��ձ޿� ��ȸ
select job, round(avg(sal)) from emp group by job;
--�����߻� : not a single-group group function
select job, min(round(avg(sal))) from emp group by job;
--select ������ job�� ������ �� ����
select min(round(avg(sal))) from emp group by job;

/*��ձ޿��� ���������� �����ϴ� �÷��� �ƴϰ� where������ ����� �� ����
  having���� ����ؾ� �Ѵ�.
  ��, ��ձ޿��� 1017�� ������ ����ϴ� ������� ���������� �ۼ�*/
select job, round(avg(sal))
    from emp group by job
    having round(avg(sal))=(select min(round(avg(sal))) from emp group by job);
    

--05.�� �μ��� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�.
--1. �� �μ��� �ּұ޿� Ȯ��
select
    ename, sal, deptno
from emp
order by sal asc;

--2.
select
    job, min(sal)
from emp
group by job;

--3.
select
    ename, sal, deptno
from emp
where (job, sal) in (
         select
              job, min(sal)
         from emp
         group by job
      );


--06.��� ������ �м���(ANALYST)�� ������� �޿��� �����鼭 ������ �м���(ANALYST)�� �ƴ� ������� ǥ��(�����ȣ, �̸�, ������, �޿�)�Ͻÿ�.
--1. ��� ������ �м���(ANALYST)�� ���
select
    empno, ename, job, sal
from emp
where job='ANALYST';

--2.
select
    empno, ename, job, sal
from emp
where sal<3000 and job!='ANALYST';


--07.���������� ���� ����� �̸��� ǥ���Ͻÿ�.
select
    ename
from emp
where MGR is null;

--08.���������� �ִ� ����� �̸��� ǥ���Ͻÿ�.
select
    ename
from emp
where MGR is not null;

--09.BLAKE�� ������ �μ��� ���� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�. (��, BLAKE�� ����).
--1 : BLAKE�� �μ���ȣ
select
    deptno
from emp
where ename='BLAKE';

--2 : 
select
    ename, hiredate
from emp
where deptno in (select deptno from emp where ename='BLAKE');

--10.�޿��� ��� �޿����� ���� ������� �����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���ؼ�
   --������������ �����Ͻÿ�.
--1. ��ձ޿� Ȯ��
select
    avg(sal)
from emp;

--2. ��ձ޿����� �޿��� ���� ������� �����ȣ�� �̸� ǥ��
select
    empno, ename
from emp
where sal>(select avg(sal) from emp);

--3. �������� ����
select
    empno, ename
from emp
where sal>(select avg(sal) from emp)
order by sal asc;

--11.�̸��� K�� ���Ե� ����� ���� �μ����� ���ϴ� ����� �����ȣ�� �̸��� ǥ���ϴ� ���Ǹ�
--   �ۼ��Ͻÿ�
--1.�̸��� K�� ���Ե� ����� �μ�(��ȣ)
select
    ename, deptno
from emp
where ename like ('%K%');               --������ ������ ����ؾߵȴ�.

--2.���� �μ����� ���ϴ� ����� �����ȣ�� �̸�        --error ��
select
    empno, ename
from emp
where deptno in (select
    ename, deptno
from emp
where ename like ('%K%'));

/*������ Ǯ��*/
select * from emp where deptno=10 or deptno =30;        --or�� ���ǰɱ�
select * from emp where deptno in (10,30);              --in���� ���ǰɱ�

/*
    or������ in���� ������ �� �����Ƿ�
    ������������ ������ ���꿡 in�� ���
    2�� �̻��� ����� or�� �����Ͽ� ����ϴ� ȿ���� ����
*/
select empno, ename, deptno
from emp
where deptno in (select deptno from emp where ename like '%K%');


--12.�μ� ��ġ�� DALLAS�� ����� �̸��� �μ���ȣ �� ��� ������ ǥ���Ͻÿ�.
select
    ename, e.deptno, job
from emp e, dept d
where e.deptno = d.deptno
      and LOC='DALLAS';

--13.KING���� �����ϴ� ����� �̸��� �޿��� ǥ���Ͻÿ�.
--1. KING�� empno
select
    empno
from emp
where ename='KING';

--2.
select
    ename, sal
from emp
where MGR=(select empno from emp where ename='KING');


--14.RESEARCH �μ��� ����� ���� �μ���ȣ ����̸� �� ��� ������ ǥ���Ͻÿ�.
--1. RESEARCH �μ��� �μ���ȣ
select
    deptno
from dept
where dname='RESEARCH';

select
    e.deptno, ename, job
from emp e, dept d
where
    e.deptno = d.deptno
    and dname='RESEARCH';


--15.��� �޿����� ���� �޿��� �ް� �̸��� k�� ���Ե� �����
--   ���� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �޿��� ǥ���Ͻÿ�.    �ڡڡ�
--1. ��ձ޿� (���Ƿ� �Ҽ��� 2�ڸ��� ǥ������)
select
    trunc(avg(sal),2)
from emp;

--2. �̸��� K�� ���Ե� ��� �� �μ�(��ȣ)
select
    ename, deptno
from emp
where ename like '%K%';

--3. 
select
    empno, ename, sal
from emp
where (ename like '%K%')            --having�� �ƴ�... sal�� ���������� �����ϴ� �÷�
      and sal>(trunc(avg(sal),2));

/*������ Ǯ��*/
select
    empno, ename, sal
from emp
where sal>2077
      and deptno in (10, 30);
--���������� �ۼ�
select
    empno, ename, sal
from emp
where sal>(select round(avg(sal)) from emp)
      and deptno in (select deptno from emp where ename like '%K%');


--16.��� �޿��� ���� ���� ������ ã���ÿ�.
--1. ������ ��ձ޿�
select
    job, trunc(avg(sal),2)
from emp
group by job;

--2.


--17.��� ������ MANAGER�� ����� �Ҽӵ� �μ��� ������ �μ��� ����� ǥ���Ͻÿ�.
--1. �������� MANAGER�� ���
select
    ename, deptno
from emp
where job='MANAGER';

--2.�μ��� Ȯ��
select
    ename, d.dname
from emp e, dept d
where
    e.deptno=d.deptno;

--3. ������(job)�� MANAGER�� ������� �μ��� Ȯ��    >> ���Ϻμ� ����
select
    ename, job, d.dname
from emp e, dept d
where
    e.deptno=d.deptno
    and job='MANAGER';
