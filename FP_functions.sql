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

-- Cek jika user bisa mengikuti suatu modul berdasarkan keanggotaan

CREATE OR REPLACE FUNCTION bisa_ikut_modul(usr id in IN CHAR, md_id_in IN CHAR)
RETURN SMALLINT
IS 
    boleh INT;
    md_kmt_id CHAR(10);
    usr_kmt_id CHAR(10);
BEGIN
    SELECT KMT_ID INTO md_kmt_id FROM MODUL
    WHERE MD_ID = md_id_in;
    SELECT KMT_ID INTO usr_kmt_id FROM USER_MODUL
    WHERE usr_modul = usr_modul_in;
    IF md_kmt_id = usr_kmt_id THEN
    RETURN 1;
    ELSE RETURN 0;
    END IF;
END;