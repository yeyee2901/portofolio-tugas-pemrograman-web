<?php
$os_type = $_POST["os_type"];
$result = "";

// Check selection
switch ($os_type) {
  case "win10":
    $result = "Your operating system is Windows 10";
    break;

  case "win8":
    $result = "Your operating system is Windows 8";
    break;

  case "win7":
    $result = "Your operating system is Windows 7";
    break;

  case "linux":
    $result = "Your operating system is GNU/Linux";
    break;

  case "macos":
    $result = "Your operating system is MacOS";
    break;

  case "unix":
    $result = "Your operating system is Unix";
    break;

  case "os2":
    $result = "Your operating system is OS/2";
    break;

  default:
    $result = "Something went wrong :(";
    break;
}

echo $result;
