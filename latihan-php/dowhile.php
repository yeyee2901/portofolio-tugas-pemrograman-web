<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>Do blahblah While something</title>
</head>

<body>
  <?php
  $count = 0;

  do {
    echo $count;
    echo "<br>";
    $count++;
  } while ($count < 5);
  ?>

</body>

</html>
