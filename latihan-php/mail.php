<?php
$destination = "some.email@gmail.com";
$subject = "Test mail() PHP method";
$msg = "This is a test message. Please ignore this if you received it";

// check if it's sent
if(mail($destination, $subject, $msg)){
  echo "Message sent successfully!";
}
else {
  echo "Failed to send, error occured";
}
