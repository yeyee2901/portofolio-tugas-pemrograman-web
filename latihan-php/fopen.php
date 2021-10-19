<?php

//////////////////////
// File Open in PHP //
//////////////////////

$file = fopen("./file.txt", "r");

if ($file) {
  echo "File opened successfully<br>";

  // Let's not forget to close the file
  if (fclose($file)) {
    echo "File closed sucessfully";
  } else {
    echo "an error occured while closing the file!";
  }
} 
// If file open fails
else {
  echo "An error occured, file could not be opened!";
}
