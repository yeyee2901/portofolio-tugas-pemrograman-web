<?php

$text = "This will be written to the file";
$target_file = "./file2.txt";

/** 
 * @brief Dump file content using echo
 * will return TRUE when file is opened successfully, FALSE otherwise
 * @return success_status
 * */
function dump_file_content(string $filename): bool
{
  $file = fopen($filename, "r");

  // check if file opened successfully
  if ($file) {

    // read until EOF (end of file)
    while (!feof($file)) {

      // Read line-by-line
      $line = fgets($file, 1024);
      echo "$line<br>";
    }

    fclose($file);

    // return true on success
    return true;
  }

  // return false on failure
  return false;
}

// READ FILE
echo "<h1>Isi file sebelum:</h1>";
dump_file_content($target_file);

// WRITE FILE
// open in write mode
echo "<h1>Isi file sesudah:</h1>";
$file = fopen("file2.txt", "w");

if ($file) {
  // write to file
  fwrite($file, $text);

  // do not forget to close the file
  fclose($file);

  // BACA FILE LAGI
  dump_file_content($target_file);
}

// In case file cannot be opened
else {
  echo "Error occured, file cannot be opened!";
}
