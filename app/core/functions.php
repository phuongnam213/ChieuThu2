<?php 


function show($stuff)
{
	echo "<pre>";
	print_r($stuff);
	echo "</pre>";
}

function page($page) {
    // Kiểm tra xem có phải là trang admin không
    $page = strtolower($page);
    if(strpos($page, "admin") === 0) {
        return "../app/pages/".$page.".php";
    } else {
        return "../app/pages/".$page.".php";
    }
}

function db_connect()
{
	$string = DBDRIVER.":hostname=".DBHOST.";dbname=".DBNAME;
	$con = new PDO($string, DBUSER, DBPASS);

	return $con;
}

/**
 * Thực hiện truy vấn và trả về một dòng kết quả
 * 
 * @param string $query Câu truy vấn SQL
 * @param array $params Các tham số cho truy vấn
 * @param PDO $conn Kết nối cơ sở dữ liệu (tùy chọn)
 * @return array|false Mảng kết quả hoặc false nếu có lỗi
 */
function db_query_one($query, $params = [], $conn = null) {
    if ($conn === null) {
        global $conn; // Sử dụng kết nối toàn cục nếu không được truyền vào
    }
    
    try {
        $stmt = $conn->prepare($query);
        $stmt->execute($params);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result ? $result : false;
    } catch (PDOException $e) {
        error_log("Lỗi db_query_one: " . $e->getMessage());
        return false;
    }
}

/**
 * Thực hiện truy vấn và trả về tất cả các dòng kết quả
 * 
 * @param string $query Câu truy vấn SQL
 * @param array $params Các tham số cho truy vấn
 * @param PDO $conn Kết nối cơ sở dữ liệu (tùy chọn)
 * @return array|false Mảng kết quả hoặc false nếu có lỗi
 */
function db_query($query, $params = [], $conn = null) {
    if ($conn === null) {
        global $conn; // Sử dụng kết nối toàn cục nếu không được truyền vào
    }
    
    try {
        $stmt = $conn->prepare($query);
        $stmt->execute($params);
        
        // Nếu là câu lệnh INSERT, UPDATE, DELETE, trả về số dòng bị ảnh hưởng
        if (strpos(strtoupper($query), "INSERT") === 0 || 
            strpos(strtoupper($query), "UPDATE") === 0 || 
            strpos(strtoupper($query), "DELETE") === 0) {
            return $stmt->rowCount();
        }
        
        // Nếu là câu lệnh SELECT, trả về kết quả
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result ? $result : false;
    } catch (PDOException $e) {
        error_log("Lỗi db_query: " . $e->getMessage());
        return false;
    }
}

function message($message = '', $clear = false)
{
	if(!empty($message)){
		$_SESSION['message'] = $message;
	}else{

		if(!empty($_SESSION['message'])){

			$msg = $_SESSION['message'];
			if($clear){
				unset($_SESSION['message']);
			}
			return $msg;
		}

	}
	return false;
}

function redirect($page)
{
	header("Location: ".ROOT."/".$page);
	die;
}

function set_value($key, $default = '')
{
	if(!empty($_POST[$key]))
	{
		return $_POST[$key];
	}else{

		return $default;
	}

	return '';
}

function set_select($key, $value, $default = '')
{
	if(!empty($_POST[$key]))
	{
		if($_POST[$key] == $value){
			return " selected ";
		}
	}else{
		if($default == $value){
			return " selected ";
		}
	}

	return '';
}

function get_date($date)
{
	return date("jS M, Y",strtotime($date));
}

function logged_in()
{

	if(!empty($_SESSION['USER']) && is_array($_SESSION['USER'])){
		return true;
	}

	return false;
}

function is_admin()
{

	if(!empty($_SESSION['USER']['role']) && $_SESSION['USER']['role'] == 'admin'){
		return true;
	}

	return false;
}

function user($column)
{
	if(!empty($_SESSION['USER'][$column])){
		return $_SESSION['USER'][$column];
	}

	return "Unknown";
}

function authenticate($row)
{
	$_SESSION['USER'] = $row;
}

function str_to_url($url)
{

	$url = str_replace("'", "", $url);
   	$url = preg_replace('~[^\\pL0-9_]+~u', '-', $url);
   	$url = trim($url, "-");
   	$url = iconv("utf-8", "us-ascii//TRANSLIT", $url);
   	$url = strtolower($url);
   	$url = preg_replace('~[^-a-z0-9_]+~', '', $url);
   	
   	return $url;
}

function get_category($id)
{
	$query = "select category from categories where id = :id limit 1";
	$row = db_query_one($query,['id'=>$id]);

	if(!empty($row['category']))
	{
		return $row['category'];
	}

	return "Unknown";
}

function esc($str)
{
	return nl2br(htmlspecialchars($str));
}

function get_artist($id)
{
	$query = "select name from artists where id = :id limit 1";
	$row = db_query_one($query,['id'=>$id]);

	if(!empty($row['name']))
	{
		return $row['name'];
	}

	return "Unknown";
}

/**
 * Lấy số dư tài khoản của người dùng
 * 
 * @param int $user_id ID của người dùng
 * @param PDO $conn Kết nối cơ sở dữ liệu (tùy chọn)
 * @return float Số dư tài khoản
 */
function getUserBalance($user_id, $conn = null) {
    if ($conn === null) {
        global $conn; // Sử dụng kết nối toàn cục nếu không được truyền vào
    }
    
    $query = "SELECT balance FROM users WHERE id = :id LIMIT 1";
    $row = db_query_one($query, ['id' => $user_id], $conn);
    
    if ($row && isset($row['balance'])) {
        return (float)$row['balance'];
    }
    
    return 0.00;
}

/**
 * Cập nhật số dư tài khoản của người dùng
 * 
 * @param int $user_id ID của người dùng
 * @param float $amount Số tiền cần cập nhật (dương: nạp tiền, âm: trừ tiền)
 * @param PDO $conn Kết nối cơ sở dữ liệu (tùy chọn)
 * @return bool Trạng thái cập nhật
 */
function updateUserBalance($user_id, $amount, $conn = null) {
    if ($conn === null) {
        global $conn; // Sử dụng kết nối toàn cục nếu không được truyền vào
    }
    
    $query = "UPDATE users SET balance = balance + :amount WHERE id = :id LIMIT 1";
    return db_query($query, ['amount' => $amount, 'id' => $user_id], $conn);
}

/**
 * Kiểm tra xem người dùng có đủ số dư để tải nhạc không
 * 
 * @param int $user_id ID của người dùng
 * @param float $required_amount Số tiền cần thiết
 * @param PDO $conn Kết nối cơ sở dữ liệu (tùy chọn)
 * @return bool True nếu đủ số dư, ngược lại là False
 */
function hasEnoughBalance($user_id, $required_amount, $conn = null) {
    if ($conn === null) {
        global $conn; // Sử dụng kết nối toàn cục nếu không được truyền vào
    }
    
    $balance = getUserBalance($user_id, $conn);
    return $balance >= $required_amount;
}

/**
 * Trừ tiền khi người dùng tải nhạc
 * 
 * @param int $user_id ID của người dùng
 * @param float $amount Số tiền cần trừ
 * @param PDO $conn Kết nối cơ sở dữ liệu (tùy chọn)
 * @return bool Trạng thái trừ tiền
 */
function deductBalance($user_id, $amount, $conn = null) {
    if ($conn === null) {
        global $conn; // Sử dụng kết nối toàn cục nếu không được truyền vào
    }
    
    return updateUserBalance($user_id, -$amount, $conn);
}