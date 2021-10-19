<?php
$name = $_GET["name"];
$sname = $_GET["sname"];

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
  Perhatikan URL, jika menggunakan method <strong>get</strong>
  pada URL <strong>akan</strong> disertakan isi dari form yang di submit
</body>

</html>
