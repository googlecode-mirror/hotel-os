<?php

/**
 * @author quang
 * @copyright 2011
 */
require('includes/application_top.php');
    mysql_query("set names 'utf8'");
  $query = mysql_query("select room_type_name, room_type_price from room_type where room_type_categories='".$_GET['roomcat']."'");
  $options="<select>";
  while($result = mysql_fetch_array($query, MYSQL_ASSOC)){
    $options .= "<option>".$result["room_type_name"]." - ".$result["room_type_price"]."</option>";
  }  
  $options.="</select>";
?>
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="content-type" />
</head>
<body>
<?php echo $options;
print_r($_SESSION['roomtypecat']);
?>

</body>
</html>