/*********************************
���ϸ� : Or12Sequence & Index.sql
������ & �ε���
���� : ���̺��� �⺻Ű �ʵ忡 �������� �Ϸù�ȣ�� �ο��ϴ� �������� �˻��ӵ��� ����ų �� �ִ� �ε���
*********************************/

--study �������� �ǽ���.

/*
������ 
    : ���̺��� �÷��� �ߺ����� �ʴ� �������� �Ϸù�ȣ�� �ο��ϴ� ������ ��.
      �׻� ������ �ǰ� ���Ҵ� ���� �ʴ� Ư¡�� ����.
*/

--��ǰ���̺� ����
create table tb_goods (
    g_idx number(10) primary key,
    g_name varchar2(30)
);
insert into tb_goods values (1, '�����');     --�Է� ����
insert into tb_goods values (1, '���ı�');     --�Է� ����

--�������� ���ٸ� max() �Լ��� ���� �Ϸù�ȣ�� ���ؾߵȴ�.
select max(g_idx)+1 from tb_goods;
insert into tb_goods values (2, '���ı�');
/*
�Է� �� �Լ��� ���� Ȯ���ϴ� ���� ���ŷο�Ƿ�
�������� �����Ͽ� �Է� �� ����Ѵ�.
*/
create sequence seq_serial_num
    increment by 1      --����ġ
    start with 100       --������ ��
    minvalue 99          --�ּڰ�
    maxvalue 110        --�ִ�
    cycle                      --����Ŭ ��뿩��(���� ��������� ������)
    nocache;                --ĳ�� ��뿩��(���� ���������� ������)

--������ �������� ������ ������ Ȯ��
select * from user_sequences;

--�������� ����ؼ� ������ �Է�
insert into tb_goods values (seq_serial_num.nextval, '������');
insert into tb_goods values (seq_serial_num.nextval, 'Ȩ����');
select * from tb_goods;

/*
    currval : ���� ���������� ��ȯ�Ѵ�.
    nextval : ���� �������� ��ȯ�Ѵ�.
*/
select seq_serial_num.currval from dual;
select seq_serial_num.nextval from dual;        --������ ������ ����(�ִ밪����)

--10���̻� �Է��ϸ� PK�������� ����� error�� �߻�!
insert into tb_goods values (seq_serial_num.nextval, '��������');
select * from tb_goods;
/*
    �������� cycle �ɼǿ� ���� �ִ񰪿� �����ϸ� �ٽ� ó������ ���ư���
    �Ϸù�ȣ�� �����ǹǷ� ���Ἲ �������ǿ� ����ȴ�.
    ��, �⺻Ű�� ����� �������� cycle �ɼ��� ����ϸ� �ȵȴ�. �١�
*/

--������ �����ϱ� (alter)
alter sequence seq_serial_num
    increment by 10
    nomaxvalue      --maxvalue�� ������� �ʰڴ�.   >> sequence�� ǥ���� �� �ִ� ���� �ִ��� ���� ���ڴٴ� �ǹ�. 
                              --�������� ǥ���� �� �ִ� �ִ�ġ�� ����ϰڴٴ� �ǹ���.
    minvalue 1
    nocycle
    nocache;           --start with�� ������ �� ����.
select seq_serial_num.currval from dual;

--������ �����ϱ�
drop sequence seq_serial_num;
select * from user_sequences;

--�Ϲ����� ������ ������ �Ʒ��� ���� �Ѵ�.
create sequence seq_serial_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache; /*
            �ִ밪, ����Ŭ, ĳ���� �Ϲ������� ������� �ʴ´�.
    */
select * from user_sequences;

select seq_serial_num.currval from dual;        --���� ����ô� �ȵ�. ������ nextval�� �� �� ���� �ؾ��Ѵ�.
select seq_serial_num.nextval from dual;
/*
������ ���� �� ���� ����ÿ��� currval(current value?)�� ������ �߻���.
nextval�� ���� �����Ͽ� ���������� ��ȯ�� �� currval�� �������� �� ������ �������� ��ȯ�ȴ�.
*/

--��ǰ ���̺� ���ο� �÷��� �߰�
alter table tb_goods add re_idx number;
select * from tb_goods;

/*
���� ������ �������� nextval�� ������ ����ϴ��� �׻� ���� ���� ��ȯ�Ѵ�.
*/
insert into tb_goods values (seq_serial_num.nextval,
        '��Ʈ��', seq_serial_num.nextval);     --�� ���忡 next val�� 2�� �����Ѵ�?   <<������ ����ϴ��� �׻� ���� ���� ��ȯ�Ѵ�.
select * from tb_goods;
        

/*
�ε��� : ���� �˻��ӵ��� ����ų �������� �����ϴ� ��ü
    primary key, unique�� ������ �÷����� �ڵ����� index�� ������.
*/
--�ε��� ����
create index tb_goods_name_idx on tb_goods (g_name);

--������ �������� Ȯ���ϱ�
select * from user_ind_columns;

--�ε��� ����
drop index tb_goods_name_idx;

--�ε����� ������ �Ұ����ϹǷ� ���� ������ �ʿ��ϴٸ� ���� �� �ٽ� �����Ѵ�.