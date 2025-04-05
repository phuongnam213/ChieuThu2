<?php

// Kiểm tra quyền admin
if(!is_admin()) {
    message("Bạn không có quyền truy cập trang này");
    redirect('login');
}

// Xử lý form nạp tiền cho người dùng
if($_SERVER['REQUEST_METHOD'] == "POST" && isset($_POST['user_id']) && isset($_POST['amount'])) {
    $user_id = (int)$_POST['user_id'];
    $amount = (float)$_POST['amount'];
    
    // Kiểm tra người dùng tồn tại
    $user = db_query_one("SELECT * FROM users WHERE id = :id", ['id' => $user_id]);
    if(!$user) {
        $error = "Người dùng không tồn tại";
    } else if($amount == 0) {
        $error = "Số tiền không thể bằng 0";
    } else if($amount < 0 && getUserBalance($user_id) < abs($amount)) {
        $error = "Số dư của người dùng không đủ để trừ " . number_format(abs($amount), 0, ',', '.') . " đồng";
    } else {
        // Cập nhật số dư
        if(updateUserBalance($user_id, $amount)) {
            if($amount > 0) {
                message("Đã nạp " . number_format($amount, 0, ',', '.') . " đồng cho người dùng " . $user['username']);
            } else {
                message("Đã trừ " . number_format(abs($amount), 0, ',', '.') . " đồng từ người dùng " . $user['username']);
            }
            redirect('admin/balance');
        } else {
            $error = "Có lỗi xảy ra khi cập nhật số dư";
        }
    }
}

// Lấy danh sách người dùng
$users = db_query("SELECT * FROM users ORDER BY id ASC");
?>

<?php require page('includes/admin-header')?>

<div class="container-fluid">
    <h1 class="mt-4">Quản lý số dư người dùng</h1>
    
    <?php if(isset($error)): ?>
        <div class="alert alert-danger"><?=$error?></div>
    <?php endif; ?>
    
    <?php if(message()): ?>
        <div class="alert alert-success"><?=message('', true)?></div>
    <?php endif; ?>
    
    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table mr-1"></i>
            Danh sách người dùng
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên người dùng</th>
                            <th>Email</th>
                            <th>Vai trò</th>
                            <th>Số dư</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if($users): ?>
                            <?php foreach($users as $user): ?>
                                <tr>
                                    <td><?=$user['id']?></td>
                                    <td><?=esc($user['username'])?></td>
                                    <td><?=esc($user['email'])?></td>
                                    <td><?=ucfirst($user['role'])?></td>
                                    <td><?=number_format(getUserBalance($user['id']), 0, ',', '.')?> đồng</td>
                                    <td>
                                        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#depositModal<?=$user['id']?>">
                                            Nạp tiền
                                        </button>
                                        
                                        <!-- Modal Nạp tiền -->
                                        <div class="modal fade" id="depositModal<?=$user['id']?>" tabindex="-1" role="dialog" aria-labelledby="depositModalLabel<?=$user['id']?>" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="depositModalLabel<?=$user['id']?>">Nạp tiền cho <?=esc($user['username'])?></h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <form method="post">
                                                        <div class="modal-body">
                                                            <input type="hidden" name="user_id" value="<?=$user['id']?>">
                                                            <div class="form-group">
                                                                <label for="amount<?=$user['id']?>">Số tiền (đồng):</label>
                                                                <input type="number" class="form-control" id="amount<?=$user['id']?>" name="amount" value="10000" step="1000">
                                                                <small class="form-text text-muted">Nhập số âm để trừ tiền.</small>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        <?php else: ?>
                            <tr>
                                <td colspan="6" class="text-center">Không có người dùng nào</td>
                            </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<?php require page('includes/admin-footer')?>