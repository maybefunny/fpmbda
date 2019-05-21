/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     15-May-19 11:42:56                           */
/*==============================================================*/


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
    IF :new.PNG_ID IS NULL THEN
    :new.PNG_ID := 'PNG' || to_char(lpad(pengumuman_next_val,7,'0'));
    END IF;
END pengumuman_sequence;

/*==============================================================*/
/*                          END Sequence                        */
/*==============================================================*/

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
    IF :new.MD_ID IS NULL THEN
    :new.MD_ID := 'MD' || to_char(lpad(modul_next_val,8,'0'));
    END IF;
END modul_sequence;

/*==============================================================*/
/*                          END Sequence                        */
/*==============================================================*/

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
    IF :new.POST_ID IS NULL THEN
    :new.POST_ID := 'POST' || to_char(lpad(post_next_val,6,'0'));
    END IF;
END post_sequence;

/*==============================================================*/
/*                          END Sequence                        */
/*==============================================================*/

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
    IF :new.RPL_ID IS NULL THEN
    :new.RPL_ID := 'RPL' || to_char(lpad(reply_next_val,7,'0'));
    END IF;
END reply_sequence;

/*==============================================================*/
/*                          END Sequence                        */
/*==============================================================*/

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
    IF :new.KMT_ID IS NULL THEN
    :new.KMT_ID := 'KMT' || to_char(lpad(kmt_next_val,7,'0'));
    END IF;
END kmt_sequence;

/*==============================================================*/
/*                          END Sequence                        */
/*==============================================================*/

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
    IF :new.USR_ID IS NULL THEN
    :new.USR_ID := 'USR' || to_char(lpad(usr_next_val,7,'0'));
    END IF;
END usr_sequence;

/*==============================================================*/
/*                          END Sequence                        */
/*==============================================================*/