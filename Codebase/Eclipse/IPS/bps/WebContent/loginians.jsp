<%-- 
    Document   : loginians
    Created on : 20 Oct, 2010, 4:41:52 PM
    Author     : anand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: IGNOU Prashnottari Sewa::</title>

<style type="text/css">
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 13px;
}
</style></head>

<body  onload= "window.status = 'Welcome to IGNOU Prashnottri Sewa';">
    <form name="form1" action="LoginIans" method="post">
<center>
<table width="800" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#F7EFE7">
<tr>
<td>
<table width="425" cellpadding="0" cellspacing="0">
<tr>
<td width="115"><img src="Images/head.gif" width="800" height="150" /></td>
</tr>
<tr>
<td><img src="Images/links.gif" width="500" height="27" border="0" align="right" usemap="#Map2" /></td>
</tr>
</table></td>
</tr>
<tr>
<td height="5" bgcolor="#000000"></td>
</tr>
<tr>
      <td height="21" align="center"><table width="796" border="0">

  </table></td>
</tr>
<tr>
  <td height="21">&nbsp;</td>
</tr>
<tr>
    <td height="192"> <P align="justify">
    <table width="320" height="286" border="0" align="center">
                                                            <tr>
                                                                <td height="33" colspan="3"><div align="center"><strong>
                                                                Login</strong></div></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="89" height="39"><div align="right"><b>Username</b>
                                                                </div></td>
                                                                <td width="18"><div align="center">: </div></td>
                                                                <td width="191"> <div align="left">
                                                                        <input type="text" name="username">
                                                                </div></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="44"><div align="right"><b>Password</b></div></td>
                                                                <td height="44"><div align="center">: </div></td>
                                                                <td height="44"> <div align="left">
                                                                        <input type="password" name="password">
                                                                </div></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="47">

                                                                        <input type="hidden" name="usertype" value="ians">

                                                                </td>
                                                            </tr>
                                                            <%
            String Fail = (String) session.getAttribute("Fail");
            if (Fail != null) {
                out.println("<b><font color = red><div align= center>" + Fail + "</div></font></b>");
                session.invalidate();
                HttpSession sess = request.getSession();

            }
                                                            %>
                                                            <tr>
                                                                <td height="32" colspan="3"> <div align="center">
                                                                        <input type="submit" name="Submit" value="Login">
                                                                        <input type="reset" name="Submit2" value="Reset">
                                                                </div></td>
                                                            </tr>

                                                    </table>
    </td>
  </tr>

<tr>
<td height="19" bgcolor="#330000"><div align="center"><font color="white" size="2"><strong>IGNOU
              Education Grid &copy; All rights reserved, ACIIL </strong>
              </font></div></td>
</tr>
</table>
</center>
</form>
<map name="Map" id="Map">
  <area shape="rect" coords="273,2,367,24" href="http://www.ignou.ac.in" target="_blank" />
  <area shape="rect" coords="182,2,243,25" href="index.html" />
</map>

<map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="index.jsp" />
<area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
<area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
</map></body>
</html>



