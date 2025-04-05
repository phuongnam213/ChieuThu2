<!DOCTYPE html>
<html lang="en">
<head>
    <title>SoundWave Admin</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="<?=ROOT?>/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="<?=ROOT?>/assets/css/header.css">
    <link rel="stylesheet" type="text/css" href="<?=ROOT?>/assets/css/footer.css">
    
    <style>
        /* Admin-specific overrides */
        header {
            background: linear-gradient(135deg, #3e344e 0%, #5d4d7a 100%);
            color: white;
        }
        
        .nav-item a {
            color: rgba(255,255,255,0.9);
        }
        
        .nav-item a:hover::after {
            background: #fff;
        }
        
        .dropdown-list {
            background-color: #fff;
        }
        
        .nav-item2 a {
            color: #333;
        }
        
        .brand-name {
            color: white;
            -webkit-text-fill-color: white;
        }
        
        .brand-name .highlight {
            color: #ff3a5e;
            -webkit-text-fill-color: #ff3a5e;
        }
        
        .admin-alert {
            background-color: white;
            border-left: 4px solid #ff3a5e;
            padding: 15px 20px;
            margin: 20px auto;
            max-width: 1200px;
            border-radius: 5px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            display: flex;
            align-items: center;
            position: relative;
        }
        
        .admin-alert i {
            color: #ff3a5e;
            margin-right: 10px;
            font-size: 18px;
        }
        
        .admin-alert-close {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #aaa;
            transition: all 0.3s ease;
        }
        
        .admin-alert-close:hover {
            color: #333;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-container">
            <div class="logo-holder">
                <a href="<?=ROOT?>">
                    <img class="logo" src="<?=ROOT?>/assets/images/logo.jpg" alt="SoundWave">
                </a>
            </div>
            
            <button class="mobile-menu-btn" id="mobileMenuBtn">
                <i class="fas fa-bars"></i>
            </button>
            
            <div class="main-nav" id="mainNav">
                <div class="nav-item"><a href="<?=ROOT?>/admin"><i class="fas fa-tachometer-alt"></i> Dashboard</a></div>
                <div class="nav-item"><a href="<?=ROOT?>/admin/users"><i class="fas fa-users"></i> Users</a></div>
                <div class="nav-item"><a href="<?=ROOT?>/admin/songs"><i class="fas fa-music"></i> Songs</a></div>
                <div class="nav-item"><a href="<?=ROOT?>/admin/categories"><i class="fas fa-list"></i> Categories</a></div>
                <div class="nav-item"><a href="<?=ROOT?>/admin/artists"><i class="fas fa-microphone"></i> Artists</a></div>
                <div class="nav-item dropdown">
                    <a href="#"><i class="fas fa-user-circle"></i> <?=user('username')?></a>
                    <div class="dropdown-list">
                        <div class="nav-item2"><a href="<?=ROOT?>/admin/users/edit/"><i class="fas fa-id-card"></i> Profile</a></div>
                        <div class="nav-item2"><a href="<?=ROOT?>"><i class="fas fa-home"></i> Website</a></div>
                        <div class="nav-item2"><a href="<?=ROOT?>/logout"><i class="fas fa-sign-out-alt"></i> Logout</a></div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <?php if(message()):?>
        <div class="admin-alert">
            <i class="fas fa-info-circle"></i> <?=message('',true)?>
            <span class="admin-alert-close"><i class="fas fa-times"></i></span>
        </div>
    <?php endif;?>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Mobile Menu Toggle
            const mobileMenuBtn = document.getElementById('mobileMenuBtn');
            const mainNav = document.getElementById('mainNav');
            
            if (mobileMenuBtn) {
                mobileMenuBtn.addEventListener('click', function() {
                    mainNav.classList.toggle('active');
                    
                    // Change icon based on menu state
                    const icon = this.querySelector('i');
                    if (mainNav.classList.contains('active')) {
                        icon.classList.remove('fa-bars');
                        icon.classList.add('fa-times');
                    } else {
                        icon.classList.remove('fa-times');
                        icon.classList.add('fa-bars');
                    }
                });
            }
            
            // Alert Close Button
            const alertCloseButtons = document.querySelectorAll('.admin-alert-close');
            alertCloseButtons.forEach(button => {
                button.addEventListener('click', function() {
                    this.closest('.admin-alert').style.display = 'none';
                });
            });
        });
    </script>