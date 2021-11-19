<?php
// PERCOBAAN 3
// Query SELECT database abimanyu
$host = "abimanyu.eng.wima.ac.id";
$user = "5103018003";
$pass = "5103018003";
$database = "5103018003";
$result = null; // pre instantiate

$conn = mysqli_connect($host, $user, $pass, $database);
$table_name = "dokter";
$q = "SELECT * FROM $table_name";

// lakukan query SELECT jika koneksi berhasil
if (!$conn) {
  die("<h1 style='color: red;'>DB-CONN ERROR</h1><br>");
} else {
  $result = mysqli_query($conn, $q);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>Percobaan SELECT</title>
  <style type="text/css" media="screen">
    table,
    td,
    tr {
      border: 1px solid black;
      border-collapse: collapse;
      padding: 2%;
    }
  </style>

</head>


<body>
  <!-- Tampilkan result jika koneksi berhasil & query berhasil -->
  <?php if ($result and $conn) : ?>
    <table>
      <thead>
        <td>
          <h3>ID dokter</h3>
        </td>
        <td>
          <h3>Nama</h3>
        </td>
        <td>
          <h3>Alamat</h3>
        </td>
        <td>
          <h3>Domisili</h3>
        </td>
        <td>
          <h3>Tanda Pengenal</h3>
        </td>
        <td>
          <h3>Keahlian</h3>
        </td>
      </thead>

      <tbody>
        <?php $result = mysqli_fetch_all($result, MYSQLI_ASSOC); ?>
        <?= "<h3>Query:</h3>" ?>
        <?= $q ?>
        <?php foreach ($result as $dokter) : ?>
          <tr>
            <td> <?= $dokter["id_dokter"] ?> </td>
            <td> <?= $dokter["nama"] ?> </td>
            <td> <?= $dokter["alamat"] ?> </td>
            <td> <?= $dokter["kota"] ?> </td>
            <td> <?= $dokter["id_pengenal"] ?> </td>
            <td> <?= $dokter["keahlian"] ?> </td>
          </tr>
        <?php endforeach; ?>
      <?php else : ?>
        <?= "<h1 style='color: red;'>QUERY ERROR</h1><br>"; ?>
        <?= mysqli_error($conn); ?>
      </tbody>
    </table>
  <?php endif; ?>
</body>

</html>
