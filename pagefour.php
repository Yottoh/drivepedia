<?php
session_start();
include 'connection.php';

if (!isset($_GET['model_id']) || !isset($_GET['year'])) {
    die("Missing model ID or year.");
}

$model_id = intval($_GET['model_id']);
$year = $_GET['year']; // Годината е текст (напр. "2009-2014"), не число

// 1. Първо намираме motor_id за избрания модел и година
$model_query = $conn->prepare("SELECT m_motor FROM model WHERE m_id = ? AND m_year = ?");
if (!$model_query) {
    die("Prepare failed: " . $conn->error);
}
$model_query->bind_param("is", $model_id, $year); // "is" = integer, string
$model_query->execute();
$motor_id_result = $model_query->get_result();

if ($motor_id_result->num_rows === 0) {
    die("No motor found for this model and year.");
}

$motor_data = $motor_id_result->fetch_assoc();
$motor_id = $motor_data['m_motor'];

// 2. Сега вземаме данните за двигателя
$motor_query = $conn->prepare("SELECT mt_volume, mt_power, mt_engineconfiguration 
                             FROM motor 
                             WHERE mt_id = ?");
if (!$motor_query) {
    die("Prepare failed: " . $conn->error);
}
$motor_query->bind_param("i", $motor_id);
$motor_query->execute();
$result = $motor_query->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Specifications</title>
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
        <h2>Specifications for Model ID <?= htmlspecialchars($model_id) ?> (Year: <?= htmlspecialchars($year) ?>)</h2>
        <div class="gallery-grid">
            <?php while ($spec = $result->fetch_assoc()): ?>
                <div class="photo-box">
                    <a href="pagefive.php?motor_id=<?= urlencode($motor_id) ?>&model_id=<?= urlencode($model_id) ?>&year=<?= urlencode($year) ?>" class="spec-button">
                        <button class="brand-button">
                            Volume: <?= htmlspecialchars($spec['mt_volume']) ?> cc Power: <?= htmlspecialchars($spec['mt_power']) ?> HP Engine: <?= htmlspecialchars($spec['mt_engineconfiguration']) ?>
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