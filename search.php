<?php
session_start();
include 'connection.php';

// Вземане на търсената дума
$searchQuery = isset($_GET['query']) ? trim($_GET['query']) : '';

if (!empty($searchQuery)) {
    // Заявка за търсене в базата данни
    $stmt = $conn->prepare("SELECT * FROM model WHERE m_name LIKE ?");
    $searchParam = "%$searchQuery%";
    $stmt->bind_param("s", $searchParam);
    $stmt->execute();
    $result = $stmt->get_result();
    
    // Показване на резултатите
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Search Results</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <!-- Вашия header -->
        
        <main>
            <h2>Search Results for "<?= htmlspecialchars($searchQuery) ?>"</h2>
            <div class="gallery-grid">
                <?php while ($row = $result->fetch_assoc()): ?>
                    <div class="photo-box">
                        <a href="model_details.php?id=<?= $row['m_id'] ?>" class="brand-button">
                            <?= htmlspecialchars($row['m_name']) ?>
                        </a>
                    </div>
                <?php endwhile; ?>
            </div>
        </main>
        
        <!-- Вашия footer -->
    </body>
    </html>
    <?php
} else {
    header("Location: index.php");
    exit();
}
?>