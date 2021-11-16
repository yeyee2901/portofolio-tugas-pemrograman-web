<?php

// PERCOBAAN 2
// Query SELECT database abimanyu
$host = "abimanyu.eng.wima.ac.id";
$user = "5103018003";
$pass = "5103018003";
$database = "5103018003";

$conn = mysqli_connect($host, $user, $pass, $database);
$table_name = "dokter";
$q = "SELECT * FROM $table_name";

// simpan result
$result = mysqli_query($conn, $q);


// tampilkan hasil query SELECT dalam bentuk array asosiatif
// jika tidak ada ERROR
if ($result) {
  $result = mysqli_fetch_all($result, MYSQLI_ASSOC);
  echo "
  <h1 style='color: green;'>
    hasil SELECT: <br>
  </h1>
";
  var_dump($result);
}

// jika terjadi ERROR pada database
else {
  echo "
  <h1 style='color: red;'>
    Terjadi ERROR! 
  </h1>";
  echo mysqli_error($conn);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>Percobaan SELECT</title>

</head>

<body>
  <table>
    <thead>
      <tr>ID dokter</tr>
      <tr>Nama</tr>
      <tr>Alamat</tr>
      <tr>Domisili</tr>
      <tr>Tanda Pengenal</tr>
      <tr>Keahlian</tr>
    </thead>

    <tbody>

      <?php foreach ($result as $dokter) : ?>

        <td> <?= $dokter["id_dokter"] ?> </td>
        <td> <?= $dokter["nama"] ?> </td>
        <td> <?= $dokter["alamat"] ?> </td>
        <td> <?= $dokter["kota"] ?> </td>
        <td> <?= $dokter["id_pengenal"] ?> </td>
        <td> <?= $dokter["keahlian"] ?> </td>

      <?php endforeach; ?>

    </tbody>

  </table>

</body>

</html>
