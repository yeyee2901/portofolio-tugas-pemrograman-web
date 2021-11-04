<?php
/*
* To make this works, the server has to have "sendmail"
* application. On Debian based machine:
*   sudo apt install sendmail
*/
$destination = "gabriel777sh@gmail.com";
$subject = "Test mail() PHP method";
$msg = "This is a test message. Please\r\nignore this if you received it";
$headers = "From: gabriel777sh@gmail.com";

// check if it's sent
if (mail($destination, $subject, $msg, $headers)) {
  echo "Message sent successfully!";
} else {
  echo "Failed to send, error occured";
}
