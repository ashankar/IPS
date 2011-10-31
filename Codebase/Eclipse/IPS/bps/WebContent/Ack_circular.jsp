<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  errorPage="errorqms.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: IGNOU Prashnottri Sewa ::</title>
<style type="text/css">

</style></head>

<body  onload= "window.status = 'Welcome to IGNOU Prashnottri Sewa';">
<table width="800" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr>
    <td><table width="800" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><div align="center"><img src="Images/head.gif" width="800" height="150" /></div></td>
      </tr>
      <tr>
        <td bgcolor="#F7EFE7"><div align="right"><img src="Images/links.gif" width="500" height="27" border="0" usemap="#Map2" /></div></td>
      </tr>
      <tr>
       
             
            </table></td>
      </tr>
           <tr>
        <td bgcolor="#FFFFFF"><table width="800" border="0" cellspacing="1" cellpadding="1">
        <tr> 
          <td height="291" >
<table width="800" height="289" border="0" cellpadding="1" cellspacing="1">
              <tr> 
                <td width="611" height="221" align="left"  valign="top" bgcolor="#F7EFE7">
                    <center> <h3>IGNOU Prashnottari Sewa</h3></center>
                    
                    <table border="0" align="center" width=600><tr><td>
                    <h3 align = center>Acknowledgement</h3>
                    <p>_______________________________________________________________________________</p>
                  <p>Dear User, </p>
                  <p>You have successfully posted your Circular.</p>
                  <p><b>Topic :  <%                                              
                                     out.println((String)session.getAttribute("subject"));
                                        %></b></p>
                  <p><b>Your Circular updated dated :  <%                                              
                                                     out.println((String)session.getAttribute("date"));
                                                     %></b></p>
               <p>The Circular can be viewed by any Registered Employee of IGNOU 
                   through their login</p>
                 
                  <p>Thank You,</p>
                  <p>Admin(IPS)</p>
                  <p>&nbsp; </p>
                    </td>
                   </tr>
              
            </table></td> 
              </tr>
              
            </table></td>
        </tr>
      </table></td>
      </tr>
      <tr>
        <td bgcolor="#FFFFFF">&nbsp;</td>
      </tr>
      <tr>
        
    <td bgcolor="#330000"><div align="center"><font color="#FFFFFF" size="1"><strong>IGNOU 
        Edugrid &copy; All rights reserved 2009,ACIIL</strong></font> </div></td>
      </tr>
    
  </table> 
<map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
    </map>
</body>
</html>
