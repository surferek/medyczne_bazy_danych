<?php
$con = mysqli_connect("https://az-serwer1803440.online.pro/sql/",
    "00148728_bazy","bioinformatyka","00148728_bazy");

// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
?>
