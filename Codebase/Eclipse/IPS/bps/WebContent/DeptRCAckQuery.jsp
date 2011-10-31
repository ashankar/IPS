<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  errorPage="errorqms.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: IGNOU Prashnottari Sewa ::</title>
<style type="text/css">

</style></head>

<body  onload= "window.status = 'Welcome to IGNOU Prashnottri Sewa';">
 <table width="800" border="0" align="center" cellpadding="1" cellspacing="1">
   <tr>
       <td>
         <table width="800" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><div align="center"><img src="Images/head.gif" width="800" height="150" /></div></td>
            </tr>
            <tr>
            <td bgcolor="#F7EFE7"><div align="right"><img src="Images/links.gif" width="500" height="27" border="0" usemap="#Map2" /></div></td>
           </tr>                
            </table></td>
      </tr>
           <tr>
        <td bgcolor="#FFFFFF"><table width="800" border="0" cellspacing="1" cellpadding="1">
        <tr> 
          <td height="291" >
            <table width="800" align = "center" height="289" border="0" cellpadding="1" cellspacing="1">
             <tr>
                        <td height="5" colspan="3" bgcolor="#000000" align = "center"></td>
                    </tr>
              <tr> 
                <td width="800" height="221" align="center"  valign="top" bgcolor="#F7EFE7">
                  <table align = "center" width = "700"><tr><td align = "left">
                    <h2 align = "center"><u>IGNOU Prashnottari Sewa </u></h2>
                    <h3 align = center><u> Query Acknowledgement</u></h3>
                  <b><p>Dear User, </p>
                  <p>You have successfully posted your query.</p>
                  
                  <p><h3>Your Token No is :  <%                                              
                                                     out.println((String)session.getAttribute("Token"));
                                                     

                                                     %></h3></p>
               <p>The query will be 
                    answered by our experts</p>
                  <p>within the best possible time.Please check your email_id 
                    or login to the portal to view answers.</p>
                  <p></p>
                  <p>Thank You,</p>
                  <p>Admin(IPS)</p>
                  <p>&nbsp; </p>
                    </td>
              </tr>
              </td></tr>
            </table></td>
        </tr>
      </table></td>
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
