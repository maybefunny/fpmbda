/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     15-May-19 11:42:56                           */
/*==============================================================*/

-- Daftar modul yang ada pada suatu komunitas (md_id | md_nama)
    CREATE OR REPLACE VIEW Modul_TCyber AS
    SELECT
        md_id, md_nama
    FROM
        modul
        join komunitas on modul.kmt_id = komunitas.kmt_id
    WHERE
        komunitas.kmt_nama='TCyber';

-- Daftar jumlah modul yang bisa dikerjakan oleh setiap anggota komunitas (usr_id | count(md) )
-- Daftar Jumlah modul yang sudah dikerjakan oleh setiap anggota komunitas (md_id | coutn(md )
-- Daftar user dari suatu komunitas (usr_id | usr_nama)
    CREATE OR REPLACE VIEW Anggota_TCyber AS
    SELECT
        users.usr_id, users.usr_nama
    FROM
        users
        join user_komunitas on user_komunitas.usr_id = users.usr_id;
        join komunitas on komunitas.kmt_id = komunitas.kmt_id;
    WHERE
        komunitas.kmt_nama = 'TCyber';
-- Jumlah anggota dari tiap-tiap komunitas (kmt_id | count(usr))
    CREATE OR REPLACE VIEW Jumlah_Anggota_Komunitas AS
    SELECT
        komunitas.kmt_nama, count(users.usr_id)
    FROM
        users
        join user_komunitas on user_komunitas.usr_id = users.usr_id
        join 
-- Jumlah modul dari tiap-tiap komunitas (kmt_id | count(md))