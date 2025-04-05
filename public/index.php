<?php
session_start();

require "../app/core/init.php";

$URL = $_GET['url'] ?? "home";
$URL = explode("/", $URL);

// Xác định trang
if ($URL[0] == "admin" && isset($URL[1])) {
    $file = page("admin/" . $URL[1]);  // Gọi page() với "admin/balance"
} else {
    $file = page(strtolower($URL[0]));
}

// Kiểm tra và yêu cầu file
if (file_exists($file)) {
    require $file;
} else {
    require page("404"); // Trang 404 tùy chỉnh của bạn
}