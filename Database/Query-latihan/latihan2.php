<?php

// PERCOBAAN 2
// Query INSERT database abimanyu
// 1. insert ke tabel 'dokter'
$host = "abimanyu.eng.wima.ac.id";
$user = "5103018003";
$pass = "5103018003";
$database = "5103018003";

$conn = mysqli_connect($host, $user, $pass, $database);

// Field tabel dokter:
// nama, alamat, kota, id_pengenal, keahlian
$table_name = "dokter";

$nama = "Joko Budiawan";
$alamat = "Jalan Dimana Saja";
$kota = "Kota kenangan";
$id_pengenal = "kartu pelajar";
$keahlian = "Dokter dokter an";

$q = "
INSERT INTO $table_name
  (nama,alamat,kota,id_pengenal,keahlian)
VALUES
  ('$nama', '$alamat', '$kota', '$id_pengenal', '$keahlian')
  ";

mysqli_query($conn, $q);

if (mysqli_affected_rows($conn) > 0) {
  echo "<h1 style='color: green;'>INSERT berhasil!</h1>";
} else {
  echo "<h1 style='color: red;'>INSERT gagal!</h1>";
}
