<?php
require "config.php";
require "functions.php";

// Thiết lập kết nối cơ sở dữ liệu
try {
    $conn = new PDO(DBDRIVER.":host=".DBHOST.";dbname=".DBNAME, DBUSER, DBPASS);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Kết nối CSDL thất bại: " . $e->getMessage());
}

// Phần còn lại của file init.php
?>