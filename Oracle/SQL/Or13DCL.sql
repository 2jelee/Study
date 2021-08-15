/*****************
���ϸ� : Or13DCL.sql
����� ����
���� : ���ο� ����� ������ �����ϰ� �ý��� ������ �ο��ϴ� ����� �н�
*****************/

/*
[����ڰ��� ���� �� ���Ѽ���]
�ش� ������ DBA������ �ִ� �ְ������(sys, system)�� ������ �� �����ؾ� �Ѵ�.
(����� ���� ���� �� ���� �׽�Ʈ�� CMD(���������Ʈ)���� �����ϵ��� �Ѵ�.)
*/

/*
1] ����ڰ��� ���� �� ��ȣ����
����]
    create user ���̵� identifided by �н�����;
*/
create user test_user1 identified by 1234;
-- cmd���� sqlplus ������� ���� �� login denied ���� �߻���.

/*
2] ������ ����� ������ ���� Ȥ�� ���� �ο�
    ����]
        grant �ý��۱���1[,�ý��۱���2 ...] | [����1[,����2...]]
            to �����1[,�����2...] | [����1[,����2...]]
            [with grant option];
*/
--���� ���� �ο� : ������ ������ ���̺��� ������ �� ����.
grant create session to test_user1;
--���̺���� ���� �ο� : ���̺� �����̽��� ���� �������� �ʴ´�.
grant create table to test_user1;

/*
���̺� �����̽���?
    ��ũ ������ �Һ��ϴ� ���̺�� ��, �׸��� �� ���� �ٸ� �����ͺ��̽� ��ü���� ����Ǵ� ���.
    ���� ���, ����Ŭ�� ���ʷ� ��ġ�ϸ� hr������ �����͸� �����ϴ� users��� ���̺� �����̽��� �ڵ����� �����ȴ�.
*/
--���̺� �����̽� ��ȸ�ϱ�
select tablespace_name, status, contents from dba_tablespaces;
desc dba_tablespaces;

--���̺� �����̽��� ��� ������ ���� Ȯ���ϱ�
select tablespace_name, sum(bytes), max(bytes) from dba_free_space
    group by tablespace_name;
    
--�տ��� ������ test_user1 ������� ���̺� �����̽��� Ȯ���ϱ�
select username, default_tablespace from dba_users
      where username in upper('test_user1');

--���̺� �����̽� ���� �Ҵ�
alter user test_user1 quota 2m on system;        --quota : �� 
/*  test_user1�� system ���̺����̽���
    ���̺��� ������ �� �ֵ��� 2m(�ް�)�� �뷮�� �Ҵ��Ѵ�. */
    
    
--2��° ����� �߰� : ���̺����̽� user�� ����� �� �ֵ��� ����.
create user test_user2 identified by 1234 default tablespace users;
--���� ���� �߰�
grant create session to test_user2;
--���̺� ���� �õ� 1 => insufficient privileges : ���Ѻ����
--���̺� �������� �߰�
grant create table to test_user2;
--���̺� ���� �õ� 2 = > no privileges on tablespace 'USERS' : ���̺����̽��� ���� ����.
--test_user2�� ����ϴ� ���̺� �����̽��� Ȯ��.
select username, default_tablespace from dba_users
        where username in upper('test_user2');
--users ���̺� �����̽��� ���� �Ҵ�
alter user test_user2 quota 10m on users;
--���̺� �����õ� 3 => ����


/*
������ ������� ����Ʈ ���̺� �����̽��� �����ϰ� ���� ���
    : test_user1�� ����Ʈ ���̺� �����̽��� users�� �����Ѵ�.
*/
alter user test_user1 default tablespace user;

/*
3] ��ȣ����
    : alter table ����ھ��̵� identified by ���ο��ȣ;
*/
alter user test_user1 identified by 4321;