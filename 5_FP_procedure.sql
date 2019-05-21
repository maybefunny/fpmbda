-- Mendaftarkan user ke komunitas (argumen: USR_ID, KMT_ID)

CREATE OR REPLACE PROCEDURE daftar(USRID IN CHAR, KMTID IN CHAR)
AS
BEGIN
INSERT INTO USER_KOMUNITAS VALUES(
    USRID,
    KMTID,
    NULL,
    '0'
);
END;

-- Admin menerima/menolak permintaan bergabung komunitas dari user (argument : USR_ID, KMT_ID, ADM_USR_ID, STATUS)

CREATE OR REPLACE PROCEDURE respond_request(USRID IN CHAR, KMTID IN CHAR, ADMUSRID IN CHAR, "STATUS" IN SMALLINT)
AS
BEGIN
FOR x IN (
    SELECT COUNT(*) cnt FROM DUAL
    WHERE EXISTS (
        SELECT USR_ID FROM USER_KOMUNITAS
        WHERE "STATUS" = 2
        AND USR_ID = ADMUSRID
        AND KMT_ID = KMTID
    )
)
LOOP
IF (x.cnt = 1) THEN
UPDATE USER_KOMUNITAS
SET "STATUS" = '1'
WHERE USR_ID = USRID
AND KMT_ID = KMTID;

ELSE dbms_output.put_line('User bukan merupakan admin dari komunitas.');
END IF;
END LOOP;

END;

-- Mengikuti modul (argumen: USR_ID, MD_ID, SUBMISSION)

CREATE OR REPLACE PROCEDURE enroll(USRID IN CHAR, MDID IN CHAR, SUBMISSION IN SMALLINT)
AS
BEGIN
IF bisa_ikut_modul(USRID, MDID) = '1' AND boleh_ikut_modul(USRID, MDID) = '1' THEN
INSERT INTO USER_MODUL VALUES (
    USRID,
    MDID,
    SUBMISSION,
    '0'
);
ELSE dbms_output.put_line('Tidak dapat mengikuti modul ini');
END IF;
END;

CREATE OR REPLACE PROCEDURE finish(USRID IN CHAR, MDID IN CHAR)
AS
BEGIN
UPDATE USER_MODUL
SET STATUS_SELESAI = '1'
WHERE USR_ID = USRID AND MD_ID = MDID;
END;