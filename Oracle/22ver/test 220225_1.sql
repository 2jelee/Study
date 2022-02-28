/*
PL/SQL (Procedural Language) << Oracle ���� ���ν���
���� :
    Declare -���� ����[����]
        begin 
            ����[�ʼ�]
        end;
Declare ?
    ����(����)
as[is]
    being
    
    end;

trigger : � ���� �ϰ� ���� �ٷ� ����Ǵ� ��
*/

Begin
    DBMS_output.put_line('2jelee'); --���
End;
--�ش� ��� ������ X (����� return���� ����) -> �̸� Ȯ���ϱ� ���ؼ��� [����] > DBMS ��� 


declare name varchar2(20) := '2jelee';
    begin
        dbms_output.put_line('�̸��� ' || name); --ȭ�鿡 ���
    END;
    
--------------
declare e_name emp.ename%type;
        e_sal emp.sal%type;
    
BEGIN
    select sal, ename into e_sal, e_name from emp where empno='7788';
    dbms_output.put_line('7788���� �̸��� ' || e_name || ' �޿��� ' || e_sal);
END;  -- || �����ϰڴ�.

--------------

--���̺�κ��� ������ �ʵ��� ���� ������ �����ϱ� ���ؼ� select ������ into ���
DECLARE data emp%rowtype;
begin
    select * into data from emp where empno='7788';
    dbms_output.put_line(data.ename || ', ' || data.job || ', ' || data.mgr || ', ' || data.deptno);
END;

-------------------
declare
    num1 number:=3;
    num2 number:=5;
begin
    if num1>num2 then
        DBMS_OUTPUT.PUT_LINE(num1 || '��/�� Ů�ϴ�');
    else DBMS_OUTPUT.PUT_LINE(num2 || '��/�� Ů�ϴ�');
    end if;
END;


------------------- 
    declare
        v_salary number :=0;
        v_dept_id number :=0;
    BEGIN
        v_dept_id :=(dbms_random.value(10, 120), -1);
        select sal into v_salary from emp where deptno = v_dept_id and rownum=1;
        dbms_output.put_line(v_salary);
        
        if v_salary between 1 and 3000 then DBMS_OUTPUT.PUT_LINE('���� ����');
        ELSIF v_salary between 3001 and 6000 then DBMS_OUTPUT.PUT_LINE('�ü��� ������');
        ELSIF v_salary between 6001 and 9000 then DBMS_OUTPUT.PUT_LINE('���� ����');
        else
            DBMS_OUTPUT.PUT_LINE('���� ����');
        end if;
    end;

----
create procedure p_test2
is
begin
    dbms_output.put_line('�ݿ���');
end;
---------
execut p_test2; --���ν��� ����
exec p_test2;

--------
create or replace procedure p_test2(
    name in varchar2
)
is
begin
    dbms_output.put_line(name || '�� �ȳ��ϼ���');
end;


/**************************/


--  PL/SQL (Procedural Language) -----------------------
/*����>
Declare ? ����(����)
    Begin
         ����(�ʼ�)
    End;
*/

Begin
    DBMS_output.put_line('�̵���'); --���
End;
---------------------------------------------
DECLARE NAME VARCHAR2(20):='�迬��';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('�̸��� ' || name); --ȭ�鿡���
    END;
-----------------------------------------------------
declare e_name emp.ename%type;
        e_sal emp.sal%type;
BEGIN
    select sal, ename into e_sal, e_name from emp where empno='7788';
    DBMS_OUTPUT.PUT_LINE('7788���� �̸��� ' || e_name ||' �޿��� ' || e_sal);
end;
-----------------------------------------------------
declare 
    num1 number :=3;
    num2 number :=5;
BEGIN
   if num1 >= num2 then 
         DBMS_OUTPUT.PUT_LINE(num1 || '�� Ů�ϴ�');
    else   DBMS_OUTPUT.PUT_LINE(num2 || '�� Ů�ϴ�');
   end if;
end;

-----------------------------------------------------
create PROCEDURE p_sal
is
        v_salary number :=0;
        v_dept_id number :=0;
    BEGIN
       v_dept_id := round(dbms_random.value(10, 120), -1);
       
       select sal into v_salary from emp where deptno = v_dept_id and rownum = 1;
       DBMS_OUTPUT.PUT_LINE(v_salary);
       
       if v_salary between 1 and 3000 then 
                        DBMS_OUTPUT.PUT_LINE('��������');
       ELSIF v_salary BETWEEN 3001 and 6000 then 
                        DBMS_OUTPUT.PUT_LINE('�ü��� ������');
       ELSIF v_salary BETWEEN 6001 and 9000 then 
                        DBMS_OUTPUT.PUT_LINE('���� ����');
       else 
            DBMS_OUTPUT.PUT_LINE('���� ����');
        end if;
    end;
-------------------------------------------------
create PROCEDURE p_test   -- ���ν��� ���� 
is
begin
    DBMS_OUTPUT.PUT_LINE('�ָ� �ߺ����ڿ�~~~');
end;
-----------------------------------------------------
EXECUT p_test;  -- ���ν��� ����
EXEC p_test;

------------------------------------
create or replace PROCEDURE p_test(      -- ���ν��� ���� 
            name in VARCHAR2
) 
is
begin
    DBMS_OUTPUT.PUT_LINE(name || '�� ���� ���� �ָ� ��������~~~');
end;
---------------------------------------------
EXECUT p_test('������');  -- ���ν��� ����
EXEC p_test; 