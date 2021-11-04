<?php
/* set cookie to expire in 1 minutes */
if (isset($_POST["set_cookie"])) {
  setcookie("myFirst", "Hellooooo", time() + 60);
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title></title>
  link
</head>

<body>
  <form action="cookies.php" method="post" accept-charset="utf-8">
    <input type="hidden" name="set_cookie" id="set_cookie">
    <button type="submit">Set Cookie!</button>
  </form>

  <!-- this will only launch whenever the cookie is set -->
  <?php
  if (isset($_COOKIE["first_cookie"])) {
    $cookie_val = $_COOKIE["first_cookie"];
    echo "<h2>Cookie $cookie_val is set!</h2>";
  }
  ?>
</body>

</html>
