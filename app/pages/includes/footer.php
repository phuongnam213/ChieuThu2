<footer>
    <div class="footer-container">
        <div class="footer-div">
            <h3>Quick Links</h3>
            <ul class="footer-links">
                <li><a href="<?=ROOT?>">Home</a></li>
                <li><a href="<?=ROOT?>/music">Music</a></li>
                <li><a href="<?=ROOT?>/about">About us</a></li>
                <li><a href="<?=ROOT?>/contact">Contact us</a></li>

                <?php if(!logged_in()):?>
                <li><a href="<?=ROOT?>/login">Login</a></li>
                <?php endif;?>
            </ul>
        </div>

        <div class="footer-div">
            <h3>Search Music</h3>
            <p>Find your favorite songs, artists, and more.</p>
            <form action="<?=ROOT?>/search" class="search-form">
                <input type="text" placeholder="Search for music" name="find" class="search-input">
                <button class="search-btn"><i class="fas fa-search"></i></button>
            </form>
        </div>

        <div class="footer-div">
            <h3>Connect With Us</h3>
            <p>Follow us on social media for updates and more.</p>
            <div class="footer-social">
                <!-- Icon Facebook -->
                <a href="https://www.facebook.com/carwyn1311" class="footer-social-icon">
                    <svg width="20" height="20" fill="white" viewBox="0 0 16 16">
                        <path
                            d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
                    </svg>
                </a>

                <!-- Icon Mail (Gmail) -->
                <a href="mailto:phucle11132003@gmail.com" class="footer-social-icon">
                    <svg width="20" height="20" fill="white" viewBox="0 0 512 512">
                        <path
                            d="M502.3 190.8L327.4 360.5c-15 13.5-36.4 21.1-58.4 21.1s-43.4-7.6-58.4-21.1L9.7 190.8C3.7 185.5 0 177.8 0 169.3c0-15.1 12.3-27.4 27.4-27.4h457.3c15.1 0 27.4 12.3 27.4 27.4 0 8.5-3.7 16.2-9.7 21.5zM0 209.9v211.2c0 15.1 12.3 27.4 27.4 27.4h457.3c15.1 0 27.4-12.3 27.4-27.4V209.9L327.4 379.6c-40.4 36.3-99.2 36.3-139.6 0L0 209.9z" />
                    </svg>
                </a>

                <!-- Icon Zalo -->
                <a href="https://zalo.me/0904752033" class="footer-social-icon">
                    <svg width="20" height="20" viewBox="0 0 512 512">
                        <circle cx="256" cy="256" r="256" fill="#0084FF" />
                        <text x="256" y="320" text-anchor="middle" font-size="200" fill="white"
                            font-family="Arial, sans-serif">Z</text>
                    </svg>
                </a>
            </div>

        </div>
    </div>

    <div class="footer-bottom" style="padding-right: 40px;">
        <p>&copy; <?=date('Y')?> Music Website.</p>
        <p>All rights reserved.</p>
    </div>

</footer>

<script src="<?=ROOT?>/assets/js/menu.js"></script>
</body>

</html>