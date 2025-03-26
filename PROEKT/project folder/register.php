<?php
include 'connection.php';
$error = "";
$success = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user = trim($_POST['username']);
    $pass = trim($_POST['password']);

    if (empty($user) || empty($pass)) {
        $error = "Please fill in both fields.";
    } else {
        // Проверка дали потребителят вече съществува
        $stmt = $conn->prepare("SELECT username FROM account WHERE username = ?");
        $stmt->bind_param("s", $user);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows > 0) {
            $error = "Username already exists.";
        } else {
            // Вмъкване на нов потребител в базата данни
            $stmt = $conn->prepare("INSERT INTO account (username, pass) VALUES (?, ?)");
            $stmt->bind_param("ss", $user, $pass); // НЕ се използва хеширане (по твое желание)
            if ($stmt->execute()) {
                $success = "Registration successful! You can now <a href='login.php'>log in</a>.";
            } else {
                $error = "Error registering user.";
            }
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
    <title>Sign Up</title>
    <link rel="stylesheet" href="login1.css">
</head>
<body>

<div class="login-container">
    <h1>Sign Up</h1>

    <?php if (!empty($error)) { echo '<p class="error-message">'.$error.'</p>'; } ?>
    <?php if (!empty($success)) { echo '<p class="success-message">'.$success.'</p>'; } ?>

    <form action="register.php" method="POST" class="login-form">
        <div class="input-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Choose a username" required>
        </div>
        <div class="input-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Create a password" required>
        </div>
        <button type="submit" class="login-button">Sign Up</button>
        <p class="register-link">Already have an account? <a href="login.php">Log in</a></p>
    </form>
</div>

</body>
</html>
