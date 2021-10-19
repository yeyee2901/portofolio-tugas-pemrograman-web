<?php

//////////////////////////
// Opening a dir in PHP //
//////////////////////////

$i = 1;
$open_dir = opendir("./test-dir");
echo "Isi direktori: <br>";

// Loop through all file in the directory
while ($file = readdir($open_dir)) {

  // to avoid current directory and upper directory
  if ($file === "." || $file === "..") {
    continue;
  }

  echo "$i. $file <br>";
  $i++;
}
