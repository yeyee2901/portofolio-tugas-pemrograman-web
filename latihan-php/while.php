<?php
///////////////////////////
// WHILE loop in PHP     //
///////////////////////////

$i = 1;

// normal style
while ($i < 7) {
  echo "<h$i>This is a heading written with h$i</h$i>";
  $i++;
}

$i = 1;

?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width" />
  <title>While Loop</title>
</head>

<body>

  <!-- Templating Style - Sering digunakan untuk PHP yang di embed di HTML -->
  <br>
  <br>
  <h1>Templating Style</h1>
  <?php while ($i < 7) : ?>
    <?php echo "<h$i>This is a heading written with h$i</h$i>"; ?>
    <?php $i++; ?>
  <?php endwhile; ?>

</body>

</html>
