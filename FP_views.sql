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
        komunitas.kmt_nama = 'TCyber';

-- Daftar jumlah modul yang bisa dikerjakan oleh setiap anggota komunitas (usr_id | count(md) )
    CREATE OR REPLACE VIEW "JML_MODUL_BLM_SELESAI_TCYBER" ("USR_NAMA", "JML") AS 
    SELECT
        users.usr_nama,
        (
          select
            count(md_id)
          from
            modul
          where
            modul.kmt_id = komunitas.kmt_id
        )-(
          select
            count(status_selesai) as jml
          from
            user_modul
          where
            user_modul.usr_id=users.usr_id
            and status_selesai=1
        ) as jml
    FROM
        users
        join user_komunitas on user_komunitas.usr_id = users.usr_id
        join komunitas on user_komunitas.kmt_id = komunitas.kmt_id
    WHERE
        komunitas.kmt_nama = 'TCyber';

-- Daftar Jumlah modul yang sudah dikerjakan oleh setiap anggota komunitas (usr_id | count(md )
    CREATE OR REPLACE VIEW Jumlah_Modul_Selesai_Tcyber AS
    SELECT
        users.usr_nama,
        (select
          count(status_selesai) as jml
        from
          user_modul
        where
          user_modul.usr_id=users.usr_id) as jml
    FROM
        users
        join user_komunitas on user_komunitas.usr_id = users.usr_id
        join komunitas on user_komunitas.kmt_id = komunitas.kmt_id
    WHERE
        komunitas.kmt_nama = 'TCyber'
-- Daftar user dari suatu komunitas (usr_id | usr_nama)
    CREATE OR REPLACE VIEW Anggota_TCyber AS
    SELECT
        users.usr_id, users.usr_nama
    FROM
        users
        join user_komunitas on user_komunitas.usr_id = users.usr_id
        join komunitas on komunitas.kmt_id = user_komunitas.kmt_id
    WHERE
        komunitas.kmt_nama = 'TCyber';
-- Jumlah anggota dari tiap-tiap komunitas (kmt_id | count(usr))
    CREATE OR REPLACE VIEW Jumlah_Anggota_Per_Komunitas AS
    SELECT
        komunitas.kmt_nama AS komunitas, count(users.usr_id) AS jumlah_anggota
    FROM
        users
        join user_komunitas on user_komunitas.usr_id = users.usr_id
        join komunitas on user_komunitas.kmt_id = komunitas.kmt_id
    GROUP BY
        komunitas.kmt_nama;
-- Jumlah modul dari tiap-tiap komunitas (kmt_id | count(md))
    CREATE OR REPLACE VIEW Jumlah_Modul_Per_Komunitas AS
    SELECT
        komunitas.kmt_nama AS komunitas, count(modul.md_id) AS jumlah_modul
    FROM
        modul
        join komunitas on komunitas.kmt_id = modul.kmt_id
    GROUP BY
        komunitas.kmt_nama;