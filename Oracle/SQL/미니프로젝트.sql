create table sh_product_code (
        p_code number(10) primary key,
        category_name varchar2(50)
);
   
drop table sh_product_code;
--drop table sh_goods;
--drop table sh_goods_log;


select * from tab;


create table sh_goods (
    g_idx number(10) primary key,
    goods_name varchar2(50),
    goods_price number(38),
    regidate varchar2(30),
    p_code number(10) constraint sh_goods_fk
        references sh_product_code (p_code)
);
drop table sh_goods;
select * from sh_goods;


create table sh_goods_log (
    log_idx number(10) primary key,
    goods_name varchar2(50),
    goods_idx number(10),
    p_action varchar2(50)
);

create table p_action (
    leep varchar2(20) not null
        constraint check_leep
            check (leep in ('Insert', 'Delete'))
);
insert into p_action values ('Insert');     --rrererererererere
insert into p_action values ('Delete');


--������ ���� product_code_seq
create sequence product_code_seq
    increment by 1     
    start with 1      
    nominvalue         
    nomaxvalue     
    nocycle                      
    nocache;
--drop sequence product_code_seq;

--������ ���� product_code_seq
--create table product_code_seq (
--    c_idx number(30) primary key,
--    c_name varchar2(30)
--);
--drop table product_code_seq;

select * from user_sequences;

create sequence goods_seq
    increment by 1     
    start with 1      
    nominvalue        
    nomaxvalue  
    nocycle                      
    nocache;
--drop sequence goods_seq;

create sequence goods_log_seq
    increment by 1     
    start with 1      
    nominvalue        
    nomaxvalue  
    nocycle                      
    nocache;
--drop sequence goods_log_seq;

--���̵����� �Է�
insert into sh_product_code values (1, '������ǰ');
insert into sh_product_code values (product_code_seq.nextval, '����');
insert into sh_product_code values (product_code_seq.nextval, '��ǻ��');
select * from sh_product_code;

insert into sh_goods 
    values (goods_seq.nextval, 'Sens��Ʈ��', 1200000, sysdate, 3);
insert into sh_goods 
    values (goods_seq.nextval, 'Gram��Ʈ��', 1300000, sysdate, 3);
insert into sh_goods 
    values (goods_seq.nextval, '�����', 1000000, sysdate, 1);
insert into sh_goods 
    values (goods_seq.nextval, '�κ�û�ұ�', 500000, sysdate, 1);
insert into sh_goods 
    values (goods_seq.nextval, '�ڹ����α׷���', 30000, sysdate, 2);    
select * from sh_goods;

insert into sh_goods
    values (goods_seq.nextval, 'DSLRī�޶�', 900000, sysdate, 4); /*
        �θ�Ű�� �����Ƿ� ���� �������� ����
    */

commit;


-------------------------------------------------------------------
select * from sh_goods;

select g_idx, goods_name,
    to_char(goods_price, '9,999,000'),
    to_char(regidate, 'yyyy-mm-dd hh:mi'), p_code
from sh_goods where 1=1 and goods_name like '%��Ʈ��%';