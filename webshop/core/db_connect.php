<?php
session_start();

$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "webshop";

$con = new mysqli($dbhost, $dbuser, $dbpass, $dbname);

if ($con->connect_errno) {
    echo "Failed to connect to MySQL: " . $con->connect_error;
    exit();
}

define("BASEURL", "http://domain.tld/");
define("BASEURL_CMS", "http://domain.tld/admin/");

function prettyDump($var) {
    echo "<pre>";
    var_dump($var);
    echo "</pre>";
}
