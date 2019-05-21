-- Cek jika user bisa mengikuti suatu modul

CREATE OR REPLACE FUNCTION bisa_ikut_modul(usr_id_in IN char, md_id_in IN char)
RETURN SMALLINT
IS boleh INT;
BEGIN
    SELECT CT INTO boleh FROM (
        SELECT STATUS_SELESAI, COUNT(STATUS_SELESAI) AS CT FROM USER_MODUL
        WHERE USR_ID = usr_id_in GROUP BY STATUS_SELESAI HAVING STATUS_SELESAI = '0'
    );
    IF boleh > 0 THEN RETURN 0;
    ELSE RETURN 1;
    END IF;
END bisa_ikut_modul;

-- Cek jika user merupakan admin dari sebuah komunitas (argumen: USR_ID, KMT_ID) (return: true/false)

CREATE OR REPLACE FUNCTION is_admin(usr_id_in IN char, kmt_id_in IN char)
RETURN SMALLINT
IS administrator INT;
BEGIN
    SELECT STATUS INTO administrator FROM (
        SELECT STATUS FROM USER_KOMUNITAS
        WHERE USR_ID = usr_id_in AND KMT_ID = kmt_id_in
    );
    IF administrator = 2 THEN RETURN 1;
    ELSE RETURN 0;
    END IF;
END is_admin;

-- Cek jika user bisa mengikuti sebuah modul berdasarkan keanggotaan (argumen: USR_ID, MD_ID) (return: true/false)

CREATE OR REPLACE FUNCTION bisa_ikut_modul_2(usr_id_in IN char, md_id_in IN char)
RETURN SMALLINT
IS boleh INT;
BEGIN
    SELECT CT INTO boleh FROM (
        SELECT count(MODUL.MD_ID) AS CT FROM MODUL join USER_KOMUNITAS on MODUL.KMT_ID = USER_KOMUNITAS.KMT_ID
        WHERE USER_KOMUNITAS.USR_ID = usr_id_in AND MODUL.MD_ID = md_id_in
    );
    IF boleh > 0 THEN RETURN 1;
    ELSE RETURN 0;
    END IF;
END bisa_ikut_modul_2;