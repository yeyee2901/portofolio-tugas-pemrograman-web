<?php
/////////////////////////
// File reading in PHP //
/////////////////////////


$file = fopen("./file.txt", "r");

// check if file opened successfully
if ($file) {

  // read until EOF (end of file)
  while (!feof($file)) {

    // Read line-by-line
    $line = fgets($file, 1024);
    echo "$line<br>";
  }

  fclose($file);
}

// If file failed to open
else {
  echo "An error occured, file could not be opened!";
}
