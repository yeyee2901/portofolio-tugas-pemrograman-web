-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: skema_rumah_sakit
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.21.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departemen`
--

DROP TABLE IF EXISTS `departemen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departemen` (
  `id_departemen` int unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `penanggung_jawab` varchar(100) NOT NULL,
  `jum_dokter` int unsigned DEFAULT '1',
  PRIMARY KEY (`id_departemen`),
  UNIQUE KEY `nama` (`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departemen`
--

LOCK TABLES `departemen` WRITE;
/*!40000 ALTER TABLE `departemen` DISABLE KEYS */;
/*!40000 ALTER TABLE `departemen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dokter`
--

DROP TABLE IF EXISTS `dokter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dokter` (
  `id_dokter` int unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `id_pengenal` varchar(100) DEFAULT 'KTP',
  `keahlian` varchar(50) NOT NULL,
  PRIMARY KEY (`id_dokter`),
  UNIQUE KEY `nama` (`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dokter`
--

LOCK TABLES `dokter` WRITE;
/*!40000 ALTER TABLE `dokter` DISABLE KEYS */;
/*!40000 ALTER TABLE `dokter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenis_obat`
--

DROP TABLE IF EXISTS `jenis_obat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jenis_obat` (
  `id_obat` int unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `stock` int unsigned DEFAULT '0',
  PRIMARY KEY (`id_obat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_obat`
--

LOCK TABLES `jenis_obat` WRITE;
/*!40000 ALTER TABLE `jenis_obat` DISABLE KEYS */;
/*!40000 ALTER TABLE `jenis_obat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kamar`
--

DROP TABLE IF EXISTS `kamar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kamar` (
  `id_ruang` int unsigned NOT NULL AUTO_INCREMENT,
  `nama_ruang` varchar(100) NOT NULL,
  `kapasitas` int unsigned NOT NULL,
  PRIMARY KEY (`id_ruang`),
  UNIQUE KEY `nama_ruang` (`nama_ruang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kamar`
--

LOCK TABLES `kamar` WRITE;
/*!40000 ALTER TABLE `kamar` DISABLE KEYS */;
/*!40000 ALTER TABLE `kamar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasien`
--

DROP TABLE IF EXISTS `pasien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasien` (
  `id_pasien` int unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kota` varchar(100) DEFAULT NULL,
  `kota_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `id_pengenal` varchar(50) DEFAULT 'KTP',
  PRIMARY KEY (`id_pasien`),
  UNIQUE KEY `nama` (`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasien`
--

LOCK TABLES `pasien` WRITE;
/*!40000 ALTER TABLE `pasien` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengobatan`
--

DROP TABLE IF EXISTS `pengobatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengobatan` (
  `id_pengobatan` int unsigned NOT NULL AUTO_INCREMENT,
  `id_pasien` int unsigned NOT NULL,
  `id_obat` int unsigned NOT NULL,
  `id_departemen` int unsigned NOT NULL,
  `jumlah_hari` int unsigned NOT NULL,
  `minum_dalam_sehari` int unsigned NOT NULL,
  PRIMARY KEY (`id_pengobatan`),
  KEY `fk_pengobatan_id_pasien` (`id_pasien`),
  KEY `fk_id_obat` (`id_obat`),
  KEY `fk_id_departemen` (`id_departemen`),
  CONSTRAINT `fk_id_departemen` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id_departemen`),
  CONSTRAINT `fk_id_obat` FOREIGN KEY (`id_obat`) REFERENCES `jenis_obat` (`id_obat`),
  CONSTRAINT `fk_pengobatan_id_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengobatan`
--

LOCK TABLES `pengobatan` WRITE;
/*!40000 ALTER TABLE `pengobatan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengobatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayat_kesehatan`
--

DROP TABLE IF EXISTS `riwayat_kesehatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwayat_kesehatan` (
  `id_riwayat` int unsigned NOT NULL AUTO_INCREMENT,
  `id_pasien` int unsigned NOT NULL,
  `id_dokter` int unsigned NOT NULL,
  `id_ruang` int unsigned NOT NULL,
  `tgl_mulai_rawat` datetime DEFAULT CURRENT_TIMESTAMP,
  `tgl_selesai_rawat` datetime DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT '-',
  PRIMARY KEY (`id_riwayat`),
  KEY `fk_id_pasien` (`id_pasien`),
  KEY `fk_id_ruang` (`id_ruang`),
  KEY `fk_id_dokter` (`id_dokter`),
  CONSTRAINT `fk_id_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  CONSTRAINT `fk_id_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  CONSTRAINT `fk_id_ruang` FOREIGN KEY (`id_ruang`) REFERENCES `kamar` (`id_ruang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat_kesehatan`
--

LOCK TABLES `riwayat_kesehatan` WRITE;
/*!40000 ALTER TABLE `riwayat_kesehatan` DISABLE KEYS */;
/*!40000 ALTER TABLE `riwayat_kesehatan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-11 15:01:25
