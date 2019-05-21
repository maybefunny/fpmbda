-- log modul
    CREATE TRIGGER log_update_modul AFTER UPDATE on MODUL
    FOR EACH ROW
    BEGIN
        IF (:NEW.MD_KONTEN != :OLD.MD_KONTEN) THEN
            INSERT INTO data_tracking 
                (data_id , field , old_value , new_value , modified ) 
            VALUES 
                (:NEW.MD_ID, 'MD_KONTEN', :OLD.MD_KONTEN, :NEW.MD_KONTEN, SYSTIMESTAMP);
        END IF;
        IF (:NEW.MD_NAMA != :OLD.MD_NAMA) THEN
            INSERT INTO data_tracking 
                (data_id , field , old_value , new_value , modified ) 
            VALUES 
                (:NEW.MD_ID, 'MD_NAMA', :OLD.MD_NAMA, :NEW.MD_NAMA, SYSTIMESTAMP);
        END IF;
    END;
-- log users
    CREATE TRIGGER log_update_user AFTER UPDATE on USERS
    FOR EACH ROW
    BEGIN
        IF (:NEW.USR_EMAIL != :OLD.USR_EMAIL) THEN
            INSERT INTO data_tracking 
                (data_id , field , old_value , new_value , modified ) 
            VALUES 
                (:NEW.USR_ID, 'USR_EMAIL', :OLD.USR_EMAIL, :NEW.USR_EMAIL, SYSTIMESTAMP);
        END IF;
    END;
-- log komunitas
    CREATE TRIGGER log_update_komunitas AFTER UPDATE on KOMUNITAS
    FOR EACH ROW
    BEGIN
        IF (:NEW.KMT_DESKRIPSI != :OLD.KMT_DESKRIPSI) THEN
            INSERT INTO data_tracking 
                (data_id , field , old_value , new_value , modified ) 
            VALUES 
                (:NEW.KMT_ID, 'KMT_DESKRIPSI', :OLD.KMT_DESKRIPSI, :NEW.KMT_DESKRIPSI, SYSTIMESTAMP);
        END IF;
    END;
-- log pengumuman
    CREATE TRIGGER log_update_pengumuman AFTER UPDATE on PENGUMUMAN
    FOR EACH ROW
    BEGIN
        IF (:NEW.PNG_KONTEN != :OLD.PNG_KONTEN) THEN
            INSERT INTO data_tracking 
                (data_id , field , old_value , new_value , modified ) 
            VALUES 
                (:NEW.PNG_ID, 'PNG_KONTEN', :OLD.PNG_KONTEN, :NEW.PNG_KONTEN, SYSTIMESTAMP);
        END IF;
    END;