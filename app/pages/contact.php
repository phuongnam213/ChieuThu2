<?php
require page('includes/header');

// Sử dụng thư viện PHPMailer


// Nếu form được submit
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $message = $_POST['message'];
}
?>

<head>
    <link rel="stylesheet" type="text/css" href="<?= ROOT ?>/assets/css/contact.css">
    <title>Contact Us</title>
</head>


<div class="contact-container">
    <div class="contact-heading">
        <h2>Contact Us</h2>
        <p>If you have any questions or need assistance, feel free to reach out to us through the following channels:</p>
    </div>

    <?php if (message()): ?>
        <div class="alert" style="margin-bottom: 30px; text-align: center;">
            <i class="fas fa-info-circle"></i> <?= message('', true) ?>
        </div>
    <?php endif; ?>

    <div class="contact-grid">
        <div class="contact-info">
            <div class="contact-info-item">
                <h4><i class="fas fa-phone-alt"></i> Phone Number</h4>
                <p>+1 (123) 456-7890</p>
            </div>

            <div class="contact-info-item">
                <h4><i class="fas fa-envelope"></i> Email</h4>
                <p><a href="mailto:support@soundwave.com">support@soundwave.com</a></p>
            </div>

            <div class="contact-info-item">
                <h4><i class="fas fa-map-marker-alt"></i> Address</h4>
                <p>123 Music Lane, Suite 101<br> New York, NY 10001</p>
            </div>

            <div class="contact-info-item">
                <h4><i class="fas fa-clock"></i> Business Hours</h4>
                <p>Monday - Friday: 9:00 AM to 5:00 PM<br>
                    Saturday: 10:00 AM to 2:00 PM<br>
                    Sunday: Closed</p>
            </div>

            <div class="social-media">
                <h4><i class="fas fa-share-alt"></i> Connect With Us</h4>
                <div class="social-icons">
                    <a href="https://facebook.com/yourpage" target="_blank" class="social-icon">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="https://twitter.com/yourpage" target="_blank" class="social-icon">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="https://instagram.com/yourpage" target="_blank" class="social-icon">
                        <i class="fab fa-instagram"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="contact-form">
            <h4>Send Us a Message</h4>
            <form method="post" action="">
                <div class="form-group">
                    <label for="name">Your Name</label>
                    <input type="text" class="form-input" id="name" name="name" required>
                </div>

                <div class="form-group">
                    <label for="email">Your Email</label>
                    <input type="email" class="form-input" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="message">Your Message</label>
                    <textarea class="form-input" id="message" name="message" rows="5" required></textarea>
                </div>

                <button type="submit" class="form-button">
                    <i class="fas fa-paper-plane"></i> Send Message
                </button>
            </form>
        </div>
    </div>
</div>

<?php require page('includes/footer') ?>