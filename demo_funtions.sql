-- bisa ikut modul by anggota || return 1
DECLARE
  USR_ID_IN CHAR(10);
  MD_ID_IN CHAR(10);
  v_Return NUMBER;
BEGIN
  USR_ID_IN := 'USR0000050';
  MD_ID_IN := 'MD00000001';

  v_Return := BISA_IKUT_MODUL(
    USR_ID_IN => USR_ID_IN,
    MD_ID_IN => MD_ID_IN
  );
  DBMS_OUTPUT.PUT_LINE('v_Return = ' || v_Return);
END;

-- bisa ikut modul by anggota || return 0
DECLARE
  USR_ID_IN CHAR(10);
  MD_ID_IN CHAR(10);
  v_Return NUMBER;
BEGIN
  USR_ID_IN := 'USR0000050';
  MD_ID_IN := 'MD00000006';

  v_Return := BISA_IKUT_MODUL(
    USR_ID_IN => USR_ID_IN,
    MD_ID_IN => MD_ID_IN
  );
  DBMS_OUTPUT.PUT_LINE('v_Return = ' || v_Return);
END;

-- bisa ikut modul by syarat || return 1
DECLARE
  USR_ID_IN CHAR(10);
  MD_ID_IN CHAR(10);
  v_Return NUMBER;
BEGIN
  USR_ID_IN := 'USR0000050';
  MD_ID_IN := 'MD00000001';

  v_Return := BOLEH_IKUT_MODUL(
    USR_ID_IN => USR_ID_IN,
    MD_ID_IN => MD_ID_IN
  );
  DBMS_OUTPUT.PUT_LINE('v_Return = ' || v_Return);
END;

-- bisa ikut modul by syarat || return 0
DECLARE
  USR_ID_IN CHAR(10);
  MD_ID_IN CHAR(10);
  v_Return NUMBER;
BEGIN
  USR_ID_IN := 'USR0000050';
  MD_ID_IN := 'MD00000001';

  v_Return := BOLEH_IKUT_MODUL(
    USR_ID_IN => USR_ID_IN,
    MD_ID_IN => MD_ID_IN
  );
  DBMS_OUTPUT.PUT_LINE('v_Return = ' || v_Return);
END;

-- is admin || return 1
DECLARE
  USR_ID_IN CHAR(10);
  KMT_ID_IN CHAR(10);
  v_Return NUMBER;
BEGIN
  USR_ID_IN := 'USR0000001';
  KMT_ID_IN := 'KMT0000001';

  v_Return := IS_ADMIN(
    USR_ID_IN => USR_ID_IN,
    KMT_ID_IN => KMT_ID_IN
  );
  DBMS_OUTPUT.PUT_LINE('v_Return = ' || v_Return);
END;

-- is admin || return 0
DECLARE
  USR_ID_IN CHAR(10);
  KMT_ID_IN CHAR(10);
  v_Return NUMBER;
BEGIN
  USR_ID_IN := 'USR0000011';
  KMT_ID_IN := 'KMT0000001';

  v_Return := IS_ADMIN(
    USR_ID_IN => USR_ID_IN,
    KMT_ID_IN => KMT_ID_IN
  );
  DBMS_OUTPUT.PUT_LINE('v_Return = ' || v_Return);
END;

