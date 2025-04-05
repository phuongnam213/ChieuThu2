<footer>
    <div class="footer-container">
        <div class="footer-div">
            <h3>Admin Quick Links</h3>
            <ul class="footer-links">
                <li><a href="<?=ROOT?>/admin">Dashboard</a></li>
                <li><a href="<?=ROOT?>/admin/users">Users</a></li>
                <li><a href="<?=ROOT?>/admin/songs">Songs</a></li>
                <li><a href="<?=ROOT?>/admin/categories">Categories</a></li>
                <li><a href="<?=ROOT?>/admin/artists">Artists</a></li>
            </ul>
        </div>
        
        <div class="footer-div">
            <h3>Site Management</h3>
            <ul class="footer-links">
                <li><a href="<?=ROOT?>/admin/settings">Settings</a></li>
                <li><a href="<?=ROOT?>/admin/backup">Backup</a></li>
                <li><a href="<?=ROOT?>/admin/stats">Statistics</a></li>
                <li><a href="<?=ROOT?>/admin/reports">Reports</a></li>
            </ul>
        </div>
        
        <div class="footer-div">
            <h3>Return to Website</h3>
            <p>Back to main website or logout from the admin panel.</p>
            <div class="footer-social" style="margin-top: 15px;">
                <a href="<?=ROOT?>" class="footer-social-icon">
                    <i class="fas fa-home" style="color: white;"></i>
                </a>
                <a href="<?=ROOT?>/logout" class="footer-social-icon">
                    <i class="fas fa-sign-out-alt" style="color: white;"></i>
                </a>
            </div>
        </div>
    </div>
    
    <div class="footer-bottom">
        <p>&copy; <?=date('Y')?> SoundWave Admin Panel. All rights reserved.</p>
    </div>
</footer>

<script src="<?=ROOT?>/assets/js/menu.js"></script>
</body>
</html>