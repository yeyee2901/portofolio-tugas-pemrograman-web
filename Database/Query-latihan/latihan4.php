<?php
// PERCOBAAN 4
// Query DELETE
$host = "abimanyu.eng.wima.ac.id";
$user = "5103018003";
$pass = "5103018003";
$database = "5103018003";

$conn = mysqli_connect($host, $user, $pass, $database);

$table_name = "dokter";

// delete yang namanya mengandung (%nama%)
$q = "
  DELETE FROM $table_name WHERE
    nama LIKE '%Gabriel%'
";

// delete all
$q2 = "
  DELETE FROM $table_name
";

if ($conn) {
  mysqli_query($conn, $q2);
  $num_deleted = mysqli_affected_rows($conn);
  if ($num_deleted > 0) {
    echo "Deleted $num_deleted records from $table_name";
  } else {
    echo "Query DELETE gagal!";
    echo mysqli_error($conn);
  }
}
