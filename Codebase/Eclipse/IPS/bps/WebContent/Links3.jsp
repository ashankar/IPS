<%@ page  errorPage="errorqms.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>:: IGNOU Query Management System ::</title>

<style type="text/css">
</style>
 <link rel="stylesheet" type="text/css" href="ddsmoothmenu.css" />
<link rel="stylesheet" type="text/css" href="ddsmoothmenu-v.css" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
<script type="text/javascript" src="ddsmoothmenu.js">
</script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "smoothmenu1", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

ddsmoothmenu.init({
	mainmenuid: "smoothmenu2", //Menu DIV id
	orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
	//customtheme: ["#804000", "#482400"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>
</head>
  <body>
    <table>
          
          <tr>
               <td bgcolor="#FFFFFF"><table width="800" border="0" cellspacing="1" cellpadding="1"></table></td>
    </tr>    </table>
<div id="smoothmenu1" class="ddsmoothmenu">
<ul>
<li><a href="Home.jsp">Home</a></li>
<li><a href="Report.jsp">Reports</a></li>
 <li><a href="adminquery.jsp">New Query</a></li>
 <li><a href="AdminPendingQuery.jsp">Pending Query</a></li>
 <li><a href="AdminAnsweredQuery.jsp">Answered Query</a>
  <li><a href="admin_reg.jsp">Register</a></li>
<li><a href="FAQ.jsp">FAQ</a></li>
<li><right><a href="ChangePassword.jsp">Edit Password</a></right></li>
<li><right><a href="Logout.jsp">Logout</a></right></li>
</ul>
<br style="clear: left" />
</div> 
</body> 
</html>
      