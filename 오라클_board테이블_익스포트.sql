--------------------------------------------------------
--  ������ ������ - �ݿ���-6��-04-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "KOSMO"."BOARD" 
   (	"NUM" NUMBER, 
	"TITLE" VARCHAR2(200 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"ID" VARCHAR2(30 BYTE), 
	"POSTDATE" DATE DEFAULT sysdate, 
	"VISITCOUNT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into KOSMO.BOARD
SET DEFINE OFF;
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (19,'����1�Դϴ�','����1�Դϴ�','kosmo',to_date('21/05/18','RR/MM/DD'),15);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (20,'20�� �Խù� �����մϴ�.','�����Ǿ�����?','kosmo',to_date('21/05/18','RR/MM/DD'),7);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (21,'����3�Դϴ�','����3�Դϴ�','kosmo',to_date('21/05/18','RR/MM/DD'),3);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (22,'����4�Դϴ�','����4�Դϴ�','kosmo',to_date('21/05/18','RR/MM/DD'),10);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (23,'����5�Դϴ�','����5�Դϴ�','kosmo',to_date('21/05/18','RR/MM/DD'),4);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (24,'dd','ddd','kosmo',to_date('21/05/18','RR/MM/DD'),4);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (27,'1��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (26,'test','test','test',to_date('21/05/20','RR/MM/DD'),2);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (28,'2��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (29,'3��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (30,'4��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (31,'5��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (32,'6��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (33,'7��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (34,'8��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (35,'9��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (36,'10��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (37,'11��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (38,'12��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (39,'13��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (40,'14��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (41,'15��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (42,'16��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (43,'17��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),1);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (44,'18��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (45,'19��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (46,'20��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (47,'21��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (48,'22��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (49,'23��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (50,'24��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (51,'25��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (52,'26��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (53,'27��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (54,'28��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (55,'29��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (56,'30��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (57,'31��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (58,'32��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (59,'33��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (60,'34��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (61,'35��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (62,'36��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (63,'37��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (64,'38��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (65,'39��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (66,'40��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (67,'41��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (68,'42��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (69,'43��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (70,'44��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (71,'45��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (72,'46��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (73,'47��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),1);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (74,'48��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (75,'49��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (76,'50��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (77,'51��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (78,'52��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),3);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (79,'53��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (80,'54��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (81,'55��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (82,'56��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (83,'57��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),1);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (84,'58��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (85,'59��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),4);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (86,'60��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (87,'61��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),2);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (88,'62��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),3);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (89,'63��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (90,'64��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (91,'65��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (92,'66��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (93,'67��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),2);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (94,'68��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (95,'69��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),2);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (96,'70��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (97,'71��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (98,'72��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),6);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (99,'73��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (100,'74��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (101,'75��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (102,'76��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (103,'77��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),3);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (104,'78��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (105,'79��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),4);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (106,'80��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (107,'81��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (108,'82��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),2);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (109,'83��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (110,'84��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (111,'85��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (112,'86��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (113,'87��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),5);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (114,'88��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (115,'89��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),7);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (116,'90��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (117,'91��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (118,'92��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),3);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (119,'93��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (120,'94��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (121,'95��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (122,'96��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),0);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (123,'97��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),7);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (124,'98��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),1);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (125,'99��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),11);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (126,'100��° ������ �׽�Ʈ �Խù�','������ �׽�Ʈ �Խù�
','kosmo',to_date('21/05/20','RR/MM/DD'),1);
Insert into KOSMO.BOARD (NUM,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (127,'1���� �Է��� �ߵǳ���?','1��','kosmo',to_date('21/05/20','RR/MM/DD'),4);
--------------------------------------------------------
--  DDL for Index SYS_C007251
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOSMO"."SYS_C007251" ON "KOSMO"."BOARD" ("NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "KOSMO"."BOARD" ADD PRIMARY KEY ("NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KOSMO"."BOARD" MODIFY ("VISITCOUNT" NOT NULL ENABLE);
  ALTER TABLE "KOSMO"."BOARD" MODIFY ("POSTDATE" NOT NULL ENABLE);
  ALTER TABLE "KOSMO"."BOARD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "KOSMO"."BOARD" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "KOSMO"."BOARD" MODIFY ("TITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "KOSMO"."BOARD" ADD CONSTRAINT "BOARD_MEMBER_FK" FOREIGN KEY ("ID")
	  REFERENCES "KOSMO"."MEMBER" ("ID") ENABLE;
