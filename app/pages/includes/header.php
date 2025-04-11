<!DOCTYPE html>
<html lang="en">

<head>
    <title><?= ucfirst($URL[0]) ?> - Music Website</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="<?= ROOT ?>/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="<?= ROOT ?>/assets/css/header.css">
    <link rel="stylesheet" type="text/css" href="<?= ROOT ?>/assets/css/footer.css">
</head>

<body>
    <header>
        <div class="header-container">
            <div class="logo-holder">
                <a href="<?= ROOT ?>">
                    <img class="logo" src="<?= ROOT ?>/assets/images/logo.jpg" alt="Music Website">
                </a>
            </div>

            <button class="mobile-menu-btn" id="mobileMenuBtn">
                <i class="fas fa-bars"></i>
            </button>

            <div class="main-nav" id="mainNav">
                <div class="nav-item"><a href="<?= ROOT ?>">Home</a></div>
                <div class="nav-item"><a href="<?= ROOT ?>/music">Music</a></div>
                <div class="nav-item dropdown">
                    <a href="#">Category <i class="fas fa-chevron-down" style="font-size: 12px;"></i></a>

                    <?php
                    $query = "select * from categories order by category asc";
                    $categories = db_query($query);
                    ?>

                    <div class="dropdown-list">

                        <?php if (!empty($categories)): ?>
                        <?php foreach ($categories as $cat): ?>
                        <div class="nav-item2"><a
                                href="<?= ROOT ?>/category/<?= $cat['category'] ?>"><?= $cat['category'] ?></a></div>
                        <?php endforeach; ?>
                        <?php endif; ?>

                    </div>
                </div>
                <div class="nav-item"><a href="<?= ROOT ?>/artist">Artists</a></div>
                <div class="nav-item"><a href="<?= ROOT ?>/favorites">Favorites</a></div>
                <div class="nav-item"><a href="<?= ROOT ?>/about">About us</a></div>
                <div class="nav-item"><a href="<?= ROOT ?>/contact">Contact us</a></div>

                <?php if (logged_in()): ?>
                <div class="nav-item dropdown user-menu">
                    <a href="#" style="color: white;"><i class="fas fa-user-circle"></i> <?= user('username') ?></a>

                    <div class="dropdown-list">
                        <div class="nav-item2"><a href="<?= ROOT ?>/profile">Profile</a></div>

                        <?php if (is_admin()): ?>
                        <div class="nav-item2"><a href="<?= ROOT ?>/admin">Admin</a></div>
                        <?php endif; ?>

                        <div class="nav-item2"><a href="<?= ROOT ?>/logout">Logout</a></div>
                    </div>
                </div>
                <?php else: ?>
                <div class="nav-item">
                    <a href="<?= ROOT ?>/login" class="user-menu">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </a>
                </div>
                <?php endif; ?>
            </div>

            <div class="socials">
                <a href="https://www.facebook.com/carwyn1311" class="social-icon">
                    <svg viewBox="0 0 16 16">
                        <path
                            d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
                    </svg>
                </a>
                <a href="mailto:phucle11132003@gmail.com" class="social-icon">
                    <svg viewBox="0 0 512 512">
                        <path
                            d="M502.3 190.8L327.4 360.5c-15 13.5-36.4 21.1-58.4 21.1s-43.4-7.6-58.4-21.1L9.7 190.8C3.7 185.5 0 177.8 0 169.3c0-15.1 12.3-27.4 27.4-27.4h457.3c15.1 0 27.4 12.3 27.4 27.4 0 8.5-3.7 16.2-9.7 21.5zM0 209.9v211.2c0 15.1 12.3 27.4 27.4 27.4h457.3c15.1 0 27.4-12.3 27.4-27.4V209.9L327.4 379.6c-40.4 36.3-99.2 36.3-139.6 0L0 209.9z" />
                    </svg>
                </a>
                <a href="https://zalo.me/0904752033" class="social-icon">
                    <svg viewBox="0 0 512 512">
                        <circle cx="256" cy="256" r="256" fill="#0084FF" />
                        <text x="256" y="320" text-anchor="middle" font-size="200" fill="white"
                            font-family="Arial, sans-serif">Z</text>
                    </svg>
                </a>
            </div>

        </div>
    </header>