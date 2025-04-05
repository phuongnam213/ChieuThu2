<?php
// Đảm bảo user đã đăng nhập
if(!logged_in()) {
    message("Bạn cần đăng nhập để xem trang này");
    redirect('login');
}

// Lấy thông tin user hiện tại
$user_id = user('id');
$query = "select * from users where id = :id limit 1";
$row = db_query_one($query, ['id' => $user_id]);

// Xử lý form submit
if($_SERVER['REQUEST_METHOD'] == "POST")
{
    $errors = [];

    // Kiểm tra mật khẩu (nếu có)
    if(!empty($_POST['password']))
    {
        if($_POST['password'] != $_POST['retype_password']){
            $errors['password'] = "Mật khẩu không khớp";
        }else
        if(strlen($_POST['password']) < 8)
        {
            $errors['password'] = "Mật khẩu phải có ít nhất 8 ký tự";
        }
    }

    // Nếu không có lỗi, cập nhật thông tin
    if(empty($errors))
    {
        $values = [];
        $values['id'] = $user_id;

        $query = ""; // Không cập nhật gì nếu không có mật khẩu mới

        // Nếu có mật khẩu mới, chỉ cập nhật mật khẩu
        if(!empty($_POST['password']))
        {
            $query = "update users set password = :password where id = :id limit 1";
            $values['password'] = password_hash($_POST['password'], PASSWORD_DEFAULT);
            
            db_query($query, $values);

            // Cập nhật thông tin session
            $new_data = db_query_one("select * from users where id = :id limit 1", ['id' => $user_id]);
            if($new_data) {
                authenticate($new_data);
            }

            message("Mật khẩu đã được cập nhật thành công");
            redirect('profile');
        }
    }
}
?>

<?php require page('includes/header')?>

<div class="profile">
    <div class="profile__header">
        <h1 class="profile__title">Trang cá nhân</h1>
        <p class="profile__subtitle">Xem và cập nhật thông tin cá nhân của bạn</p>
    </div>
    
    <div class="profile__content">
        <div class="profile__sidebar">
            <div class="profile-card">
                <div class="user-avatar">
                    <img src="<?=ROOT?>/assets/images/default-avatar.jpg" alt="User Avatar" class="user-avatar__img">
                    <div class="user-avatar__name"><?=esc(user('username'))?></div>
                    <div class="user-avatar__role"><?=ucfirst(user('role'))?></div>
                </div>
                
                <ul class="user-nav">
                    <li class="user-nav__item user-nav__item--active">
                        <a href="<?=ROOT?>/profile" class="user-nav__link">
                            <i class="fas fa-user"></i> Thông tin cá nhân
                        </a>
                    </li>
                    <li class="user-nav__item">
                        <a href="<?=ROOT?>/favorites" class="user-nav__link">
                            <i class="fas fa-heart"></i> Bài hát yêu thích
                        </a>
                    </li>
                    <li class="user-nav__item">
                        <a href="<?=ROOT?>/playlists" class="user-nav__link">
                            <i class="fas fa-list"></i> Danh sách phát
                        </a>
                    </li>
                    <li class="user-nav__item">
                        <a href="<?=ROOT?>/logout" class="user-nav__link">
                            <i class="fas fa-sign-out-alt"></i> Đăng xuất
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        
        <div class="profile__main">
            <div class="profile-card">
                <div class="profile-card__header">
                    <h3 class="profile-card__header-title"><i class="fas fa-lock"></i> Đổi mật khẩu</h3>
                </div>
                
                <div class="profile-card__body">
                    <?php if(message()): ?>
                        <div class="success-alert">
                            <i class="fas fa-check-circle"></i> <?=message('', true)?>
                        </div>
                    <?php endif; ?>

                    <form method="post" class="profile-form">
                        <div class="form__group">
                            <label for="username" class="profile-form__label">Tên người dùng <span class="info-badge">Chỉ xem</span></label>
                            <input type="text" id="username" class="profile-form__control profile-form__control--readonly" value="<?=esc($row['username'])?>" readonly>
                        </div>

                        <div class="form__group">
                            <label for="email" class="profile-form__label">Email <span class="info-badge">Chỉ xem</span></label>
                            <input type="email" id="email" class="profile-form__control profile-form__control--readonly" value="<?=esc($row['email'])?>" readonly>
                        </div>

                        <div class="form__group">
                            <label for="password" class="profile-form__label">Mật khẩu mới</label>
                            <input type="password" id="password" name="password" class="profile-form__control" placeholder="Nhập mật khẩu mới nếu muốn thay đổi">
                            <?php if(!empty($errors['password'])): ?>
                                <small class="error-message"><i class="fas fa-exclamation-circle"></i> <?=$errors['password']?></small>
                            <?php endif; ?>
                        </div>

                        <div class="form__group">
                            <label for="retype_password" class="profile-form__label">Nhập lại mật khẩu mới</label>
                            <input type="password" id="retype_password" name="retype_password" class="profile-form__control" placeholder="Nhập lại mật khẩu mới">
                        </div>

                        <button type="submit" class="profile-form__submit">
                            <i class="fas fa-save"></i> Cập nhật mật khẩu
                        </button>
                    </form>
                </div>
            </div>
            
            <div class="profile-card">
                <div class="profile-card__header">
                    <h3 class="profile-card__header-title"><i class="fas fa-info-circle"></i> Thông tin tài khoản</h3>
                </div>
                
                <div class="profile-card__body">
                    <div class="user-info__item">
                        <div class="user-info__icon">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="user-info__text">
                            <div class="user-info__label">Tên người dùng</div>
                            <div class="user-info__value"><?=esc($row['username'])?></div>
                        </div>
                    </div>
                    
                    <div class="user-info__item">
                        <div class="user-info__icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div class="user-info__text">
                            <div class="user-info__label">Email</div>
                            <div class="user-info__value"><?=esc($row['email'])?></div>
                        </div>
                    </div>
                    
                    <div class="user-info__item">
                        <div class="user-info__icon">
                            <i class="fas fa-user-tag"></i>
                        </div>
                        <div class="user-info__text">
                            <div class="user-info__label">Vai trò</div>
                            <div class="user-info__value"><?=ucfirst($row['role'])?></div>
                        </div>
                    </div>
                    
                    <div class="user-info__item">
                        <div class="user-info__icon">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <div class="user-info__text">
                            <div class="user-info__label">Ngày tham gia</div>
                            <div class="user-info__value"><?=get_date($row['date'])?></div>
                        </div>
                    </div>
                    
                    <p style="margin-top: 20px; color: #666; font-size: 14px;">
                        <i class="fas fa-info-circle"></i> Nếu bạn muốn thay đổi tên người dùng hoặc email, vui lòng liên hệ với quản trị viên.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<?php require page('includes/footer')?>