<?php
// Kiểm tra đăng nhập
if(!logged_in()) {
    message("Bạn cần đăng nhập để nạp tiền");
    redirect('login');
}

$user_id = user('id');
$success = false;
$error = '';

// Xử lý form nạp tiền
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Nếu là admin và có tham số target_user_id, nạp tiền cho người dùng đó
    if(is_admin() && isset($_POST['target_user_id'])) {
        $target_user_id = (int)$_POST['target_user_id'];
        $amount = isset($_POST['amount']) ? (float)$_POST['amount'] : 0;
        
        // Kiểm tra người dùng tồn tại
        $target_user = db_query_one("SELECT * FROM users WHERE id = :id", ['id' => $target_user_id]);
        if(!$target_user) {
            $error = 'Người dùng không tồn tại';
        } else if($amount < 1000) {
            $error = 'Số tiền nạp tối thiểu là 1.000 đồng';
        } else {
            // Nạp tiền cho người dùng
            if(updateUserBalance($target_user_id, $amount)) {
                $success = true;
                $success_message = "Đã nạp " . number_format($amount, 0, ',', '.') . " đồng cho " . $target_user['username'];
            } else {
                $error = 'Có lỗi xảy ra khi nạp tiền. Vui lòng thử lại sau.';
            }
        }
    } else {
        // Người dùng thông thường nạp tiền cho chính mình
        $amount = isset($_POST['amount']) ? (float)$_POST['amount'] : 0;
        
        // Kiểm tra số tiền hợp lệ
        if($amount < 10000) {
            $error = 'Số tiền nạp tối thiểu là 10.000 đồng';
        } else {
            // Trong thực tế, ở đây sẽ tích hợp với cổng thanh toán
            // Giả lập việc nạp tiền thành công
            if(updateUserBalance($user_id, $amount)) {
                $success = true;
            } else {
                $error = 'Có lỗi xảy ra khi nạp tiền. Vui lòng thử lại sau.';
            }
        }
    }
}

// Lấy danh sách người dùng nếu là admin
$users = [];
if(is_admin()) {
    $users = db_query("SELECT id, username, email FROM users WHERE role != 'admin' ORDER BY username ASC");
}
?>

<?php require page('includes/header')?>

<style>
    .deposit-container {
        max-width: 800px;
        margin: 40px auto;
        padding: 0 20px;
    }
    
    .deposit-header {
        text-align: center;
        margin-bottom: 30px;
    }
    
    .deposit-title {
        font-size: 28px;
        font-weight: 700;
        color: var(--dark-color);
        position: relative;
        display: inline-block;
        margin-bottom: 10px;
    }
    
    .deposit-title:after {
        content: '';
        position: absolute;
        width: 50px;
        height: 3px;
        background: var(--gradient);
        bottom: -10px;
        left: 50%;
        transform: translateX(-50%);
    }
    
    .deposit-card {
        background-color: white;
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        overflow: hidden;
        padding: 0;
    }
    
    .deposit-card-header {
        background: var(--gradient);
        color: white;
        padding: 20px 25px;
        position: relative;
    }
    
    .deposit-card-header h3 {
        margin: 0;
        font-size: 20px;
        font-weight: 600;
        display: flex;
        align-items: center;
    }
    
    .deposit-card-header h3 i {
        margin-right: 10px;
    }
    
    .deposit-card-body {
        padding: 25px;
    }
    
    .deposit-form .input-group {
        margin-bottom: 25px;
    }
    
    .deposit-form label {
        display: block;
        margin-bottom: 8px;
        font-weight: 500;
        color: #444;
    }
    
    .deposit-form .form-control {
        width: 100%;
        padding: 12px 15px;
        border: 1px solid #e1e1e1;
        border-radius: 8px;
        font-size: 15px;
        transition: all 0.3s ease;
    }
    
    .deposit-form .form-control:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 10px rgba(106, 17, 203, 0.1);
        outline: none;
    }
    
    .deposit-submit-btn {
        padding: 12px 25px;
        background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
        margin-right: 10px;
    }
    
    .deposit-submit-btn i {
        margin-right: 8px;
    }
    
    .deposit-submit-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(106, 17, 203, 0.2);
    }
    
    .deposit-cancel-btn {
        padding: 12px 25px;
        background: #f1f1f1;
        color: #444;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
        text-decoration: none;
    }
    
    .deposit-cancel-btn i {
        margin-right: 8px;
    }
    
    .deposit-cancel-btn:hover {
        background: #e1e1e1;
    }
    
    .alert {
        padding: 15px;
        margin-bottom: 20px;
        border: 1px solid transparent;
        border-radius: 8px;
    }
    
    .alert-success {
        color: #155724;
        background-color: #d4edda;
        border-color: #c3e6cb;
    }
    
    .alert-danger {
        color: #721c24;
        background-color: #f8d7da;
        border-color: #f5c6cb;
    }
</style>

<div class="deposit-container">
    <div class="deposit-header">
        <h1 class="deposit-title">Nạp tiền vào tài khoản</h1>
    </div>
    
    <div class="deposit-card">
        <div class="deposit-card-header">
            <h3><i class="fas fa-wallet"></i> Nạp tiền</h3>
        </div>
        
        <div class="deposit-card-body">
            <?php if ($success): ?>
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i> 
                    <?php if(isset($success_message)): ?>
                        <?=$success_message?>
                    <?php else: ?>
                        Nạp tiền thành công! Số dư hiện tại của bạn là: 
                        <?=number_format(getUserBalance($user_id), 0, ',', '.')?> đồng
                    <?php endif; ?>
                </div>
                <a href="<?=ROOT?>/profile" class="deposit-submit-btn">
                    <i class="fas fa-user"></i> Quay lại trang cá nhân
                </a>
            <?php elseif ($error): ?>
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-circle"></i> <?=$error?>
                </div>
                <a href="<?=ROOT?>/profile" class="deposit-submit-btn">
                    <i class="fas fa-user"></i> Quay lại trang cá nhân
                </a>
            <?php else: ?>
                <form action="<?=ROOT?>/deposit" method="post" class="deposit-form">
                    <?php if(is_admin() && !empty($users)): ?>
                        <div class="input-group">
                            <label for="target_user_id">Nạp tiền cho:</label>
                            <select class="form-control" id="target_user_id" name="target_user_id">
                                <option value="<?=$user_id?>">Chính mình</option>
                                <?php foreach($users as $u): ?>
                                    <option value="<?=$u['id']?>"><?=esc($u['username'])?> (<?=esc($u['email'])?>)</option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    <?php endif; ?>
                    
                    <div class="input-group">
                        <label for="amount">Số tiền muốn nạp (đồng):</label>
                        <input type="number" class="form-control" id="amount" name="amount" min="<?=is_admin() ? 1000 : 10000?>" step="1000" value="10000">
                        <small style="color: #666; margin-top: 5px; display: block;">
                            <i class="fas fa-info-circle"></i> 
                            <?php if(is_admin()): ?>
                                Số tiền nạp tối thiểu là 1.000 đồng.
                            <?php else: ?>
                                Số tiền nạp tối thiểu là 10.000 đồng.
                            <?php endif; ?>
                        </small>
                    </div>
                    
                    <div>
                        <button type="submit" class="deposit-submit-btn">
                            <i class="fas fa-check"></i> Xác nhận nạp tiền
                        </button>
                        <a href="<?=ROOT?>/profile" class="deposit-cancel-btn">
                            <i class="fas fa-times"></i> Hủy
                        </a>
                    </div>
                </form>
            <?php endif; ?>
        </div>
    </div>
</div>

<?php require page('includes/footer')?>