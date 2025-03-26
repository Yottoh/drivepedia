<?php
$servername = "localhost"; // Хост
$username = "root"; // Потребителско име за phpMyAdmin
$password = ""; // Парола (по подразбиране е празна за XAMPP)
$dbname = "autodata"; // Име на базата данни
$port = 3306;

// Създаване на връзка
$conn = new mysqli($servername, $username, $password, $dbname, $port);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>