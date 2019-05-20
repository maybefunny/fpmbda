-- Cek jika user bisa mengikuti suatu modul

CREATE OR REPLACE FUNCTION bisa_ikut_modul(usr_id_in IN char, md_id_in IN char)
RETURN SMALLINT
IS boleh INT;
BEGIN
    SELECT CT INTO boleh FROM (
        SELECT STATUS_SELESAI, COUNT(STATUS_SELESAI) AS CT FROM USER_MODUL
        WHERE USR_ID = 'USR0000001' GROUP BY STATUS_SELESAI HAVING STATUS_SELESAI = '0'
    );
    IF boleh > 0 THEN RETURN 0;
    ELSE RETURN 1;
    END IF;
END bisa_ikut_modul;
