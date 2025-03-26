<?php
session_start();
include 'connection.php';

// Проверка за задължителните параметри
if (!isset($_GET['model_id']) || !isset($_GET['year'])) {
    die("Липсват необходими параметри");
}

$model_id = intval($_GET['model_id']);
$year = $_GET['year'];

// Заявка за основна информация за модела с JOIN към brand и car_type
$model_query = $conn->prepare("
    SELECT m.*, b.b_name, ct.ct_name 
    FROM model m
    JOIN brand b ON m.m_brand = b.b_id
    JOIN car_type ct ON m.m_type = ct.ct_id
    WHERE m.m_id = ? AND m.m_year = ?
");
$model_query->bind_param("is", $model_id, $year);
$model_query->execute();
$model_result = $model_query->get_result();

if ($model_result->num_rows === 0) {
    die("Моделът не е намерен");
}
$model = $model_result->fetch_assoc();

// Заявка за информация за двигателя (използваме m_motor от модела)
$motor_id = $model['m_motor'];
$motor_query = $conn->prepare("SELECT * FROM motor WHERE mt_id = ?");
$motor_query->bind_param("i", $motor_id);
$motor_query->execute();
$motor_result = $motor_query->get_result();

if ($motor_result->num_rows === 0) {
    die("Двигателят не е намерен");
}
$motor = $motor_result->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="bg">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($model['m_name'] ?? 'Модел') ?> - Пълни характеристики</title>
    <link rel="stylesheet" href="style2.css">
</head>
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
<body>
    <div class="container">
        <div class="header">
            <h1><?= htmlspecialchars($model['b_name'] ?? 'Марка') ?> <?= htmlspecialchars($model['m_name'] ?? 'Модел') ?></h1>
            <h2><?= htmlspecialchars($year) ?> | <?= htmlspecialchars($model['ct_name'] ?? 'Тип') ?></h2>
        </div>

        <!-- Основна информация за модела -->
        <div class="specs-section">
            <h3 class="section-title">Основни характеристики</h3>
            <div class="specs-grid">
                <div class="spec-item">
                    <span class="spec-label">Брой врати:</span>
                    <span class="spec-value"><?= isset($model['m_doors']) ? htmlspecialchars($model['m_doors']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Тегло (kg):</span>
                    <span class="spec-value"><?= isset($model['m_weight']) ? htmlspecialchars($model['m_weight']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Брой места:</span>
                    <span class="spec-value"><?= isset($model['m_seats']) ? htmlspecialchars($model['m_seats']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Разход на гориво (l/100km):</span>
                    <span class="spec-value"><?= isset($model['m_fuel']) ? htmlspecialchars($model['m_fuel']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Резервоар за гориво (l):</span>
                    <span class="spec-value"><?= isset($model['m_fueltank']) ? htmlspecialchars($model['m_fueltank']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Тип каросерия:</span>
                    <span class="spec-value"><?= isset($model['ct_name']) ? htmlspecialchars($model['ct_name']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
            </div>
        </div>

        <!-- Динамични характеристики -->
        <div class="specs-section">
            <h3 class="section-title">Динамични характеристики</h3>
            <div class="specs-grid">
                <div class="spec-item">
                    <span class="spec-label">Ускорение 0-100 km/h (s):</span>
                    <span class="spec-value"><?= isset($model['m_acceleration']) ? htmlspecialchars($model['m_acceleration']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Максимална скорост (km/h):</span>
                    <span class="spec-value"><?= isset($model['m_speed']) ? htmlspecialchars($model['m_speed']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Задвижване:</span>
                    <span class="spec-value"><?= isset($model['m_drivewheel']) ? htmlspecialchars($model['m_drivewheel']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Скоростна кутия:</span>
                    <span class="spec-value"><?= isset($model['m_geartype']) ? htmlspecialchars($model['m_geartype']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
            </div>
        </div>

        <!-- Информация за двигателя -->
        <div class="specs-section">
            <h3 class="section-title">Двигател</h3>
            <div class="specs-grid">
                <div class="spec-item">
                    <span class="spec-label">Модел на двигател:</span>
                    <span class="spec-value"><?= isset($motor['mt_name']) ? htmlspecialchars($motor['mt_name']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Мощност (к.с.):</span>
                    <span class="spec-value"><?= isset($motor['mt_power']) ? htmlspecialchars($motor['mt_power']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Обем (cc):</span>
                    <span class="spec-value"><?= isset($motor['mt_volume']) ? htmlspecialchars($motor['mt_volume']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Вид гориво:</span>
                    <span class="spec-value"><?= isset($motor['mt_fuel']) ? htmlspecialchars($motor['mt_fuel']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Брой цилиндри:</span>
                    <span class="spec-value"><?= isset($motor['mt_cylinders']) ? htmlspecialchars($motor['mt_cylinders']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Въртящ момент (Nm):</span>
                    <span class="spec-value"><?= isset($motor['mt_torque']) ? htmlspecialchars($motor['mt_torque']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Разположение на двигателя:</span>
                    <span class="spec-value"><?= isset($motor['mt_enginelayout']) ? htmlspecialchars($motor['mt_enginelayout']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Конфигурация:</span>
                    <span class="spec-value"><?= isset($motor['mt_engineconfiguration']) ? htmlspecialchars($motor['mt_engineconfiguration']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Степен на компресия:</span>
                    <span class="spec-value"><?= isset($motor['mt_compressionratio']) ? htmlspecialchars($motor['mt_compressionratio']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Аспирация:</span>
                    <span class="spec-value"><?= isset($motor['mt_engineaspiration']) ? htmlspecialchars($motor['mt_engineaspiration']) : '<span class="not-available">н/д</span>' ?></span>
                </div>
            </div>
        </div>
    </div>

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