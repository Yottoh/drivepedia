<?php
session_start(); // Започва сесията
session_unset(); // Изчиства всички сесийни променливи
session_destroy(); // Разрушава сесията

// Пренасочване към главната страница (index.php)
header("Location: autoinfo.php");
exit();
?>
