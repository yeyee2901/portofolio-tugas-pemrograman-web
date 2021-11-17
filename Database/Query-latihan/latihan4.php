<?php

// Latihan 4: Query DELETE
$host = "abimanyu.eng.wima.ac.id";
$user = "5103018003";
$pass = "5103018003";
$database = "5103018003";

$conn = mysqli_connect($host, $user, $pass, $database);

$table_name = "dokter";
$q = "
  DELETE FROM $table_name WHERE
    nama LIKE '%Gabriel%'
";

if ($conn) {
  mysqli_query($conn, $q);
  $num_deleted = mysqli_affected_rows($conn);
  if ($num_deleted > 0) {
    echo "Deleted $num_deleted records from $table_name";
  } else {
    echo mysqli_error($conn);
  }
}
