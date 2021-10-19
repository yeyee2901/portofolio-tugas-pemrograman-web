<?php
$week = array("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");

/* Push element */
$week[] = "Sunday";

/* Wednesday */
echo $week[2];
echo "<br>";

/* Display array length */
$num_days = count($week);
echo "Jumlah hari: $num_days";
