/*
PL/SQL (Procedural Language)

[����]
create [or replace] procedure ���ν����� (
    �����̸� in ������Ÿ��, �����̸� in ������Ÿ��, ...
)
is(�Ǵ� as)
    �����̸� ������Ÿ��;     --���ν��� ������ ����� ����
Begin
    ����[�ʼ�]
End;

------------------------------
[���� ����]
execute ���ν�����;
exec ���ν�����;

*/
--v�ǹ� : virtual
Declare 
    --vno number(4);
    vno emp2.empno%type;
    vname varchar2(20);
Begin
    select empno, name into vno, vame
        from emp2
        where empno = &empno; -- &empno�� ���ؼ� ���� �Է¹ޱ� => &
        dbms_output.put_line('�Էµ� ��� : ' || vno || ' <---> ' || vname);
END;
/

select * from emp2;

-------------------------------------

--���ν��� ����
create or replace PROCEDURE p_test (
    name in varchar2,
    su in number
)
is
begin
    dbms_output.put_line(name || '���� ���� :' || su );
End;
/

exec p_test('2jele', 95);

------------------------------------

select * from userlist;
drop table userlist; 

create table userlist(
    id varchar2(10),
    name varchar2(20),
    age number,
    addr varchar2(50)
);


--���ν��� ����
--Type -> ��ҹ��� ���� X
--�ʱⰪ ���� �� := ���
create or replace PROCEDURE p_userlist (
    --name in varchar2,
    v_id in userlist.id%Type := '2jelee',
    v_name in userlist.name%TYPE default 'eun',
    v_age in userlist.age%type := 10,         -- ������ 10���� �ϰڴ�.
    v_addr in userlist.addr%type := null
)
is
begin
    insert into userlist values (v_id, v_name, v_age, v_addr);
    dbms_output.put_line('insert�� ������ :' || v_id || ' ' || v_name || ' ' || v_age || ' ' || v_addr );
End;
/

--��ü�ʵ忡 �߰�
exec p_userlist('2jelee', 'eun', 26, '���');
-- default value�� insert��
exec p_userlist;                            
-- => ���, ���ϴ� �ʵ忡�� �� �߰�. ��, �ʵ带 �������� ���� ��� default�� ����.
exec p_userlist(v_id=>'������', v_age=>30); 

select * from userlist;


------------------------------------

Declare
    su number := 90; --�ʱⰪ 90
Begin
    dbms_output.put_line('Program started!');
    if(su >=90) then
        dbms_output.put_line('A');
    elsif(su>=80) then
        dbms_output.put_line(su||' B');
    end if;
    dbms_output.put_line('Program END');
End;
/

------------------------------------

--�ʱⰪ �ֱ� :=
Declare
    su number := 90;
    grade varchar2(2);
Begin 
    if(su >=90) then grade :='A';
    elsif(su>=80) then grade :='B';
    elsif(su>=70) then grade :='C';
    elsif(su>=60) then grade :='D';
    else grade:='F';
    end if; 
    DBMS_OUTPUT.PUT_LINE('����� : ' || su || '���� ' || grade || '�����Դϴ�');
End;
/

------------------------------------

/*
[����]
for �����̸� in ����..�� loop
    �ݺ�����;
end loop;
/
*/

begin
    for i in 1..100 loop
        if mod(i, 2) = 0 then DBMS_OUTPUT.PUT_LINE(i || ' => even(¦��)');   --oracle�� �������� ==���� ǥ������ �ʰ� = �ϳ��� ǥ��
        else DBMS_OUTPUT.PUT_LINE(i || ' => odd(Ȧ��)');
        end if;
    end loop;
end;
/

--------------------------

begin
    for su_list in ( 
        select 1 as num from dual
        union all
        select 2 as num from dual
        union all
        select 3 as num from dual
        union all
        select 4 as num from dual
    ) 
    loop
        if mod(su_list.num, 2) = 0 then
            DBMS_OUTPUT.PUT_LINE(su_list.num || ' => even(¦��)');
        else DBMS_OUTPUT.PUT_LINE(su_list.num || ' => odd(Ȧ��)');
        end if;
    end loop;
end;
/

-----
/*
[����]
while��
    WHILE ���ǽ� LOOP
    ���๮��;
    ������;
END LOOP;
*/

Declare
    su number := 0; --�ʱ�ȭ
begin 
    while su < 50 loop
        su := su + 1; --������
        DBMS_OUTPUT.PUT_LINE('���� ���� ' || su);
    end loop;
end;
/

----
--��������
/*
ex) 1~10 ���� ���

ex) 1~10������ ¦���� ���

ex) 2���� ������ ���

ex) ����� �Է�(�ܼ�)�� �޾� ������ ���
[��Ʈ] 
DECLARE vdan NUMBER(1) := &dan; -- &�� ������Է°� ���� �� ����ϴ� Ű����

ex) �������� 2�� �ݺ���

ex) 1~10���� �� �հ踦 ���ϱ�(loop)
*/

--1~10 ���� ���  
Declare
    su number := 0; 
begin 
    while su < 10 loop
        su := su + 1; 
        DBMS_OUTPUT.PUT_LINE(su);
    end loop;
end;
/

--1~10������ ¦���� ���
begin
    for i in 1..100 loop
        if mod(i, 2) = 0 then DBMS_OUTPUT.PUT_LINE(i); 
        end if;
    end loop;
end;
/

--2���� ������ ���
Declare
    dan number := 2;
    su number := 1;
    result number := 0; --����� ����
begin 
    while su <= 9 loop
        result := dan*su; 
        DBMS_OUTPUT.PUT_LINE(desult);
    end loop;
end;
/

--solv
declare
    dan number(1) := &inputDan;
begin
    for i in 1..9 loop
        dbms_output.put_line(dan || '*' || i || '=' || i*dan);
    end loop;
end;
/

--�������� ��� >> in �ڿ� REVERSE ����ϱ�
declare
    dan number(1) := &inputDan;
begin
    for i in REVERSE 1..9 loop --in�ڿ� 
        dbms_output.put_line(dan || '*' || i || '=' || i*dan);
    end loop;
end;
/


/*****************************************************************/

--���ν��� ã��
select * from user_objects
    where lower(object_type)='procedure';      --�ش� ������ ������ �ִ� ���ν��� ����Ʈ ����

-- p_test ���ν����� ������� ����(text) ����     
select text from user_source
    where lower(name) = 'p_test';


-- re?
Declare
    v_emprow emp%rowtype;
begin
    for i in 1..5 loop
        select * into v_emprow 
            from (select * from emp (select * from emp order by sal desc)
                 where rownum <= i ) where rownum <= 5;
    end loop;
end;
/
 
----------------------------

select rownum, ename, sal from emp order by sal desc;

create or replace procedure p_empMaxSal
is
    v_emprow emp%rowtype;
    begin
        for i in 1..5 loop
            select * into v_emprow        
                from ( select * from ( select * from emp order by sal desc)
                         where rownum <= i order by sal, ename ) where rownum =1 order by sal asc;
                DBMS_output.put_line(v_emprow.empno || ' ' || v_emprow.ename|| ' ' || v_emprow.sal);
            end loop;
        end;
        /

exec p_empmaxsal;

desc emp;
insert into emp(empno, ename, sal) values(8888, '2jelee', 5500);

--�л� ���̺��� Ű�� ���� ū ������ 3�� ����ϴ� ���ν��� �����

create or replace procedure p_stdMaxHeight
is
    v_stdrow student%rowtype;
    begin
        for i in 1..3 loop
            select * into v_stdrow
            from ( select *
                    from ( select * from student order by height desc)
                        where rownum <= i order by height, name) where rownum = 1; 
            dbms_output.put_line(v_stdrow.studno||' '||v_stdrow.name||' ' || v_stdrow.height);
        end loop;
    end;
/

exec p_stdMaxHeight;

select * from student;

/*************************************/
--���ν��� output
/*
���ν����� ������ �� Ư�� ������� out ������ �����Ͽ� ���� �� �ִ�.

<out�� �ִ� ���ν��� �ۼ���>

CREATE PROCEDURE ���ν�����(
    �����̸� IN ������Ÿ��, �����̸� IN ������Ÿ��, ...
    �����̸� out ������Ÿ��, �����̸� out ������Ÿ��, ...
)
IS
[
    �����̸� ������Ÿ��;         --���ν��� ������ ����� ���� ����
    �����̸� ������Ÿ��;
    ....
]
BEGIN
    ��� ����;
END;
/
*/

--out : �������ڴ�.
create or replace procedure p_outTest (
    name out varchar2, age out varchar2
)
is
begin
    name := '�̳���';
    age := 20;
    dbms_output.put_line('out�� �̿��� ���ν��� �Ϸ�');
end;
/

----------------

variable v_name varchar2(20);
variable v_age varchar2(3);

EXEC p_outTest(:v_name, :v_age);
-- :(colone)�� �� �͵��� ���ν����κ��� �޾ƿ´ٴ� �ǹ̴�.

--�����Ű��
print v_name;
print v_age;

print(v_name, v_age);


---------------------------
--in�� out ���ÿ� ����
create or replace procedure p_out(x in out number)
as
begin
    dbms_output.put_line('x = ' || x);
    x := 55;
end;
/

VARIABLE x VARCHAR2(25);
EXEC p_out(:x);
print x;

EXEC p_out(33);

VARIABLE y VARCHAR2(25);
EXEC p_out(:y);
print y;

/*
--teacher

create or replace procedure p_out( x in out number )
as
begin
    dbms_output.put_line( 'x = ' || x );
    x := 55;
end;

VARIABLE x VARCHAR2(25);
exec p_out(:x);
print x;
*/

---------------------------------
/*
Cursor
*/
select * from emp;

create or replace procedure p_emp_job(
    v_job in emp.job%type
)
is
    name emp.ename%type;
    cursor c_name is select empno, ename, sal from emp where job=v_job;     --Ŀ�� ����
begin
    open c_name;                            --2. Ŀ�� ����(OPEN)
    dbms_output.put_line('-------------------');
    
    LOOP
        fetch c_name into name;             -- 3. ����(��������) (FETCH) => Ŀ���κ��� ������ �б�
        EXIT WHEN c_name%notfound;          -- ã�� �����Ͱ� ���̻� ���� �� �ݺ��� Ż�� (EXIT)
        dbms_output.put_line(name || ' ' || empno || ' ' || sal || ' ' || v_job);
    END LOOP;
    
    dbms_output.put_line('Result record count = '||c_name%rowcount); --rowcount : ���ڵ�� �� ��
    close c_name;       -- 4. cursor �ݱ�(CLOSE)
end;
/

exec p_emp_job('SALESMAN');

/*
--teacher

create or replace procedure p_emp_job( v_job in emp.job%type )
is
    name emp.ename%type;
    empno emp.empno%type;
    sal emp.sal%type;
--  cursor c_name is select empno, ename, sal from emp where job=upper(v_job) or job=lower(v_job);   -- 1.Ŀ������
    cursor c_name is select empno, ename, sal from emp where job in(upper(v_job), lower(v_job));   -- 1.Ŀ������
begin
    open c_name;   -- 2.Ŀ������
    dbms_output.put_line('------------------------------');
    loop
        fetch c_name into empno, name, sal;  -- 3.Ŀ���κ��� ������ �б�
        exit when c_name%NOTFOUND; -- ã�� �����Ͱ� ������ �ݺ��� Ż���Ѵ�.
        dbms_output.put_line(name ||' '||empno||' '||sal||' ' ||v_job);
    end loop;
    dbms_output.put_line('result recode count ==> ' || c_name%rowcount);
     
    close c_name;  -- 4.Ŀ���ݱ�
end;
--------------------------------------------------------------
exec p_emp_job('manager');  -- ���ڵ� ��ҹ��� ������
exec p_emp_job(upper('manager'));

select * from emp where job ='manager';
*/

/*********************************************/

EXEC p_emp_job('manager'); --���ڵ� ��ҹ��� ����
exec p_emp_job(upper('manager'));

select * from emp where job = 'manager';

