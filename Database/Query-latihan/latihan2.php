<?php
// PERCOBAAN 2
// Query INSERT database abimanyu
$NUM_LOOP = 10;

$host = "abimanyu.eng.wima.ac.id";
$user = "5103018003";
$pass = "5103018003";
$database = "5103018003";
$conn = mysqli_connect($host, $user, $pass, $database);


for ($i = 0; $i < $NUM_LOOP; $i++) {
  // Field tabel dokter:
  // nama, alamat, kota, id_pengenal, keahlian
  $table_name = "dokter";

  $random_num = rand(0, 60);
  $nama = "Ini nama $random_num";
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
}
