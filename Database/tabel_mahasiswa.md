# Format Tabel Mahasiswa

| FIELD         | TYPE    | LENGTH | NULL | ATTRIBUTES                          | NOTES                |
|---------------|---------|--------|------|-------------------------------------|----------------------|
| id            | INT     | 4      | NO   | UNSIGNED PRIMARY KEY AUTO_INCREMENT |                      |
| nama          | VARCHAR | 50     | NO   |                                     |                      |
| nrp           | VARCHAR | 10     | NO   |                                     |                      |
| tanggal_lahir | DATE    |        | NO   |                                     | format: 'YYYY-MM-DD' |
| kota_domisili | VARCHAR | 20     | YES  |                                     |                      |
| nomor_hp      | VARCHAR | 15     | YES  |                                     |                      |

  
&nbsp; 
#### BASIC QUERIES
- Creation
  ```sql
  CREATE TABLE Mahasiswa (
    id INT(4) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(50) NOT NULL,
    nrp VARCHAR(10) NOT NULL,
    tanggal_lahir DATE NOT NULL,
    kota_domisili VARCHAR(20) DEFAULT "Surabaya",
    nomor_hp VARCHAR(20) DEFAULT NULL
  );
  ```
- Insertion (minimum insert nama, nrp, tanggal lahir)
  ```sql
  INSERT INTO Mahasiswa 
    (nama, nrp, tanggal_lahir) 
  VALUES 
    ("John Doe", "5103018999", "1990-12-01");
  ```
- Insert multiple rows
  ```sql
  INSERT INTO Mahasiswa
    (nama, nrp, tanggal_lahir)
  VALUES
    ("Mahasiswa1", "5103019001", "1999-01-01"),
    ("Mahasiswa2", "5103019002", "1999-01-02"),
    ("Mahasiswa3", "5103019003", "1999-01-03"),
    ("Mahasiswa4", "5103019004", "1999-01-04");
    
  ```
- Query Show Data (all)
  ```sql
  SELECT * FROM <nama_tabel>;
  SELECT * FROM Mahasiswa;
  ```
- Query show data that match (exact match)
  ```sql
  SELECT * FROM <nama_tabel> WHERE nama="sesuatu"
  SELECT * FROM Mahasiswa WHERE nama="John Doe"
  ```
- Deletion with condition (exact match)
  ```sql
  DELETE FROM Mahasiswa WHERE <kolom>="sesuatu";
  DELETE FROM Mahasiswa WHERE nama="John Doe";
  ```
- Deletion all records on Table (***WARNING***)
  ```sql
  DELETE FROM <table_name>;
  DELETE FROM Mahasiswa;
  ```
