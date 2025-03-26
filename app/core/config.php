<?php 

if($_SERVER['SERVER_NAME'] == "localhost")
{
	//for local server
	define("ROOT", "http://localhost:8080/chieuthu2/public");

	define("DBDRIVER", "mysql");
	define("DBHOST", "localhost");
	define("DBUSER", "root");
	define("DBPASS", "");
	define("DBNAME", "music_website_db");

}else{

	//for online server
	define("ROOT", "http://www.mywebsite.com");	

	define("DBDRIVER", "mysql");
	define("DBHOST", "localhost");
	define("DBUSER", "root");
	define("DBPASS", "");
	define("DBNAME", "music_website_db");
}
