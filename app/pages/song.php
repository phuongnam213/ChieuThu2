<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="public/assets/style.css">

<?php 
    // Lấy slug từ URL
    $slug = $URL[1] ?? null;

    // Truy vấn lấy thông tin bài hát từ bảng 'songs'
    $query = "SELECT * FROM songs WHERE slug = :slug LIMIT 1";
    $row = db_query_one($query, ['slug' => $slug]);

    // Kiểm tra nếu không tìm thấy bài hát
    if (!$row) {
        echo "Song not found.";
        exit;
    }

    // Lấy thông tin người dùng hiện tại
    $user_id = user('id');
    $song_price = 1000; // Giá mỗi bài hát là 1.000 đồng

    // Kiểm tra khi người dùng click vào nút tải nhạc
    if (isset($_POST['download'])) {
        // Kiểm tra xem người dùng có đủ tiền không
        if (!hasEnoughBalance($user_id, $song_price)) {
            $_SESSION['download_error'] = "Số dư không đủ để tải nhạc. Vui lòng nạp thêm tiền.";
            header("Location: " . $_SERVER['REQUEST_URI']);
            exit;
        } else {
            // Trừ tiền và cho phép tải nhạc
            if (deductBalance($user_id, $song_price)) {
                $file_path = $row['file']; // Đường dẫn đến file nhạc
                if (file_exists($file_path)) {
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
                    $_SESSION['download_error'] = "File không tồn tại.";
                    header("Location: " . $_SERVER['REQUEST_URI']);
                    exit;
                }
            }
        }
    }
?>

<?php require page('includes/header')?>

<style>
    /* Style cho thông báo lỗi */
    .alert {
        padding: 15px;
        margin-bottom: 20px;
        border: 1px solid transparent;
        border-radius: 8px;
        max-width: 800px;
        margin-left: auto;
        margin-right: auto;
    }
    
    .alert-danger {
        color: #721c24;
        background-color: #f8d7da;
        border-color: #f5c6cb;
    }

    /* Style cho nút tải nhạc */
    .download-btn {
        display: inline-block;
        padding: 10px 20px;
        background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-weight: 500;
        margin-top: 15px;
        transition: all 0.3s ease;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .download-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
    }
    
    .download-btn i {
        margin-right: 8px;
    }
</style>

<center><div class="section-title">Now Playing</div></center>

<!-- Thêm thông báo lỗi tải nhạc nếu có -->
<?php if (isset($_SESSION['download_error'])): ?>
    <div class="alert alert-danger">
        <i class="fas fa-exclamation-circle"></i> 
        <?php 
            echo $_SESSION['download_error']; 
            unset($_SESSION['download_error']); 
        ?>
    </div>
<?php endif; ?>

<section class="content">
    <?php if (!empty($row)): ?>
        <div class="song-container">
            <!-- Thông tin bài hát -->
            <div class="song-info">
                <div class="song-title"><?= htmlspecialchars($row['title']) ?></div>
                <div class="song-details">
                    <p>by <?= isset($row['artist']) ? htmlspecialchars($row['artist']) : 'Unknown' ?></p>
                    <p>Views: <?= htmlspecialchars($row['views']) ?> | Date added: <?= isset($row['date_added']) ? date("d M, Y", strtotime($row['date_added'])) : 'Unknown' ?></p>
                </div>
            </div>

            <!-- Nút tải nhạc nếu đủ tiền -->
            <?php if(logged_in()): ?>
                <?php if(is_admin()): ?>
                    <a href="<?=ROOT?>/download/<?=$row['slug']?>" class="download-btn">
                        <i class="fas fa-download"></i> Tải nhạc (Miễn phí - Admin)
                    </a>
                <?php else: ?>
                    <form action="<?=ROOT?>/song/<?=$row['slug']?>" method="POST">
                        <button type="submit" name="download" class="download-btn">
                            <i class="fas fa-download"></i> Tải nhạc (1.000 đồng)
                        </button>
                    </form>
                    <p class="mt-2 text-muted">
                        <small>Số dư hiện tại: <?=number_format(getUserBalance(user('id')), 0, ',', '.')?> đồng</small>
                    </p>
                <?php endif; ?>
            <?php else: ?>
                <div class="error-message">Bạn cần đăng nhập để tải nhạc. <a href="<?=ROOT?>/login">Đăng nhập</a></div>
            <?php endif; ?>
        </div>
    <?php else: ?>
        <div class="no-song">
            <p>Sorry, the song you are looking for does not exist.</p>
        </div>
    <?php endif; ?>
</section>

<?php require page('includes/footer')?>
