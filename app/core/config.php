<?php 

$host = $_SERVER['SERVER_NAME'];  // Lấy tên miền hiện tại của máy chủ
$port = $_SERVER['SERVER_PORT'];  // Lấy cổng mà máy chủ đang sử dụng

// Xây dựng URL gốc
$rootUrl = "http://$host";  // Đặt URL gốc của ứng dụng

// Nếu cổng không phải là 80 (mặc định), thêm cổng vào URL
if ($port != 80) {
    $rootUrl .= ":$port";  // Thêm cổng vào URL nếu không phải cổng mặc định 80
}

// Kiểm tra nếu tên miền là localhost
if (strpos($host, 'localhost') !== false || strpos($host, '127.0.0.1') !== false) {
    // Cấu hình cho local server
    $rootUrl .= "/chieuthu2/public";  // Đường dẫn tới thư mục public của bạn
    define("ROOT", $rootUrl);  // Định nghĩa ROOT

    // Cấu hình cơ sở dữ liệu
    define("DBDRIVER", "mysql");
    define("DBHOST", "localhost");
    define("DBUSER", "root");
    define("DBPASS", "");  // Mật khẩu có thể trống khi sử dụng local
    define("DBNAME", "music_website_db");
} else {
    // Cấu hình cho online server
    define("ROOT", $rootUrl);  // Sử dụng URL đã xây dựng (bao gồm cổng nếu có)

    // Cấu hình cơ sở dữ liệu cho sản phẩm
    define("DBDRIVER", "mysql");
    define("DBHOST", "localhost");  // Nếu MySQL trên cùng máy chủ
    define("DBUSER", "root");       // Thay đổi nếu cần
    define("DBPASS", "");           // Thay đổi mật khẩu nếu cần
    define("DBNAME", "music_website_db");
}
?>