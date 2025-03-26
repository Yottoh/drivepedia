<?php
session_start();
include 'connection.php';

$error = ""; // Променлива за съобщения за грешки

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user = trim($_POST['username']);
    $pass = trim($_POST['password']);

    if (empty($user) || empty($pass)) {
        $error = "Please fill in both fields.";
    } else {
        // Подготвяне на заявката за извличане на потребителя
        $stmt = $conn->prepare("SELECT username, pass FROM account WHERE username = ?");
        $stmt->bind_param("s", $user);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            // Отпечатваме данните за проверка (махни това след като тестваш)
            echo "Database password: " . $row['pass'] . "<br>";
            echo "Entered password: " . $pass . "<br>";

            // Проверка на паролата (без хеширане)
            if ($pass === $row['pass']) {
                $_SESSION['username'] = $row['username'];
                header("Location: autoinfo.php"); // Пренасочване при успешен вход
                exit();
            } else {
                $error = "Invalid username or password.";
            }
        } else {
            $error = "Invalid username or password.";
        }

        $stmt->close();
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="login1.css">
</head>
<body>

<div class="login-container">
    <h1>Login</h1>

    <?php if (!empty($error)) { echo '<p class="error-message">'.$error.'</p>'; } ?>

    <form action="login.php" method="POST" class="login-form">
        <div class="input-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
        </div>
        <div class="input-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <button type="submit" class="login-button">Login</button>
        <p class="register-link">Don't have an account? <a href="register.php">Sign Up</a></p>
    </form>
</div>

</body>
</html>
