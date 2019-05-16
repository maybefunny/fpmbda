/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     15-May-19 11:42:56                           */
/*==============================================================*/


alter table MODUL
   drop constraint FK_MODUL_REFERENCE_USER;

alter table MODUL
   drop constraint FK_MODUL_REFERENCE_KOMUNITA;

alter table PENGUMUMAN
   drop constraint FK_PENGUMUM_REFERENCE_USER;

alter table PENGUMUMAN
   drop constraint FK_PENGUMUM_REFERENCE_KOMUNITA;

alter table POST
   drop constraint FK_POST_REFERENCE_KOMUNITA;

alter table POST
   drop constraint FK_POST_REFERENCE_USER;

alter table REPLY
   drop constraint FK_REPLY_REFERENCE_POST;

alter table REPLY
   drop constraint FK_REPLY_REFERENCE_USER;

alter table SYARAT
   drop constraint FK_SYARAT_REFERENCE_MODUL_4;

alter table SYARAT
   drop constraint FK_SYARAT_REFERENCE_MODUL_3;

alter table USER_KOMUNITAS
   drop constraint FK_USER_KOM_REFERENCE_USER_1;

alter table USER_KOMUNITAS
   drop constraint FK_USER_KOM_REFERENCE_KOMUNITA;

alter table USER_KOMUNITAS
   drop constraint FK_USER_KOM_REFERENCE_USER_2;

alter table USER_MODUL
   drop constraint FK_USER_MOD_REFERENCE_USER;

alter table USER_MODUL
   drop constraint FK_USER_MOD_REFERENCE_MODUL;

drop table KOMUNITAS cascade constraints;

drop table MODUL cascade constraints;

drop table PENGUMUMAN cascade constraints;

drop table POST cascade constraints;

drop table REPLY cascade constraints;

drop table SYARAT cascade constraints;

drop table USERS cascade constraints;

drop table USER_KOMUNITAS cascade constraints;

drop table USER_MODUL cascade constraints;

/*==============================================================*/
/* Table: KOMUNITAS                                             */
/*==============================================================*/
create table KOMUNITAS  ( -- UDAH
   KMT_ID               CHAR(10)                        not null,
   KMT_NAMA             VARCHAR2(20),
   KMT_DESKRIPSI        VARCHAR2(200),
   constraint PK_KOMUNITAS primary key (KMT_ID)
);

/*==============================================================*/
/* Table: MODUL                                                 */
/*==============================================================*/
create table MODUL  ( -- 5 modul per komunitas
   MD_ID                CHAR(10)                        not null,
   KMT_ID               CHAR(10),
   USR_ID               CHAR(10),
   MD_NAMA              VARCHAR2(20),
   MD_KONTEN            CLOB,
   MD_SUBMIT            SMALLINT,
   constraint PK_MODUL primary key (MD_ID)
);

/*==============================================================*/
/* Table: PENGUMUMAN                                            */
/*==============================================================*/
create table PENGUMUMAN  ( -- 2 per komunitas
   PNG_ID               CHAR(10)                        not null,
   KMT_ID               CHAR(10),
   USR_ID               CHAR(10),
   PNG_NAMA             VARCHAR2(20)                    not null,
   PNG_KONTEN           CLOB                            not null,
   PNG_TGLTAMPIL        DATE                            not null,
   PNG_TGLSELESAI       DATE                            not null,
   constraint PK_PENGUMUMAN primary key (PNG_ID)
);

/*==============================================================*/
/* Table: POST                                                  */
/*==============================================================*/
create table POST  ( -- 2 per komunitas
   POST_ID              CHAR(10)                        not null,
   KMT_ID               CHAR(10),
   USR_ID               CHAR(10),
   POST_JUDUL           VARCHAR2(150),
   POST_KONTEN          CLOB,
   constraint PK_POST primary key (POST_ID)
);

/*==============================================================*/
/* Table: REPLY                                                 */
/*==============================================================*/
create table REPLY  ( -- 3 per post
   RPL_ID               CHAR(10)                        not null,
   POST_ID              CHAR(10),
   USR_ID               CHAR(10),
   RPL_KONTEN           CLOB,
   constraint PK_REPLY primary key (RPL_ID)
);

/*==============================================================*/
/* Table: SYARAT                                                */
/*==============================================================*/
create table SYARAT  ( -- sesuai MODUL
   MD_ID                CHAR(10)                        not null,
   MOD_MD_ID            CHAR(10)                        not null,
   constraint PK_SYARAT primary key (MD_ID, MOD_MD_ID)
);

/*==============================================================*/
/* Table: USERS                                                */
/*==============================================================*/
create table USERS  ( -- UDAH
   USR_ID               CHAR(10)                        not null,
   USR_NRP              CHAR(15)                        not null,
   USR_NAMA             VARCHAR2(20)                    not null,
   USR_EMAIL            VARCHAR2(100)                   not null,
   constraint PK_USER primary key (USR_ID)
);

/*==============================================================*/
/* Table: USER_KOMUNITAS                                        */
/*==============================================================*/
create table USER_KOMUNITAS  ( -- UDAH
   USR_ID               CHAR(10)                        not null,
   KMT_ID               CHAR(10)                        not null,
   ADM_USR_ID           CHAR(10),
   STATUS               SMALLINT,
   constraint PK_USER_KOMUNITAS primary key (USR_ID, KMT_ID)
);

/*==============================================================*/
/* Table: USER_MODUL                                            */
/*==============================================================*/
create table USER_MODUL  ( -- sesuai MODUL
   USR_ID               CHAR(10)                        not null,
   MD_ID                CHAR(10)                        not null,
   SUBMISSION           SMALLINT,
   STATUS_SELESAI       SMALLINT,
   constraint PK_USER_MODUL primary key (USR_ID, MD_ID)
);

alter table MODUL
   add constraint FK_MODUL_REFERENCE_USER foreign key (USR_ID)
      references USERS (USR_ID);

alter table MODUL
   add constraint FK_MODUL_REFERENCE_KOMUNITA foreign key (KMT_ID)
      references KOMUNITAS (KMT_ID);

alter table PENGUMUMAN
   add constraint FK_PENGUMUM_REFERENCE_USER foreign key (USR_ID)
      references USERS (USR_ID);

alter table PENGUMUMAN
   add constraint FK_PENGUMUM_REFERENCE_KOMUNITA foreign key (KMT_ID)
      references KOMUNITAS (KMT_ID);

alter table POST
   add constraint FK_POST_REFERENCE_KOMUNITA foreign key (KMT_ID)
      references KOMUNITAS (KMT_ID);

alter table POST
   add constraint FK_POST_REFERENCE_USER foreign key (USR_ID)
      references USERS (USR_ID);

alter table REPLY
   add constraint FK_REPLY_REFERENCE_POST foreign key (POST_ID)
      references POST (POST_ID);

alter table REPLY
   add constraint FK_REPLY_REFERENCE_USER foreign key (USR_ID)
      references USERS (USR_ID);

alter table SYARAT
   add constraint FK_SYARAT_REFERENCE_MODUL_4 foreign key (MOD_MD_ID)
      references MODUL (MD_ID);

alter table SYARAT
   add constraint FK_SYARAT_REFERENCE_MODUL_3 foreign key (MD_ID)
      references MODUL (MD_ID);

alter table USER_KOMUNITAS
   add constraint FK_USER_KOM_REFERENCE_USER_1 foreign key (USR_ID)
      references USERS (USR_ID);

alter table USER_KOMUNITAS
   add constraint FK_USER_KOM_REFERENCE_KOMUNITA foreign key (KMT_ID)
      references KOMUNITAS (KMT_ID);

alter table USER_KOMUNITAS
   add constraint FK_USER_KOM_REFERENCE_USER_2 foreign key (ADM_USR_ID)
      references USERS (USR_ID);

alter table USER_MODUL
   add constraint FK_USER_MOD_REFERENCE_USER foreign key (USR_ID)
      references USERS (USR_ID);

alter table USER_MODUL
   add constraint FK_USER_MOD_REFERENCE_MODUL foreign key (MD_ID)
      references MODUL (MD_ID);

Drop sequence pengumuman_seq;
Create sequence pengumuman_seq;

CREATE OR REPLACE
TRIGGER pengumuman_sequence
BEFORE INSERT ON PENGUMUMAN
FOR EACH ROW
DECLARE
    pengumuman_next_val number;
BEGIN
    select pengumuman_seq.nextval into pengumuman_next_val from dual;
    :new.PNG_ID := 'PNG' || to_char(lpad(pengumuman_next_val,7,'0'));
END;

Drop sequence modul_seq;
Create sequence modul_seq;

CREATE OR REPLACE
TRIGGER modul_sequence
BEFORE INSERT ON MODUL
FOR EACH ROW
DECLARE
    modul_next_val number;
BEGIN
    select modul_seq.nextval into modul_next_val from dual;
    :new.MD_ID := 'MD' || to_char(lpad(modul_next_val,8,'0'));
END;

Drop sequence post_seq;
Create sequence post_seq;

CREATE OR REPLACE
TRIGGER post_sequence
BEFORE INSERT ON POST
FOR EACH ROW
DECLARE
    post_next_val number;
BEGIN
    select post_seq.nextval into post_next_val from dual;
    :new.POST_ID := 'POST' || to_char(lpad(post_next_val,6,'0'));
END;

Drop sequence reply_seq;
Create sequence reply_seq;

CREATE OR REPLACE
TRIGGER reply_sequence
BEFORE INSERT ON REPLY
FOR EACH ROW
DECLARE
    reply_next_val number;
BEGIN
    select reply_seq.nextval into reply_next_val from dual;
    :new.RPL_ID := 'RPL' || to_char(lpad(reply_next_val,7,'0'));
END;

Drop sequence kmt_seq;
Create sequence kmt_seq;

CREATE OR REPLACE
TRIGGER kmt_sequence
BEFORE INSERT ON KOMUNITAS
FOR EACH ROW
DECLARE
    kmt_next_val number;
BEGIN
    select kmt_seq.nextval into kmt_next_val from dual;
    :new.RPL_ID := 'KMT' || to_char(lpad(kmt_next_val,7,'0'));
END;

Drop sequence usr_seq;
Create sequence usr_seq;

CREATE OR REPLACE
TRIGGER usr_sequence
BEFORE INSERT ON USERS
FOR EACH ROW
DECLARE
    usr_next_val number;
BEGIN
    select usr_seq.nextval into usr_next_val from dual;
    :new.RPL_ID := 'USR' || to_char(lpad(usr_next_val,7,'0'));
END;

-- UDAH --
insert into users values('USR0000000', '05111740000000', 'Admin', 'admin@admin.com');
insert into users values('USR0000001', '05111740000071', 'Dillon Mckay', 'accumsan.sed@lectuspedeultrices.com');
insert into users values('USR0000002', '05111740000081', 'Lacy Allison', 'ipsum.Donec@atnisiCum.edu');
insert into users values('USR0000003', '05111740000086', 'Henry Hunt', 'ipsum@malesuadavel.co.uk');
insert into users values('USR0000004', '05111740000097', 'Neil Gallagher', 'scelerisque.mollis@maurisutmi.org');
insert into users values('USR0000005', '05111740000065', 'Dale Johnston', 'eros@turpisnecmauris.org');
insert into users values('USR0000006', '05111740000070', 'Jermaine Lee', 'vulputate.dui.nec@pedeCum.co.uk');
insert into users values('USR0000007', '05111740000087', 'Sydney Holder', 'Curabitur@justo.co.uk');
insert into users values('USR0000008', '05111740000026', 'Fulton Dunlap', 'et.nunc.Quisque@nasceturridiculusmus.edu');
insert into users values('USR0000009', '05111740000093', 'Aretha Robinson', 'diam.Sed.diam@montes.ca');
insert into users values('USR0000010', '05111740000010', 'Ann Murray', 'enim@tortorNunc.org');
insert into users values('USR0000011', '05111740000023', 'Linus Trevino', 'euismod@adipiscinglacus.edu');
insert into users values('USR0000012', '05111740000069', 'Mollie Gould', 'Integer.in@elitsed.org');
insert into users values('USR0000013', '05111740000066', 'Cassady Mcleod', 'sed.orci@mi.co.uk');
insert into users values('USR0000014', '05111740000005', 'Aristotle Oconnor', 'mollis.non@dolordapibusgravida.ca');
insert into users values('USR0000015', '05111740000033', 'Nero Talley', 'amet.risus.Donec@enim.net');
insert into users values('USR0000016', '05111740000099', 'Carissa Haynes', 'mauris.a.nunc@risusvariusorci.com');
insert into users values('USR0000017', '05111740000029', 'Marcia Sharpe', 'magna.Duis@molestieSedid.co.uk');
insert into users values('USR0000018', '05111740000055', 'Baxter Oneil', 'ac.eleifend.vitae@eu.ca');
insert into users values('USR0000019', '05111740000092', 'Guy Cabrera', 'euismod.ac@mattis.com');
insert into users values('USR0000020', '05111740000010', 'Regan Barry', 'ut.nisi@ornarelectusjusto.ca');
insert into users values('USR0000021', '05111740000060', 'Bree Knight', 'nonummy@Donec.com');
insert into users values('USR0000022', '05111740000068', 'Lysandra Carney', 'nec.cursus.a@sit.edu');
insert into users values('USR0000023', '05111740000009', 'Dieter Mcdonald', 'a.scelerisque.sed@vitaealiquet.co.uk');
insert into users values('USR0000024', '05111740000001', 'Anne Wright', 'rutrum.magna.Cras@semper.net');
insert into users values('USR0000025', '05111740000036', 'Rhea Howard', 'Suspendisse.sagittis@feugiatnec.org');
insert into users values('USR0000026', '05111740000042', 'Kendall Moore', 'non.dui.nec@a.co.uk');
insert into users values('USR0000027', '05111740000044', 'Conan Dixon', 'sagittis.felis.Donec@nonmassanon.net');
insert into users values('USR0000028', '05111740000096', 'Marvin Flowers', 'tortor.Integer@loremut.ca');
insert into users values('USR0000029', '05111740000001', 'Sopoline Barrett', 'Mauris.vel@euaugue.edu');
insert into users values('USR0000030', '05111740000098', 'Blair Richardson', 'Aenean.euismod@Mauris.ca');
insert into users values('USR0000031', '05111740000051', 'Laura Ortiz', 'Fusce.feugiat@magnaseddui.co.uk');
insert into users values('USR0000032', '05111740000038', 'Joel Sharp', 'ipsum@sociosqu.co.uk');
insert into users values('USR0000033', '05111740000013', 'Chelsea Livingston', 'Curabitur.consequat@ProinultricesDuis.co.uk');
insert into users values('USR0000034', '05111740000029', 'Ferris Adkins', 'volutpat@maurisaliquameu.net');
insert into users values('USR0000035', '05111740000040', 'Harrison Conrad', 'mauris@velitCras.com');
insert into users values('USR0000036', '05111740000080', 'Keane Howell', 'enim.nec.tempus@faucibus.org');
insert into users values('USR0000037', '05111740000041', 'Connor Mcdaniel', 'lorem.eu@nuncrisusvarius.edu');
insert into users values('USR0000038', '05111740000037', 'Seth Frye', 'iaculis.odio@litora.ca');
insert into users values('USR0000039', '05111740000062', 'Calista Mays', 'purus.ac.tellus@augue.co.uk');
insert into users values('USR0000040', '05111740000073', 'Roth Wade', 'Duis@sociosquad.net');
insert into users values('USR0000041', '05111740000091', 'Amena Luna', 'Phasellus.vitae.mauris@quamCurabitur.ca');
insert into users values('USR0000042', '05111740000015', 'Linda Harper', 'ipsum@Donecnon.org');
insert into users values('USR0000043', '05111740000090', 'Belle Delacruz', 'non.justo.Proin@eratnonummy.org');
insert into users values('USR0000044', '05111740000036', 'Nina Mcdowell', 'lacus@Cumsociis.ca');
insert into users values('USR0000045', '05111740000100', 'Lyle Duffy', 'non.hendrerit.id@hendreritid.co.uk');
insert into users values('USR0000046', '05111740000045', 'Clark Mcfarland', 'Vivamus@tortornibh.co.uk');
insert into users values('USR0000047', '05111740000002', 'Graiden Cook', 'nunc.ac@metusAliquamerat.com');
insert into users values('USR0000048', '05111740000092', 'Bruno Donovan', 'ultricies.adipiscing@Cras.edu');
insert into users values('USR0000049', '05111740000086', 'Derek Underwood', 'leo.elementum.sem@Phaselluselit.ca');
insert into users values('USR0000050', '05111740000062', 'Keaton Francis', 'vitae@consectetueripsum.org');

-- UDAH --
insert into komunitas values('KMT0000001', 'TCyber', 'Komunitas sekuritas');
insert into komunitas values('KMT0000002', 'Android', 'Komunitas development aplikasi untuk Android');
insert into komunitas values('KMT0000003', 'Gamedev', 'Komunitas development game');
insert into komunitas values('KMT0000004', 'CP', 'Komunitas competitive programming');

-- UDAH --
insert into user_komunitas values('USR0000001', 'KMT0000001', 'USR0000000', 2);
insert into user_komunitas values('USR0000002', 'KMT0000002', 'USR0000000', 2);
insert into user_komunitas values('USR0000003', 'KMT0000003', 'USR0000000', 2);
insert into user_komunitas values('USR0000004', 'KMT0000004', 'USR0000000', 2);
insert into user_komunitas values('USR0000006', 'KMT0000001', 'USR0000000', 2);
insert into user_komunitas values('USR0000007', 'KMT0000002', 'USR0000000', 2);
insert into user_komunitas values('USR0000008', 'KMT0000003', 'USR0000000', 2);
insert into user_komunitas values('USR0000009', 'KMT0000004', 'USR0000000', 2);
insert into user_komunitas values('USR0000011', 'KMT0000001', 'USR0000001', 1);
insert into user_komunitas values('USR0000012', 'KMT0000002', 'USR0000002', 1);
insert into user_komunitas values('USR0000013', 'KMT0000003', 'USR0000003', 1);
insert into user_komunitas values('USR0000014', 'KMT0000004', 'USR0000004', 1);
insert into user_komunitas values('USR0000016', 'KMT0000001', 'USR0000006', 1);
insert into user_komunitas values('USR0000017', 'KMT0000002', 'USR0000007', 1);
insert into user_komunitas values('USR0000018', 'KMT0000003', 'USR0000008', 1);
insert into user_komunitas values('USR0000019', 'KMT0000004', 'USR0000009', 1);
insert into user_komunitas values('USR0000021', 'KMT0000001', 'USR0000001', -1);
insert into user_komunitas values('USR0000022', 'KMT0000002', 'USR0000002', -1);
insert into user_komunitas values('USR0000023', 'KMT0000003', 'USR0000003', 1);
insert into user_komunitas values('USR0000024', 'KMT0000004', 'USR0000004', 1);
insert into user_komunitas values('USR0000026', 'KMT0000001', 'USR0000006', 1);
insert into user_komunitas values('USR0000027', 'KMT0000002', 'USR0000007', 1);
insert into user_komunitas values('USR0000028', 'KMT0000003', 'USR0000008', 1);
insert into user_komunitas values('USR0000029', 'KMT0000004', 'USR0000009', 1);
insert into user_komunitas values('USR0000031', 'KMT0000001', 'USR0000001', 1);
insert into user_komunitas values('USR0000032', 'KMT0000002', 'USR0000002', 1);
insert into user_komunitas values('USR0000033', 'KMT0000003', 'USR0000003', 1);
insert into user_komunitas values('USR0000034', 'KMT0000004', 'USR0000004', 1);
insert into user_komunitas values('USR0000036', 'KMT0000001', 'USR0000006', -1);
insert into user_komunitas values('USR0000037', 'KMT0000002', 'USR0000007', 1);
insert into user_komunitas values('USR0000038', 'KMT0000003', 'USR0000008', 1);
insert into user_komunitas values('USR0000039', 'KMT0000004', 'USR0000009', 1);
insert into user_komunitas values('USR0000041', 'KMT0000001', 'USR0000001', 1);
insert into user_komunitas values('USR0000042', 'KMT0000002', 'USR0000002', 1);
insert into user_komunitas values('USR0000043', 'KMT0000003', 'USR0000003', 1);
insert into user_komunitas values('USR0000044', 'KMT0000004', 'USR0000004', 1);
insert into user_komunitas values('USR0000046', 'KMT0000001', 'USR0000006', 1);
insert into user_komunitas values('USR0000047', 'KMT0000002', 'USR0000007', 1);
insert into user_komunitas values('USR0000048', 'KMT0000003', 'USR0000008', 1);
insert into user_komunitas values('USR0000049', 'KMT0000004', 'USR0000009', 1);


-- insert into komunitas values('KMT0000001', 'TCyber', 'Komunitas sekuritas');
-- insert into komunitas values('KMT0000002', 'Android', 'Komunitas development aplikasi untuk Android');
-- insert into komunitas values('KMT0000003', 'Gamedev', 'Komunitas development game');
-- insert into komunitas values('KMT0000004', 'CP', 'Komunitas competitive programming');

-- insert into user_komunitas values('USR0000003', 'KMT0000003', 'USR0000000', 2);
-- insert into user_komunitas values('USR0000004', 'KMT0000004', 'USR0000000', 2);

-- INI KERJAIN --

-- PENGUMUMAN
insert into pengumuman(
   kmt_id, 
   usr_id, 
   png_nama, 
   png_konten, 
   png_tgltampil, 
   png_tglselesai
) values(
   'KMT0000003', 
   'USR0000003', 
   'Welcome Party GD', 
   'Selamat datang di komunitas Gamedev. Ayo kumpul. Tanggal 27 September 2019.', 
   to_date('20/09/2019','dd/mm/yyyy'), 
   to_date('27/09/2019','dd/mm/yyyy')
);

insert into pengumuman(
   kmt_id, 
   usr_id, 
   png_nama, 
   png_konten, 
   png_tgltampil, 
   png_tglselesai
) values(
   'KMT0000003', 
   'USR0000003', 
   'Game Jam', 
   'Selesaikan modul pengenalan kalian dan bikin game!', 
   to_date('27/09/2019','dd/mm/yyyy'), 
   to_date('30/09/2019','dd/mm/yyyy')
);

insert into pengumuman(
   kmt_id, 
   usr_id, 
   png_nama, 
   png_konten, 
   png_tgltampil, 
   png_tglselesai
) values(
   'KMT0000004', 
   'USR0000004', 
   'Welcome Party CP', 
   'Selamat datang di komunitas CP. Ayo kumpul. Tanggal 27 September 2019.', 
   to_date('20/09/2019','dd/mm/yyyy'), 
   to_date('27/09/2019','dd/mm/yyyy')
);

insert into pengumuman(
   kmt_id, 
   usr_id, 
   png_nama, 
   png_konten, 
   png_tgltampil, 
   png_tglselesai
) values(
   'KMT0000004', 
   'USR0000004', 
   'Code Gym', 
   'Selesaikan modul pengenalan kalian dan koding bareng!', 
   to_date('27/09/2019','dd/mm/yyyy'), 
   to_date('30/09/2019','dd/mm/yyyy')
);

-- MODUL
insert into modul(
   KMT_ID, 
   USR_ID, 
   MD_NAMA, 
   MD_KONTEN, 
   MD_SUBMIT
) values(
   'KMT0000003',
   'USR0000003',
   'Modul 1 Gamedev',
   'Ini modul 1 gamedev',
   '0'
);
insert into modul(
   KMT_ID, 
   USR_ID, 
   MD_NAMA, 
   MD_KONTEN, 
   MD_SUBMIT
) values(
   'KMT0000003',
   'USR0000003',
   'Modul 2 Gamedev',
   'Ini modul 2 gamedev',
   '0'
);
insert into modul(
   KMT_ID, 
   USR_ID, 
   MD_NAMA, 
   MD_KONTEN, 
   MD_SUBMIT
) values(
   'KMT0000003',
   'USR0000003',
   'Modul 3 Gamedev',
   'Ini modul 3 gamedev',
   '1'
);
insert into modul(
   KMT_ID, 
   USR_ID, 
   MD_NAMA, 
   MD_KONTEN, 
   MD_SUBMIT
) values(
   'KMT0000003',
   'USR0000003',
   'Modul 4 Gamedev',
   'Ini modul 4 gamedev',
   '0'
);
insert into modul(
   KMT_ID, 
   USR_ID, 
   MD_NAMA, 
   MD_KONTEN, 
   MD_SUBMIT
) values(
   'KMT0000003',
   'USR0000003',
   'Modul 5 Gamedev',
   'Ini modul 5 gamedev',
   '1'
);

insert into modul(
   KMT_ID, 
   USR_ID, 
   MD_NAMA, 
   MD_KONTEN, 
   MD_SUBMIT
) values(
   'KMT0000004',
   'USR0000004',
   'Modul 1 CP',
   'Ini modul 1 CP',
   '0'
);
insert into modul(
   KMT_ID, 
   USR_ID, 
   MD_NAMA, 
   MD_KONTEN, 
   MD_SUBMIT
) values(
   'KMT0000004',
   'USR0000004',
   'Modul 2 CP',
   'Ini modul 2 CP',
   '0'
);
insert into modul(
   KMT_ID, 
   USR_ID, 
   MD_NAMA, 
   MD_KONTEN, 
   MD_SUBMIT
) values(
   'KMT0000004',
   'USR0000004',
   'Modul 3 CP',
   'Ini modul 3 CP',
   '1'
);
insert into modul(
   KMT_ID, 
   USR_ID, 
   MD_NAMA, 
   MD_KONTEN, 
   MD_SUBMIT
) values(
   'KMT0000004',
   'USR0000004',
   'Modul 4 CP',
   'Ini modul 4 CP',
   '0'
);
insert into modul(
   KMT_ID, 
   USR_ID, 
   MD_NAMA, 
   MD_KONTEN, 
   MD_SUBMIT
) values(
   'KMT0000004',
   'USR0000004',
   'Modul 5 CP',
   'Ini modul 5 CP',
   '1'
);

-- POST
insert into post(
   KMT_ID, 
   USR_ID, 
   POST_JUDUL, 
   POST_KONTEN
) values(
   'KMT0000003',
   'USR0000008',
   'Game Engine Favorit',
   'Kira-kira paling bagus pake game engine apa ya?'
);
insert into post(
   KMT_ID, 
   USR_ID, 
   POST_JUDUL, 
   POST_KONTEN
) values(
   'KMT0000003',
   'USR0000003',
   'Kumpul lagi kapan?',
   'Komen ya'
);

insert into post(
   KMT_ID, 
   USR_ID, 
   POST_JUDUL, 
   POST_KONTEN
) values(
   'KMT0000004',
   'USR0000009',
   'Latihan koding online',
   'Kira-kira paling bagus di mana ya?'
);
insert into post(
   KMT_ID, 
   USR_ID, 
   POST_JUDUL, 
   POST_KONTEN
) values(
   'KMT0000004',
   'USR0000004',
   'Kumpul lagi kapan?',
   'Komen ya'
);

-- REPLY
insert into reply(
   POST_ID, 
   USR_ID, 
   RPL_KONTEN
) values(
   'POST000001',
   'USR0000033',
   'Unity bagus'
);
insert into reply(
   POST_ID, 
   USR_ID, 
   RPL_KONTEN
) values(
   'POST000001',
   'USR0000038',
   'Nggak unreal aja?'
);
insert into reply(
   POST_ID, 
   USR_ID, 
   RPL_KONTEN
) values(
   'POST000001',
   'USR0000043',
   'Tergantung kebutuhan sih'
);
insert into reply(
   POST_ID, 
   USR_ID, 
   RPL_KONTEN
) values(
   'POST000002',
   'USR0000033',
   'Bebas'
);
insert into reply(
   POST_ID, 
   USR_ID, 
   RPL_KONTEN
) values(
   'POST000002',
   'USR0000038',
   'Bebas'
);
insert into reply(
   POST_ID, 
   USR_ID, 
   RPL_KONTEN
) values(
   'POST000002',
   'USR0000043',
   'Bebas'
);

insert into reply(
   POST_ID, 
   USR_ID, 
   RPL_KONTEN
) values(
   'POST000003',
   'USR0000019',
   'Unity bagus'
);
insert into reply(
   POST_ID, 
   USR_ID, 
   RPL_KONTEN
) values(
   'POST000003',
   'USR0000024',
   'Nggak unreal aja?'
);
insert into reply(
   POST_ID, 
   USR_ID, 
   RPL_KONTEN
) values(
   'POST000003',
   'USR0000029',
   'Tergantung kebutuhan sih'
);
insert into reply(
   POST_ID, 
   USR_ID, 
   RPL_KONTEN
) values(
   'POST000004',
   'USR0000019',
   'Bebas'
);
insert into reply(
   POST_ID, 
   USR_ID, 
   RPL_KONTEN
) values(
   'POST000004',
   'USR0000024',
   'Bebas'
);
insert into reply(
   POST_ID, 
   USR_ID, 
   RPL_KONTEN
) values(
   'POST000004',
   'USR0000029',
   'Bebas'
);

insert into syarat(
   MD_ID,
   MOD_MD_ID
) values(

);

-- EDIT NTAR NUNGGU MODUL --
insert into users_modul(
   md_id, 
   usr_id, 
   submission, 
   status_selesai
) values(
   '', 
   '', 
   '', 
   ''
);
