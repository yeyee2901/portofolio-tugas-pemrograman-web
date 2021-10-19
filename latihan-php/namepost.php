<?php
$name = $_POST["name"];
$sname = $_POST["sname"];

?>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width" />
  <title>Hasil NameGet PHP</title>
</head>

<body>
  Your name is: <strong><?= $name ?> <?= $sname ?></strong>
  <br>
  Perhatikan URL, jika menggunakan method <strong>POST</strong>
  maka isi dari form <strong>tidak akan</strong> disertakan pada URL
</body>

</html>
