<?php
require_once '../app/core/init.php';

// Lấy slug bài hát từ URL
$slug = $URL[1] ?? null;

if(!$slug) {
    message("Không tìm thấy bài hát");
    redirect('music');
}

// Kiểm tra đăng nhập
if(!logged_in()) {
    message("Bạn cần đăng nhập để tải nhạc");
    redirect('login');
}

// Lấy thông tin bài hát
$query = "select * from songs where slug = :slug limit 1";
$song = db_query_one($query, ['slug' => $slug]);

if(!$song) {
    message("Không tìm thấy bài hát");
    redirect('music');
}

// Lấy ID người dùng hiện tại
$user_id = user('id');

// Thiết lập giá bài hát
$song_price = 1000; // Giá mỗi bài hát là 1.000 đồng

// Kiểm tra nếu là admin thì không cần kiểm tra số dư
if(!is_admin()) {
    // Kiểm tra số dư cho người dùng thông thường
    if(!hasEnoughBalance($user_id, $song_price)) {
        // Không đủ tiền, chuyển hướng với thông báo lỗi
        message("Số dư không đủ để tải nhạc. Vui lòng nạp thêm tiền.");
        redirect('song/' . $slug);
    }
    
    // Đủ tiền, trừ tiền
    if(!deductBalance($user_id, $song_price)) {
        message("Có lỗi xảy ra khi xử lý giao dịch.");
        redirect('song/' . $slug);
    }
}

// Đường dẫn file nhạc
$file_path = $song['file'];

if(file_exists($file_path)) {
    // Thiết lập header để tải file
    header('Content-Description: File Transfer');
    header('Content-Type: '. mime_content_type($file_path));
    header('Content-Disposition: attachment; filename="'.basename($file_path).'"');
    header('Content-Transfer-Encoding: binary');
    header('Expires: 0');
    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
    header('Pragma: public');
    header('Content-Length: ' . filesize($file_path));
    ob_clean();
    flush();
    readfile($file_path);
    exit();
} else {
    message("File không tồn tại.");
    redirect('song/' . $slug);
}

// Nếu có lỗi khác, hiển thị thông báo
message("Không thể tải bài hát. Vui lòng thử lại sau.");
redirect('song/' . $slug);
?>
