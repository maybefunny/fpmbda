-- Cek jika user bisa mengikuti suatu modul berdasarkan syarat

CREATE OR REPLACE FUNCTION boleh_ikut_modul(usr_id_in IN char, md_id_in IN char)
RETURN SMALLINT
IS 
    req INT;
    rel INT;
BEGIN
    SELECT COUNT(MD_ID) INTO req FROM SYARAT
    WHERE MD_ID = md_id_in;

    SELECT COUNT(MD_ID) INTO rel FROM USER_MODUL
    WHERE USR_ID = usr_id_in AND MD_ID IN (
        SELECT MOD_MD_ID FROM SYARAT
        WHERE MD_ID = md_id_in
    );

    IF req = rel THEN RETURN 1;
    ELSE RETURN 0;
    END IF;
END;

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
END;

-- Cek jika user bisa mengikuti sebuah modul berdasarkan keanggotaan (argumen: USR_ID, MD_ID) (return: true/false)

CREATE OR REPLACE FUNCTION bisa_ikut_modul(usr_id_in IN char, md_id_in IN char)
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
END;
