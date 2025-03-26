<?php
session_start();
include 'connection.php'; // Включване на връзката с базата

// Извличане на всички марки от базата
$sql = "SELECT * FROM brand";
$result = $conn->query($sql);

if (!$result) {
    die("Query failed: " . $conn->error); // Ако заявката е неуспешна, покажи грешката
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DrivePedia - Car Brands</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<header>
    <a href="autoinfo.php" class="logo">DrivePedia</a>
    <div class="search-container">
    <form action="search.php" method="GET">
        <input type="text" name="query" placeholder="Search car..." class="search-bar"> <button type="submit" class="search-btn">🔍</button>
    </form>
</div>
    <div class="nav-buttons">
        <?php if (isset($_SESSION['username'])): ?>
            <a href="profile.php" id="login-btn">Profile (<?php echo htmlspecialchars($_SESSION['username']); ?>)</a>
            <a href="logout.php" id="login-btn">Logout</a>
        <?php else: ?>
            <a href="login.php" id="login-btn">Login/Sign up</a>
        <?php endif; ?>
    </div>
</header>

   <!-- Hero Section -->
   <section class="hero">
        <h1>Welcome to DrivePedia</h1>
        <p>Get all information you need for your car!</p>
    </section>

<main>
    <section class="photo-gallery">
        <h2>Brands</h2>
        <div class="gallery-grid">
            <?php while ($row = $result->fetch_assoc()): ?>
                <div class="photo-box">
                    <button class="brand-button" onclick="window.location.href='secondpage.php?b_id=<?= $row['b_id'] ?>'">
                        <?= htmlspecialchars($row['b_name']) ?>
                    </button>
                </div>
            <?php endwhile; ?>
        </div>
    </section>
</main>

<footer>
    <div class="footer-container">
        <p>&copy; 2025 DrivePedia.</p>
        <nav>
            <a href="#">About Us</a>
            <a href="#">Privacy Policy</a>
            <a href="#">Contact</a>
        </nav>
    </div>
</footer>

</body>
</html>
