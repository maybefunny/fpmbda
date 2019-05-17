/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     17-May-19 10:20:03                           */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_MODUL_REFERENCE_USER') then
    alter table MODUL
       delete foreign key FK_MODUL_REFERENCE_USER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MODUL_REFERENCE_KOMUNITA') then
    alter table MODUL
       delete foreign key FK_MODUL_REFERENCE_KOMUNITA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PENGUMUM_REFERENCE_USER') then
    alter table PENGUMUMAN
       delete foreign key FK_PENGUMUM_REFERENCE_USER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PENGUMUM_REFERENCE_KOMUNITA') then
    alter table PENGUMUMAN
       delete foreign key FK_PENGUMUM_REFERENCE_KOMUNITA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POST_REFERENCE_KOMUNITA') then
    alter table POST
       delete foreign key FK_POST_REFERENCE_KOMUNITA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POST_REFERENCE_USER') then
    alter table POST
       delete foreign key FK_POST_REFERENCE_USER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_REPLY_REFERENCE_POST') then
    alter table REPLY
       delete foreign key FK_REPLY_REFERENCE_POST
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_REPLY_REFERENCE_USER') then
    alter table REPLY
       delete foreign key FK_REPLY_REFERENCE_USER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SYARAT_REFERENCE_MODUL_MOD') then
    alter table SYARAT
       delete foreign key FK_SYARAT_REFERENCE_MODUL_MOD
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SYARAT_REFERENCE_MODUL') then
    alter table SYARAT
       delete foreign key FK_SYARAT_REFERENCE_MODUL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_USER_KOM_REFERENCE_USER') then
    alter table USER_KOMUNITAS
       delete foreign key FK_USER_KOM_REFERENCE_USER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_USER_KOM_REFERENCE_KOMUNITA') then
    alter table USER_KOMUNITAS
       delete foreign key FK_USER_KOM_REFERENCE_KOMUNITA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_USER_KOM_REFERENCE_USER_ADM') then
    alter table USER_KOMUNITAS
       delete foreign key FK_USER_KOM_REFERENCE_USER_ADM
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_USER_MOD_REFERENCE_USER') then
    alter table USER_MODUL
       delete foreign key FK_USER_MOD_REFERENCE_USER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_USER_MOD_REFERENCE_MODUL') then
    alter table USER_MODUL
       delete foreign key FK_USER_MOD_REFERENCE_MODUL
end if;

drop table if exists KOMUNITAS;

drop table if exists MODUL;

drop table if exists PENGUMUMAN;

drop table if exists POST;

drop table if exists REPLY;

drop table if exists SYARAT;

drop table if exists "USER";

drop table if exists USER_KOMUNITAS;

drop table if exists USER_MODUL;

/*==============================================================*/
/* Table: KOMUNITAS                                             */
/*==============================================================*/
create table KOMUNITAS 
(
   KMT_ID               char(10)                       not null,
   KMT_NAMA             varchar(20)                    null,
   KMT_DESKRIPSI        varchar(200)                   null,
   constraint PK_KOMUNITAS primary key clustered (KMT_ID)
);

/*==============================================================*/
/* Table: MODUL                                                 */
/*==============================================================*/
create table MODUL 
(
   MD_ID                char(10)                       not null,
   KMT_ID               char(10)                       null,
   USR_ID               char(10)                       null,
   MD_NAMA              varchar(20)                    null,
   MD_KONTEN            text                           null,
   MD_SUBMIT            smallint                       null,
   constraint PK_MODUL primary key clustered (MD_ID)
);

/*==============================================================*/
/* Table: PENGUMUMAN                                            */
/*==============================================================*/
create table PENGUMUMAN 
(
   PNG_ID               char(10)                       not null,
   KMT_ID               char(10)                       null,
   USR_ID               char(10)                       null,
   PNG_NAMA             varchar(200)                   not null,
   PNG_KONTEN           text                           not null,
   PNG_TGLTAMPIL        date                           not null,
   PNG_TGLSELESAI       date                           not null,
   constraint PK_PENGUMUMAN primary key clustered (PNG_ID)
);

/*==============================================================*/
/* Table: POST                                                  */
/*==============================================================*/
create table POST 
(
   POST_ID              char(10)                       not null,
   KMT_ID               char(10)                       null,
   USR_ID               char(10)                       null,
   POST_JUDUL           varchar(150)                   null,
   POST_KONTEN          text                           null,
   constraint PK_POST primary key clustered (POST_ID)
);

/*==============================================================*/
/* Table: REPLY                                                 */
/*==============================================================*/
create table REPLY 
(
   RPL_ID               char(10)                       not null,
   POST_ID              char(10)                       null,
   USR_ID               char(10)                       null,
   RPL_KONTEN           text                           null,
   constraint PK_REPLY primary key clustered (RPL_ID)
);

/*==============================================================*/
/* Table: SYARAT                                                */
/*==============================================================*/
create table SYARAT 
(
   MD_ID                char(10)                       not null,
   MOD_MD_ID            char(10)                       not null,
   constraint PK_SYARAT primary key clustered (MD_ID, MOD_MD_ID)
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" 
(
   USR_ID               char(10)                       not null,
   USR_NRP              char(15)                       not null,
   USR_NAMA             varchar(20)                    not null,
   USR_EMAIL            varchar(100)                   not null,
   constraint PK_USER primary key clustered (USR_ID)
);

/*==============================================================*/
/* Table: USER_KOMUNITAS                                        */
/*==============================================================*/
create table USER_KOMUNITAS 
(
   USR_ID               char(10)                       not null,
   KMT_ID               char(10)                       not null,
   ADM_USR_ID           char(10)                       null,
   STATUS               smallint                       null,
   constraint PK_USER_KOMUNITAS primary key clustered (USR_ID, KMT_ID)
);

/*==============================================================*/
/* Table: USER_MODUL                                            */
/*==============================================================*/
create table USER_MODUL 
(
   USR_ID               char(10)                       not null,
   MD_ID                char(10)                       not null,
   SUBMISSION           smallint                       null,
   STATUS_SELESAI       boolean                        null,
   constraint PK_USER_MODUL primary key clustered (USR_ID, MD_ID)
);

alter table MODUL
   add constraint FK_MODUL_REFERENCE_USER foreign key (USR_ID)
      references "USER" (USR_ID)
      on update restrict
      on delete restrict;

alter table MODUL
   add constraint FK_MODUL_REFERENCE_KOMUNITA foreign key (KMT_ID)
      references KOMUNITAS (KMT_ID)
      on update restrict
      on delete restrict;

alter table PENGUMUMAN
   add constraint FK_PENGUMUM_REFERENCE_USER foreign key (USR_ID)
      references "USER" (USR_ID)
      on update restrict
      on delete restrict;

alter table PENGUMUMAN
   add constraint FK_PENGUMUM_REFERENCE_KOMUNITA foreign key (KMT_ID)
      references KOMUNITAS (KMT_ID)
      on update restrict
      on delete restrict;

alter table POST
   add constraint FK_POST_REFERENCE_KOMUNITA foreign key (KMT_ID)
      references KOMUNITAS (KMT_ID)
      on update restrict
      on delete restrict;

alter table POST
   add constraint FK_POST_REFERENCE_USER foreign key (USR_ID)
      references "USER" (USR_ID)
      on update restrict
      on delete restrict;

alter table REPLY
   add constraint FK_REPLY_REFERENCE_POST foreign key (POST_ID)
      references POST (POST_ID)
      on update restrict
      on delete restrict;

alter table REPLY
   add constraint FK_REPLY_REFERENCE_USER foreign key (USR_ID)
      references "USER" (USR_ID)
      on update restrict
      on delete restrict;

alter table SYARAT
   add constraint FK_SYARAT_REFERENCE_MODUL_MOD foreign key (MOD_MD_ID)
      references MODUL (MD_ID)
      on update restrict
      on delete restrict;

alter table SYARAT
   add constraint FK_SYARAT_REFERENCE_MODUL foreign key (MD_ID)
      references MODUL (MD_ID)
      on update restrict
      on delete restrict;

alter table USER_KOMUNITAS
   add constraint FK_USER_KOM_REFERENCE_USER foreign key (USR_ID)
      references "USER" (USR_ID)
      on update restrict
      on delete restrict;

alter table USER_KOMUNITAS
   add constraint FK_USER_KOM_REFERENCE_KOMUNITA foreign key (KMT_ID)
      references KOMUNITAS (KMT_ID)
      on update restrict
      on delete restrict;

alter table USER_KOMUNITAS
   add constraint FK_USER_KOM_REFERENCE_USER_ADM foreign key (ADM_USR_ID)
      references "USER" (USR_ID)
      on update restrict
      on delete restrict;

alter table USER_MODUL
   add constraint FK_USER_MOD_REFERENCE_USER foreign key (USR_ID)
      references "USER" (USR_ID)
      on update restrict
      on delete restrict;

alter table USER_MODUL
   add constraint FK_USER_MOD_REFERENCE_MODUL foreign key (MD_ID)
      references MODUL (MD_ID)
      on update restrict
      on delete restrict;

