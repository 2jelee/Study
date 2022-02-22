--�ش� ������ ������ �ִ� ���̺� ����Ʈ ����
select * from tab;

/*
create user user01
  identified by xxxxxxAt22cc
  default tablespace data
  temporary tablespace temp
  quota 10G on data;
*/

/* create user ������ identified by ��й�ȣ;    ������ ""�� ���̵縻�� ��� X */
/*
�� ���� �����
    create user ������ identified by ��й�ȣ;
�� ���� ������ lock Ǯ��
    alter user ������ account unlock; 
�� �⺻ ���Ѽ���
    grant connect, resource to ������;
�� ���� �ֱ�(Ư�� ���� �ο�)
    grant create session, create table, create view,
    create sequence, create procedure
    to ������;
*/
--��������
create user jel
  identified by xxxxxxAt22cc
  default tablespace data   --data����
  temporary tablespace temp --temp����
  quota 10G on data;
  
--����, ���� ���� �ο�
grant connect, resource to jel;

--drop user jel;

--lock ����
alter user user01 account unlock; 

--���������� lock ���� ���ÿ�
create user user01 identified by xxxxxxAt22cc account unlock;