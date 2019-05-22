-- LOG komunitas
UPDATE komunitas SET kmt_deskripsi = 'pesan 1' where kmt_id = 'KMT0000001';

-- LOG modul
UPDATE modul SET md_konten = 'pesan 2' where md_id = 'MD00000001';
UPDATE modul SET md_nama = 'pesan 3' where md_id = 'MD00000001';

-- LOG pengumuman
UPDATE pengumuman SET png_konten = 'pesan 4' where png_id = 'PNG0000001';

-- LOG user
UPDATE users SET usr_email = 'pesan 5' where usr_id = 'USR0000001';

