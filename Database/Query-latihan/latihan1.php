<?php
$host = "abimanyu.eng.wima.ac.id";
$user = "5103018003";
$pass = "5103018003";
$database = "5103018003";

$conn = mysqli_connect($host, $user, $pass, $database);

?>

<html>

<head>
  <title>Coba Koneksi ke Abimanyu</title>
</head>

<body>
  <?php if ($conn) : ?>
    <h1 style="color: green;">Berhasil terkoneksi ke abimanyu.eng.wima.ac.id</h1>
  <?php else : ?>
    <h1 style="color: red;">GAGAL terkoneksi ke abimanyu.eng.wima.ac.id</h1>
  <?php endif ?>
</body>

</html>
