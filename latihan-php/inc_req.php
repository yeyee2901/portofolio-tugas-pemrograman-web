<?php
echo "Include = 'menempelkan' file lain, bila file target tidak ada, maka error namun script tetap berlanjut";
echo "<br>";
echo "Require = 'menempelkan' file lain, bila file target tidak ada, maka akan error dan script berhenti";

include("./inc_req.html");
require("./inc_req.html");
