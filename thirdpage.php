<?php
session_start();
include 'connection.php';

if (!isset($_GET['model_id'])) {
    die("Model not specified.");
}

$model_id = intval($_GET['model_id']);

// Взимаме името на модела
$model_query = $conn->prepare("SELECT m_name FROM model WHERE m_id = ?");
$model_query->bind_param("i", $model_id);
$model_query->execute();
$model_result = $model_query->get_result();
$model = $model_result->fetch_assoc();

if (!$model) {
    die("Model not found.");
}

// Взимаме годините за този модел
$year_query = $conn->prepare("SELECT m_year FROM model WHERE m_id = ?");
$year_query->bind_param("i", $model_id);
$year_query->execute();
$year_result = $year_query->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($model['m_name']) ?> - Years</title>
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
            <h2><?= htmlspecialchars($model['m_name']) ?> - Available Years</h2>
            <div class="gallery-grid">
                <?php while ($year = $year_result->fetch_assoc()): ?>
                    <div class="photo-box">
                        <a href="pagefour.php?model_id=<?= $model_id ?>&year=<?= $year['m_year'] ?>">
                            <button class="brand-button">
                                <?= htmlspecialchars($year['m_year']) ?>
                            </button>
                        </a>
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
