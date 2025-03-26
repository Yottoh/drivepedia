<?php
session_start();
include 'connection.php'; // Връзка с базата

if (!isset($_GET['b_id'])) {
    die("Brand not specified.");
}

$brand_id = intval($_GET['b_id']); // Защита от SQL инжекции

// Взимаме името на марката
$brand_query = $conn->prepare("SELECT b_name FROM brand WHERE b_id = ?");
$brand_query->bind_param("i", $brand_id);
$brand_query->execute();
$brand_result = $brand_query->get_result();
$brand = $brand_result->fetch_assoc();

if (!$brand) {
    die("Brand not found.");
}

// Взимаме моделите за тази марка
$model_query = $conn->prepare("SELECT * FROM model WHERE m_brand = ?");
$model_query->bind_param("i", $brand_id);
$model_query->execute();
$model_result = $model_query->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($brand['b_name']) ?> Models</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<header>
    <a href="autoinfo.php" class="logo">DrivePedia</a>
    <div class="search-container">
        <input type="text" placeholder="Search car..." class="search-bar">
        <button class="search-btn">🔍</button>
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

<main>
    <section class="photo-gallery">
        <h2>Models of <?= htmlspecialchars($brand['b_name']) ?></h2>
        <div class="gallery-grid">
            <?php while ($row = $model_result->fetch_assoc()): ?>
                <div class="photo-box">
                    <button class="brand-button" onclick="window.location.href='thirdpage.php?model_id=<?= $row['m_id'] ?>'">
                        <?= htmlspecialchars($row['m_name']) ?>
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
