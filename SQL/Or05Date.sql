/*************************
���ϸ� : Or05Date.sql
��¥�Լ�
���� : ��, ��, ��, ��, ��, ���� �������� ��¥������ �����ϰų�
        ��¥�� ����� �� Ȱ���ϴ� �Լ���
*************************/

/*
months_between()
    : ���� ��¥�� ���س�¥ ������ ���� ���� ��ȯ
    ���� ] months_between(���糯¥, ���س�¥[���ų�¥])
*/
--2017�� 1�� 1�Ϻ��� ���ݱ��� ���� �������� ��?
select 
    months_between(sysdate, '2017-01-01') "���1",
    months_between(sysdate, to_date('2017��1��1��', 'yyyy"��"mm"��"dd"��"')) "���2",
    round(months_between(sysdate, '2017-01-01')) "���3"
from dual;
--���� ��¥ ������ �ƴ϶�� to_date()�� ��¥�������� �������ش�.

/*
�ó�����1] employees ���̺� �Էµ� �������� �ټӰ������� ����Ͽ� ����Ͻÿ�.
                �ټӰ������� �������� �������� �����Ͻÿ�.
*/
select
    first_name, last_name, hire_date,
    MONTHS_BETWEEN(SYSDATE, hire_date) "�ټӰ�����1",
    trunc(MONTHS_BETWEEN(SYSDATE, hire_date), 2) "�ټӰ�����2"
from employees
order by "�ټӰ�����1" asc;

/*
Ȱ�� �ó�����2] 
����] �� ������ ���糯¥ ������ �ƴ�, '2017��12��31��'�� �������� �����Ͻÿ�.
*/
select
    first_name, last_name, hire_date,
    trunc(MONTHS_BETWEEN(TO_DATE('2017��12��31��','yyyy"��"mm"��"dd"��"'), hire_date),2) "�ټӰ�����3",
    trunc(MONTHS_BETWEEN(('2017-12-31'), hire_date), 2) "�ټӰ�����4"
from employees
order by "�ټӰ�����3" asc;
/*
    months_between() �Լ��� ���ڷ� ��¥�� �־��� ��
    ����Ŭ �⺻ ������ ��-��-���� ��쿡�� to_date()�� ��ȯ���� �״�� ��� O.
    ��, �⺻������ �ƴ� ��쿡�� ��¥�������� ��ȯ �� ����ϸ� �ȴ�.
*/


/*
add_months() : ��¥�� �������� ���� ����� ��ȯ�Ѵ�.
    ����] add_months(���糯¥, ���� ������)
*/
--���縦 �������� 7���� ������ ��¥�� ���Ͻÿ�.
select
    to_char(sysdate, 'yyyy-mm-dd') "���糯¥",
    to_char(add_months(sysdate, 7), 'yyyy-mm-dd') "7���� ���� ��¥"
from dual;


/*
next_day() : ���� ��¥�� �������� ���ڷ� �־��� ���Ͽ� �ش��ϴ� �̷��� ��¥�� ��ȯ�ϴ� �Լ�
    ����] next_day(���糯¥, '������')
        => ������ �������� ��ĥ�ΰ���?
*/
select 
    sysdate "���� ��¥",
    next_day(sysdate, '�ݿ���') "���� �ݿ���",
    next_day(sysdate, '������') "���� ������",
    next_day(sysdate, '������') "���� ������"
from dual;      --������ ������ ��¥�� ��ȸ�� �� ����.!!


/*
last_day() : �ش� ���� ������ ��¥�� ��ȯ
    ����] last_day(��¥)
*/
select last_day('20/02/01') from dual;
select last_day('21/02/01') from dual;
select last_day(sysdate) from dual;
--2020���� �����̹Ƿ� 2���� 29�ϱ��� ����

select LAST_DAY(hire_date), hire_date from employees
    where employee_id=106;

select
    sysdate "���糯¥",
    SYSDATE + 1 "����",
    SYSDATE - 1 "����",
    SYSDATE - 30 "�Ѵ� ��"
from dual;
