START TRANSACTION;

-- For clean start
DROP TABLE IF EXISTS `pengobatan`;
DROP TABLE IF EXISTS `riwayat_kesehatan`;
DROP TABLE IF EXISTS `jenis_obat`;
DROP TABLE IF EXISTS `kamar`;
DROP TABLE IF EXISTS `pasien`;
DROP TABLE IF EXISTS `dokter`;
DROP TABLE IF EXISTS `departemen`;


-- Tabel dokter
CREATE TABLE IF NOT EXISTS `dokter` (
    `id_dokter`     INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `nama`          VARCHAR(50) UNIQUE NOT NULL,
    `alamat`        VARCHAR(100) NOT NULL,
    `kota`          VARCHAR(50) NOT NULL,
    `id_pengenal`   VARCHAR(100) DEFAULT "KTP",
    `keahlian`      VARCHAR(50) NOT NULL,

    CONSTRAINT `pk_id_dokter` PRIMARY KEY (`id_dokter`)
);

-- Tabel Pasien
CREATE TABLE IF NOT EXISTS `pasien` (
    `id_pasien`     INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `nama`          VARCHAR(100) UNIQUE NOT NULL,
    `alamat`        VARCHAR(100) NOT NULL,
    `kota`          VARCHAR(100) DEFAULT NULL,
    `kota_lahir`    VARCHAR(50) NOT NULL,
    `tgl_lahir`     DATE NOT NULL,
    `id_pengenal`   VARCHAR(50) DEFAULT "KTP",
    
    CONSTRAINT `pk_id_pasien` PRIMARY KEY (`id_pasien`)
);

-- Tabel kamar
CREATE TABLE IF NOT EXISTS `kamar` (
    `id_ruang`      INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `nama_ruang`    VARCHAR(100) UNIQUE NOT NULL,
    `kapasitas`     INT(2) UNSIGNED NOT NULL,

    CONSTRAINT `pk_id_ruang` PRIMARY KEY (`id_ruang`)
);

-- Tabel Departemen
CREATE TABLE IF NOT EXISTS `departemen` (
    `id_departemen`     INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `nama`              VARCHAR(100) UNIQUE NOT NULL,
    `penanggung_jawab`  VARCHAR(100) NOT NULL,
    `jum_dokter`        INT(3) UNSIGNED DEFAULT 1,

    CONSTRAINT `pk_id_departemen` PRIMARY KEY (`id_departemen`)
);

-- Tabel jenis obat
CREATE TABLE IF NOT EXISTS `jenis_obat` (
    `id_obat`		INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `nama`          VARCHAR(100) NOT NULL,
    `stock`         INT(3) UNSIGNED DEFAULT 0,

    CONSTRAINT `pk_id_obat` PRIMARY KEY (`id_obat`)
);

-- Tabel riwayat kesehatan
CREATE TABLE IF NOT EXISTS `riwayat_kesehatan` (
    `id_riwayat`        INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `id_pasien`         INT(3) UNSIGNED NOT NULL,
    `id_dokter`         INT(3) UNSIGNED NOT NULL,
    `id_ruang`          INT(3) UNSIGNED NOT NULL,

    `tgl_mulai_rawat`   DATETIME DEFAULT CURRENT_TIMESTAMP,
    `tgl_selesai_rawat` DATETIME,

    `keterangan`        VARCHAR(100) DEFAULT "-",

    CONSTRAINT `pk_id_riwayat` PRIMARY KEY (`id_riwayat`),

    CONSTRAINT `fk_id_pasien` FOREIGN KEY (`id_pasien`) REFERENCES pasien(`id_pasien`),
    CONSTRAINT `fk_id_ruang` FOREIGN KEY (`id_ruang`) REFERENCES kamar(`id_ruang`),
    CONSTRAINT `fk_id_dokter` FOREIGN KEY (`id_dokter`) REFERENCES dokter(`id_dokter`)
);

-- Tabel pengobatan
CREATE TABLE IF NOT EXISTS `pengobatan` (
    `id_pengobatan`		 INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `id_pasien`          INT(3) UNSIGNED NOT NULL,
    `id_obat`            INT(3) UNSIGNED NOT NULL,
    `id_departemen`      INT(3) UNSIGNED NOT NULL,
    `jumlah_hari`        INT(3) UNSIGNED NOT NULL,
    `minum_dalam_sehari` INT(1) UNSIGNED NOT NULL,

    CONSTRAINT `pk_id_pengobatan` PRIMARY KEY (`id_pengobatan`),

    CONSTRAINT `fk_pengobatan_id_pasien` FOREIGN KEY (`id_pasien`) REFERENCES pasien(`id_pasien`),
    CONSTRAINT `fk_id_obat` FOREIGN KEY (`id_obat`) REFERENCES jenis_obat(`id_obat`),
    CONSTRAINT `fk_id_departemen` FOREIGN KEY (`id_departemen`) REFERENCES departemen(`id_departemen`)
);


COMMIT;
