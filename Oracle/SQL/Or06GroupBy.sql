/**************************************
���ϸ� : Or06GroupBy.sql
�׷��Լ�(select�� 2��°)
���� : ��ü ���ڵ�(�ο�)������� ����� ���ϱ� ���� �ϳ� �̻��� ���ڵ带
        �׷����� ��� ���� �� ����� ��ȯ�ϴ� �Լ� Ȥ�� ������
**************************************/

/*
distinct   
    - �ߺ��Ǵ� ���ڵ带 ������ �� �ϳ��� ���ڵ常 �����ͼ� ������.
    - ���� ������� �����͸� ����� �� ����.
*/
select distinct job_id from employees;
/*
group by
    - ������ ���� �ִ� ���ڵ带 �ϳ��� �׷����� ��� �����´�.
    - �������� ����� �ϳ��� ���ڵ�������
        �������� ���ڵ尡 ������ ����̹Ƿ� ������� �����͸� ����� �� �ִ�.
    - �ִ�, �ּ�, ���, �ջ� ���� ����
*/
select job_id from employees group by job_id;


/*
�׷��Լ��� �⺻����
    : [] ���ȣ �κ��� ���� ����
    
    select
        �÷�1, �÷�2, ... Ȥ�� *(��ü)
    from 
        ���̺��
    [where
        ���� 1 or ���� 2 and ���� 3......]
    [group by
        ������ �׷�ȭ�� ���� �÷���]
    [having
        �׷쿡�� ã�� ����]                     --where�� ���ǰ��� ���̰� �ִ�!... ���Ŀ�
    [order by
        ���ڵ� ������ ���� �÷��� ���Ĺ��(asc/desc)]
        
    �������� ���� ����
        from -> where -> group by -> having -> select -> order by
*/

/*
sum() : �հ踦 ���� �� ����ϴ� �Լ�
    ����]  sum(�÷�)
    - number Ÿ���� �÷������� ��� ����
    - �ʵ���� �ʿ��� ��� AS�� �̿��ؼ� ��Ī �ο� ����
*/
-- ��ü ������ �޿��� �հ踦 ����Ͻÿ�.
select
    sum(salary) "�޿��� �հ�1",
    to_char(sum(salary), '000,000') "�޿����հ�2"
from employees;

--10�� �μ����� �ٹ��ϴ� ������� �޿��հ�� ������ ����Ͻÿ�.
select
    sum(salary) "�޿�1",
    to_char(sum(salary), '999,999') "�޿�2",    
    to_char(sum(salary), '000,999') "�޿�3",
    ltrim(to_char(sum(salary), '9,999,999')) "�޿�4"
from employees
where department_id=10;

--sum()�� ���� �׷��Լ��� numberŸ���� �÷������� ��� ����.
select sum(first_name) from employees;      --error


/*
 count() : ���ڵ��� ������ ī��Ʈ�� �� ����ϴ� �Լ�
*/
--��� ���̺� ����� ��ü ��� ���� ���?
select count(*) from employees;
select count(employee_id) from employees;
/*
    count()�Լ��� ����� ���� �� 2���� ��� ��� �����ϳ�,
    *�� ����� ���� ����!
    �÷��� Ư���� Ÿ�� �ʾ� �˻��ӵ��� ����
*/

/*
    count()�Լ���
                    ���� 1 : count(all �÷���)
                            => default�� �÷� ��ü�� ���ڵ带 �������� ī��Ʈ�Ѵ�.
                    ���� 2 : count(distinct �÷���)
                            => �ߺ��� ������ ���¿��� ī��Ʈ�Ѵ�.
*/
select
    count(all job_id) "������ ��ü ����",
    count(distinct job_id) "���� ������ ����"
from employees;


/*
avg() : ��հ��� ���� �� ����ϴ� �Լ�
*/
--��ü ����� ��ձ޿��� �������� ����ϴ� �������� �ۼ��Ͻÿ�.
select
    count(*) "�����",
    sum(salary) "�޿����հ�",
    sum(salary)/count(*) "��ձ޿�1",
    avg(salary) "��ձ޿�2",
    to_char(avg(salary), '$999,000') "��ձ޿�3"
from employees
where 1=1;
-- ����� �ǹ�) 1=1 ���� >> ��ü �� �������ڴ�. | 1=0 �ٸ��� >> �ϳ��� �������� �ʰڴ�.


--�������� ��� �޿��� ���ΰ�?
--1. �μ����̺��� �������� �μ���ȣ�� Ȯ���Ѵ�.
select * from departments where department_name='Sales';
select * from departments where lower(department_name)='sales';
select * from departments where upper(department_name)='SALES';
/*
    ���� �˻� �� ��ҹ��� Ȥ�� ������ ���Ե� ���,
    ��� ���ڵ忡 ���� ���ڿ��� Ȯ���ϴ� ���� �Ұ����ϹǷ� �ϰ����� ��Ģ�� �����ϱ� ����
    upper()�� ���� ��ȯ�Լ��� ����Ͽ� �˻��ϸ� ����.
*/

--2. ������ ã�� 80�� �μ����� �ٹ��ϴ� ������ ��� �޿��� ���Ѵ�.
select
    avg(salary) "������ ��� �޿�1",
    to_char(avg(salary), '$999,000.00') "������ ��� �޿�2"
from employees where department_id=80;      /*
    to_char()�� ���� �� �ڸ����� �ĸ��� ��ȭ ǥ��.
    �׸��� �Ҽ��� ���� 2�ڸ����� �������� ǥ��.
*/


/*
min() / max() : �ּ� / �ִ밪�� ã�� �� ����ϴ� �Լ�
*/
-- ����� ���� ���� �޿��� �޴� ����� ����?
select min(salary) from employees;      --1. ������̺��� ���� ���� �޿��� ��?
select first_name, last_name from employees
    where salary=2100;                            --2. �տ��� ���� 2100�� �޴� ����� select �ؼ� ��� ���
/*
    ��� �� ���� ���� �޿��� min()���� ���� �� ������,
    ���� ���� �޿��� �޴� ����� ���� ���� 2���� ������ ����ϰų�
    ���������� ����Ͽ� ���� �� �ִ�.
*/
select first_name, last_name from employees
    where salary=(select min(salary) from employees);
    
/*
group by�� : �������� ���ڵ带 �ϳ��� �׷����� �׷�ȭ�Ͽ� ������ ����� ��ȯ�ϴ� ������
                    �� distinct�� �ܼ��� �ߺ����� ������.
*/
--������̺��� ���ڵ带 �μ����� �׷�ȭ�Ͽ� Ȯ���ϱ�
select department_id from employees
group by department_id;

--�� �μ��� �޿��� �հ�� ��?
select 
    department_id,
    sum(salary) "�μ��� �޿� ����1",
    to_char(sum(salary), '999,000') "�μ��� �޿� ����2"
from employees
group by department_id;

/*
�ó�����]
        ����] �μ��� ������� ��ձ޿��� ��?
        ��°��] �μ���ȣ, �޿�����, �������, ��ձ޿�, �μ���ȣ ������� �������� �����Ͻÿ�.
*/
 select
    department_id "�μ���ȣ",
    sum(salary) "�޿�����",
    count(*) "�������",
   to_char(avg(salary), '$999,000.00') "��ձ޿�"
from employees
group by department_id
order by department_id asc;


 select
    department_id "�μ���ȣ",
    first_name                                  /*��ǻ��) ������ �����ؾ����� �ָ�.. error �߻�*/
from employees
group by department_id;     --error�߻�
/*
������ ����ߴ� group by���� first_name�� �߰������� ������ �߻���.
select���� group by���� ����� �÷��� from������ ����� �� �����Ƿ�
�׷�ȭ�� ���¿��� Ư�� ���ڵ� �ϳ��� �����ϴ� ���� �ָ�. >>error
*/


/*
�μ��� �޿��� �հ�� distinct�� ����ؼ� SQL���� �ۼ��� �� ����.
*/
select distinct department_id, sum(salary) from employees;      --error

/*
�ó�����] �μ� ���̵� 50�� ������� ���� ����,  ��ձ޿�, �޿������� ������
ǥ���ϴ� �������� �ۼ�.
*/
select
count (*) "������",
trim(to_char(avg(salary), '999,000.00')) "��ձ޿�",
trim(to_char(sum(salary), '999,000')) "�޿�����"
from employees
where department_id = 50
group by department_id;


/*
having�� : ���������� �����ϴ� �÷��� �ƴ� �׷��Լ��� ����
    �������� ������ �÷��� ������ �߰��� �� ����Ѵ�.
    �ش� ������ where���� �߰��ϸ� ������ �߻��Ѵ�.
*/
/*
�ó�����] ������̺��� �� �μ����� �ٹ��ϰ� �ִ� ������ ��������
������� ��ձ޿��� �������� ����ϴ� �������� �ۼ��Ͻÿ�.
��, ����� ������ 10���� �ʰ��ϴ� ���ڵ常 �����Ͻÿ�.
*/
select
    department_id "�μ���ȣ", job_id "������ID", count (*) "�����",
    avg(salary)
from employees
group by department_id, job_id
having count(*)>10
order by department_id asc;

/*
count(*)�� ���� �׷�� ���õ� ������ where���� ����� �� ����.
*/
select
    department_id "�μ���ȣ", job_id "������ID", count (*) "�����",
    avg(salary)
from employees
where count(*)>10
group by department_id, job_id
order by department_id asc;





/*****************************
��������
*****************************/
--1
select
    min(salary) "MinPay",
    max(salary) "MaxPay",
    round(avg(salary),0) "AvgPay"
from employees;

--------------------------------------
--2
select job_id,
    trim(to_char(max(salary), '990,000')) "MaxPay",
    trim(to_char(min(salary), '990,000')) "MinPay",
    trim(to_char(sum(salary), '990,000')) "SumPay",
    trim(to_char(avg(salary), '990,000')) "AvgPay"
from employees
group by job_id
order by  to_char(sum(salary), '999,000') asc;

--------------------------------------
--3
select
    job_id,
    count (*) "�����հ�"
from employees
group by job_id
--order by count(*) asc;        --���Ĺ��1
order by "�����հ�" asc;        --���Ĺ��2
/*
���������� �������� �ʴ� �÷��� ���,
order by���� ����� ���� ������ �״�� ���ų� ��Ī�� ����ϸ� ��
*/

-------------------------------------
--4
select job_id,
    count(*) "�հ��ο���"
from employees
    where salary>=10000     --�޿��� ���������� �����ϴ� �÷��̹Ƿ� where���� ������ �Ǵ�.
group by job_id;

------------------------------------
--5.
select
    max(salary)-min(salary) "�ְ��ּұ޿���"
from employees;
------------------------------------
--6 ��
select job_id,
    min(salary) "���޺��ּұ޿�" 
from employees
    where manager_id is not null
group by job_id
having min(salary)>3000
order by min(salary) desc;
/*
    �����ڸ� �� �� ����  => ���������� �����ϴ� �÷��̹Ƿ� where��
�������޿��� 3000�̸��� => ���������� �������� �ʴ� �׷��Լ��� ����
                                        �������� �߰��� �÷��̹Ƿ� having�� ���
*/
------------------------------------
--7
select
    department_id,
    count(*),
    round(avg(salary),2) "��ձ޿�"
from employees
group by department_id
order by department_id asc;
------------------------------------
--8 �ڡڡ�
/*
8. �� �μ��� ���� �μ���ȣ, �μ��̸�, ������, �����,
�μ� ���� ��� ����� ��ձ޿��� ����Ͻÿ�.
��ձ޿��� ������ �ݿø��ϰ� ���ڸ����� �ĸ��� ����Ͻÿ�.
decode�Լ��� ����Ͽ� �� �μ���ȣ�� �´� �μ���� �������� ������ �Ͻÿ�. (���� �߰�)
*/
select 
    department_id,
    decode(department_id,
            10 , 'Administration',
            20,	'Marketing',
            30,	'Purchasing',
            40,	'Human Resources',
            50,	'Shipping',
            60,	'IT',
            70, 'Public Relations',
            80, 'Sales',
            90, 'Executive',
            100, 'Finance',
            '�׳ɺμ�') AS �μ��̸�,
   decode(department_id,
            10, 'Seattle',
            20, 'Toronto',
            30, 'Seattle',
            40, 'London',
            50,
    count(department_id) "�����",
    to_char(avg(salary),'999,000') "��ձ޿�"
from employees
group by department_id
order by department_id asc;