/*
���ϸ� : Or11Constraint.sql
��������
���� : ���̺� ���� �� �ʿ��� �������� �������ǿ� ���� �н�.
*/

--study �������� �ǽ��Ѵ�.

/*
Primary key : �⺻Ű
-�������Ἲ�� �����ϱ� ���� ��������
-�ϳ��� ���̺� �ϳ��� �⺻Ű�� ������ �� �ִ�.
-�⺻Ű�� �����Ǹ� �� �÷��� �ߺ��� ���̳� NULL���� �Է��� �� X
*/

/*
����1] �ζ��� ���
    create table ���̺��(
        �÷��� �ڷ��� [constraint PK�����] primary key
    );
*/
create table tb_primary1 (
    idx number(10) primary key,
    user_id varchar2(30),
    user_name varchar2(50)
);

alter table tb_primary1
modify user_id varchar2(30);        --user_id varchar2(3) �Ǽ�..=> user_id varchar2(30)���� Ȯ����

desc tb_primary1;
/*
�������� Ȯ���ϱ�
    user_cons_columns : ���̺� ������ �������Ǹ�� �÷����� ������ ������ Ȯ���� �� �ִ�.
    user_constraints : ���̺� ������ ���������� ���� ������ Ȯ���� �� �ִ�.
    
�� �̿Ͱ��� ���������̳� ��, ���ν������� ������ �����ϰ� �ִ� �ý��� ���̺��� "�����ͻ���"�̶�� �Ѵ�.
*/
select * from user_cons_columns;
select * from user_constraints;

insert into tb_primary1 (idx, user_id, user_name)
    values (1, 'kosmo', '�ڽ���');
insert into tb_primary1 (idx, user_id, user_name)
    values (1, 'gasmo', '������'); /*
                    ���Ἲ�������� ����� ���Ͽ� error�߻�. PK(Primary Key)�� ������ �÷� idx���� �ߺ��� ���� �Է��� �� X
                    */
insert into tb_primary1 values (2, 'black', '��');
insert into tb_primary1 values ('', 'white', 'ȭ��Ʈ');/*
                    PK�� ������ �÷����� null(��)�� �Է��� �� X
                    */
select * from tb_primary1;
update tb_primary1 set idx = 2 where user_name='�ڽ���'; /*
                    update���� ���������� idx���� �̹� �����ϴ� 2�� ���������Ƿ�
                    �������� ����� �����߻���.
                */
                
                
/*
����2] �ƿ����� ���
    create table ���̺�� (
            �÷��� �ڷ���,
            [constraint �����] primary key(�÷���)
    );
*/
create table tb_primary2 (
    idx number,
    user_id varchar2(30),
    user_name varchar2(50),
    primary key (user_id)
);
desc tb_primary2;
select * from user_constraints;


/*
����3] ���̺� ���� �� alter ������ �������� �߰�
    alter table ���̺�� add [constraint �����] primary key (�÷���);
*/
create table tb_primary3(
    idx number,
    user_id varchar(3),
    user_name varchar2(50)
);
alter table tb_primary3 add
    constraint tb_primary3_pk       --[]�̹Ƿ� ���� �������.
        primary key(user_name);
desc tb_primary3;
select * from user_constraints;

--���̺��� �����ϸ� �ο��ߴ� PK �������ǵ� ���� �����ȴ�.
drop table tb_primary3;     -- ����!
select * from user_constraints;


/*
Unique : ����ũ
- ���� �ߺ��� ������� �ʴ� ��������
- ����, ���ڿ��� �ߺ��� ������� X�̳� null���� ���ؼ��� �ߺ� ��� O
- unique�� �� ���̺� 2�� �̻� ������ ��  O
*/

create table tb_unique1(
    idx number unique not null,
    name varchar2(3),
    telephone varchar2(20),
    nickname varchar2(30),
    unique(telephone, nickname)
);

alter table tb_unique1
modify  name varchar2(30);      --�� 3 >> ����.. 30

select * from user_constraints;
select * from user_cons_columns;

insert into tb_unique1 (idx, name, telephone, nickname)
    values(1, '���̸�', '010-1111-1111', '���座��');
insert into tb_unique1 (idx, name, telephone, nickname)
    values(2, '����', '010-2222-2222', '');       --�Է� �� >> unique�� null���� ���O
insert into tb_unique1 (idx, name, telephone, nickname)
    values(3, '����', '', '');        --�Է� O >> null�� ����ϹǷ�
select * from tb_unique1;

insert into tb_unique1 (idx, name, telephone, nickname)
    values(1, '����', '010-3333-3333', '');       --error >> �ߺ��� idx�� ����.
    
insert into tb_unique1 values (4, '���켺', '010-4444-4444', '��ȭ���');
insert into tb_unique1 values (5, '������', '010-5555-5555', '��ȭ���');        --�Է� ����
insert into tb_unique1 values (4, 'Ȳ����', '010-4444-4444', '��ȭ���');      --error
/*
    telephone�� nickname �÷��� ������ ��������� �����Ǿ����Ƿ�
    �� ���� �÷��� ���ÿ� ������ ���� ������ ��찡 �ƴ϶�� �ߺ��� ���� ���ȴ�.
    ��, 4���� 5���� ���� �ٸ� �����ͷ� �ν��ϹǷ� �Էµǰ�
    4���� 6���� ������ �����ͷ� �νĵǾ� error �߻�.
*/


/*
Unique 2��° ����
*/
create table tb_unique2(
    idx number primary key,
    name varchar2(30),
    mobile varchar2(20),
    
    unique (mobile)
);
select * from user_cons_columns;


/*
Foreign key : �ܷ�Ű, ����Ű
- �ܷ�Ű�� �������Ἲ�� �����ϱ� ���� ���������̴�.
- ���� ���̺� ���� �ܷ�Ű�� �����Ǿ� �ִٸ� �ڽ����̺� �������� ������ ���,
  �θ����̺��� ���ڵ�� �������� �ʴ´�.
*/

/*
����1] �ζ��� ���
        create table ���̺�� (
            �÷��� �ڷ��� [constraint �����]
                references �θ����̺�� (�θ����̺��� PK�÷���)
        );
*/
create table tb_foreign1 (
    f_idx number(10) primary key,
    f_name varchar2(50),
    f_id varchar2(30) constraint tb_foreign1_fk     --foreign key => fk
        references tb_primary2 (user_id)
);

--�θ� ���̺� ���ڵ尡 ���� ���� ������
select  * from tb_primary2;
--�θ� ���̺� ������ ���ڵ尡 �����Ƿ� �ڽ����̺� �Է� X
insert into tb_foreign1 values (1, '���ʿ�','WannerOne');
--�θ� ���̺� ���ڵ� ���� ����
insert into tb_primary2 values (1, 'BTS', '��ź�ҳ��');
--�θ����̺� ������ ���ڵ带 ������� �ڽ����̺� ���ڵ� ���Ե�
insert into tb_foreign1 values (1, '��ź�ҳ��', 'BTS');
--�θ�Ű�� �����Ƿ� �Է� X
insert into tb_foreign1 values (2,'Ʈ���̽�','Twice');

--�Էµ� ���ڵ� Ȯ��
select * from tb_primary2;
select * from tb_foreign1;

/*
        �ڽ����̺��� �����ϴ� ���ڵ尡 �����Ƿ�
        �θ� ���̺��� ���ڵ带 ������ �� ����.
        �� ��쿡�� �ݵ�� �ڽ����̺��� ���ڵ带 ���� ������ �� �θ����̺��� ���ڵ带 �����ؾ� �Ѵ�.!
*/
delete from tb_primary2 where idx=1;        --error >> child record found

delete from tb_foreign1 where f_idx=1;      --�ڽ����̺��� ���ڵ带 ���� ������ �� 
delete from tb_primary2 where idx=1;        --OK

--�� ���̺� ��ο��� �����Ǿ����� Ȯ��
select * from tb_primary2;
select * from tb_foreign1;

/*
����2] �ƿ����ι��
    create table ���̺�� (
        �÷��� �ڷ���,
        
        [constraint �����] foreign key (�÷���)
            references �θ����̺� (�θ����̺��� ������ �÷�)
*/
create table tb_foreign2 (
    f_id number primary key,
    f_name varchar2(30),
    f_date date,
    
    foreign key (f_name) references tb_primary3(user_name)
);      --primary3 �ٽ� ����..
select * from user_constraints;
/*
������ �������� �������� Ȯ�� �� �÷���
P : Primary key
R : Reference integrity ��, Foreign key�� ���� 
C : Check Ȥ�� Not null
U : Unique
*/


/*
�ܷ�Ű ���� �� �ɼ�
[on delete cascade]
    -> �θ��ڵ� ���� �� �ڽķ��ڵ���� ���� ������
    
    ����]
        �÷��� �ڷ��� references �θ����̺�(PK�÷�)
            on delete cascade;


[on delete set null]
    -> �θ��ڵ� ���� �� �ڽķ��ڵ� ���� null�� �����
    
    ����] 
        �÷��� �ڷ��� references �θ����̺�(PK�÷�)
            on delete set null
            
�ؽǹ����� ���԰Խù��� ���� ȸ���� �� �Խù��� �ϰ������� �����ؾߵ� �� ����� �� �ִ� �ɼ��̴�.
    ��, �ڽ����̺��� ��� ���ڵ尡 �����ǹǷ� ��뿡 �����ؾߵ�!!
*/
create table tb_primary4(
    user_id varchar2(20) primary key,
    user_name varchar2(100)
);
create table tb_foreign4 (
    f_idx number(10) primary key,
    f_name varchar2(20),
    user_id varchar2(20) constraint tb_foreign4_fk
        references tb_primary4 (user_id)
            on delete cascade
);
insert into tb_primary4 values ('kosmo', '�ڽ���');        --�׻� �θ����̺� ���� �Է� ��,
insert into tb_foreign4 values (1, '1���Դϴ�', 'kosmo');   --�ڽ����̺� �Է��ؾ��Ѵ�.
insert into tb_foreign4 values (2, '2���Դϴ�', 'kosmo');
insert into tb_foreign4 values (3, '3���Դϴ�', 'kosmo');
insert into tb_foreign4 values (4, '4���Դϴ�', 'kosmo');
insert into tb_foreign4 values (5, '5���Դϴ�', 'kosmo');
insert into tb_foreign4 values (6, '6���Դϴ�', 'kosmo');
insert into tb_foreign4 values (7, '7���Դϴ�', 'hong');        --�θ�Ű�� �����Ƿ� �����߻�

select * from tb_primary4;
select * from tb_foreign4;

delete from tb_primary4;    /*
            �θ����̺��� ���ڵ� ���� �� on delete cascade �ɼ� ������
            �θ��� �Ӹ� �ƴ϶� �ڽ����̺���� ��� ���ڵ尡 ������.
    */

select * from tb_primary4;
select * from tb_foreign4;


--on delete set null �ɼ� �׽�Ʈ
create table tb_primary5 (
    user_id varchar2(20) primary key,
    user_name varchar2(100)
);
create table tb_foreign5 (
    f_idx number(10) primary key,
    f_name varchar2(20),
    user_id varchar2(20) constraint tb_foreign5_fk
        references tb_primary5(user_id)
            on delete set null
);
insert into tb_primary5 values ('kosmo', '�ڽ���');
insert into tb_primary5 values (1, '1���Խù�','kosmo');
insert into tb_primary5 values (2, '2���Խù�','kosmo');
insert into tb_primary5 values (3, '3���Խù�','kosmo');
insert into tb_primary5 values (4, '4���Խù�','kosmo');
insert into tb_primary5 values (5, '5���Խù�','kosmo');

--�Էµ� ���ڵ� Ȯ��
select * from tb_primary5;
select * from tb_foreign5;

/*
on delete set null �ɼ����� �ڽ����̺��� ���ڵ�� �������� �ʰ�
����Ű �κи� null������ ����ȴ�.
*/
delete from tb_primary5;

select * from tb_primary5;
select * from tb_foreign5;                                                                                  ---������� �� ����..


/*
not null : null���� ������� �ʴ� ��������
    ���� ] 
        create table ���̺�� (
            �÷��� �ڷ��� not null,
            �÷��� �ڷ��� null        -- null�� ����ϰڴٴ� �ǹ̷� �ۼ�������, �̷��� ��������� X
                                                  null�� ������� �ʴ� ���� ��������̴�.        
        );
*/
create table tb_not_null (
    m_idx number(10) primary key,       --PK�� ���������Ƿ� NN
    m_id varchar(30) not null,                --NN
    m_pw varchar2(40) null,                   --null ���(�Ϲ�������  null�� �����Ѵ�)
    m_name varchar2(50)                        --null ���(�̿� ���� �����Ѵ�)     //null ����.. X
);
desc tb_not_null;

insert into tb_not_null values (10, 'hong1', '1111', 'ȫ�浿');
insert into tb_not_null values (20, 'hong2', '2222', '');
insert into tb_not_null values (30, 'hong3', '', '');
insert into tb_not_null values (40, '', '4444', '��浿');     --�Է½���. null�� �Է��� �� X
insert into tb_not_null (m_id, m_pw, m_name)
    values ('hong5', '5555', '���浿');        --�Է½���      >> m.idx�÷��� ���� �ԷµǾ�� �Ѵ�.
insert into tb_not_null values (60, ' ', '6666', '���浿');        --�Է¼���! (space ���� �����̴�.)

select * from tb_not_null;


/*
Default : insert �� �ƹ��� ���� �Է����� ������ �ڵ����� ���ԵǴ� �����͸� ���Ѵ�.
*/
create table tb_default (
    id varchar2(30) not null,
    pw varchar2(30) default 'qwer'
);
desc tb_default;
select * from tb_default;
insert into tb_default values ('aaaa', '1234');       --1234�� �Էµ�
insert into tb_default values ('bbb', '');                --null���� �Էµ�
insert into tb_default (id) values ('cccc');            --default�� ���Ե�
insert into tb_default (id,pw) values ('dddd', default);       --default�� ���Ե�
/*
    ������ ������ default���� �Է��Ϸ��� �ݵ�� insert�� �÷���ü�� �����ϰų�
    default Ű���带 ��� �ؾ��Ѵ�!
*/


/*
check : Domain(�ڷ���) ���Ἲ�� �����ϱ� ���� ������������
           �ش� �÷��� �߸��� �����Ͱ� �Էµ��� �ʵ��� �����ϴ� ���������̴�.
*/
create table tb_check1 (
    gender varchar2(20) not null
        constraint check_gender
            check (gender in ('M', 'F'))
);
insert into tb_check1 values ('M');
insert into tb_check1 values ('F');
insert into tb_check1 values ('A');     --'A'~'����' �Է½��� >> ��� �ȵ�!
insert into tb_check1 values ('Man');
insert into tb_check1 values ('����');

create table tb_check2 (
    ticket_cnt number not null
        check(ticket_cnt<=5)
);
insert into tb_check2 values (4);
insert into tb_check2 values (5);
insert into tb_check2 values (6);       --�Է� ����. check�������� ����