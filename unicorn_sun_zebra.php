<?php

// File: project home.php

// Create session
session_start();

// Include configuration
include("config.php");

// HTML header
echo "<html>";
echo "<head><title>Project Home</title></head>";

// Body
echo "<body>";

// Check for user session
if(isset($_SESSION['user'])){

// Display content
    // Project title
    echo "<h1>My Project Home</h1>";
    // Nav
    echo "<ul>";
    echo "<li><a href='page1.php'>Page 1</a></li>";
    echo "<li><a href='page2.php'>Page 2</a></li>";
    echo "<li><a href='page3.php'>Page 3</a></li>";
    echo "</ul>";

} else {

// Redirect to login
    header("Location : login.php");
    exit;

}

// HTML footer
echo "</body>";
echo "</html>";

// Include database connection
include("db_connect.php");

// Query database
$query = "SELECT * FROM project_data";
$result = mysql_query($query);
$num_rows = mysql_num_rows($result);

// Output data
while($row = mysql_fetch_array($result)){
    echo "<p>". $row['name'] . ": " . $row['data'] . "</p>";
}

// Close database connection
mysql_close();

?>