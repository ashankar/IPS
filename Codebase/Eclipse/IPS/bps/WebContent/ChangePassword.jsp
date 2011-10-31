<%@ page  errorPage="errorqms.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>::IGNOU-Query Management System::</title>
    <script type="text/javascript">
   
 function validateFormOnSubmit(AdminForm) {
        var reason = "";
        reason+= confirmpass(AdminForm.NPassword,AdminForm.CFPassword);
        reason+= validatePassword(AdminForm.CPassword); 
        if (reason != "") {
            alert("Some fields need correction:\n" + reason);
            return false;
        }
        return true;
    }
   
     function validatePassword(fld) {
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers 
 
    if (fld.value == "") {
        fld.style.background =  '#F5D0A9';
        error = "Password Field cannot be left blank\n";
    } else if ((fld.value.length < 2)) {
        error = "Password length can not be less than 2 characters\n";
        fld.style.background =  '#F5D0A9';
    } else if (illegalChars.test(fld.value)) {
        error = "Password contains illegal characters, please retype the password.\n";
        fld.style.background =  '#F5D0A9';
    } 
    /*else if (!((fld.value.search(/(a-z)+/)) && (fld.value.search(/(0-9)+/)))) {
        error = "The password must contain at least one numeral.\n";
        fld.style.background = 'Yellow';
    }*/ else {
        fld.style.background = 'White';
    }
   return error;
}   
function confirmpass(fld,cfld)
{ 
var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers 
 
    if (cfld.value == "") {
         error = " The Confirm Password field can not be left blank\n";
        cfld.style.background =  '#F5D0A9';
    } else if ((cfld.value.length < 4)) {
        error = "Password length can not be less than 4 characters.\n";
        cfld.style.background =  '#F5D0A9';
    } else if (illegalChars.test(cfld.value)) {
        error = "Please Retype the password..\n";
        cfld.style.background =  '#F5D0A9';
    } 
   
  else if(cfld.value!=fld.value)  
       {
            error = "Password mismatch please retype your password.\n";
      
             fld.style.background = '#F5D0A9'; 
       }
    
        else {
            fld.style.background = 'White';
        }
        return error;
           
}
   </script></head> 
 
<body>
    <form name = "AdminForm" action = "ChangePassword" onsubmit="return validateFormOnSubmit(this)" method = "post">
    
    <center>
                <table width="800" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#F7EFE7">
                    <tr>  <td><table width="800" border="0" cellspacing="0" cellpadding="0">
                        <td colspan="3">
                            <table width="425" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="115"><img src="Images/head.gif" width="800" height="150" /></td>
                                </tr>
                                <tr>
                                    <td><img src="Images/links.gif" width="500" height="27" border="0" align="right" usemap="#Map2" /></td>
                                </tr>
                        </table></td></tr>  
                      <tr>
                        <td height="5" colspan="3" bgcolor="#000000"></td>
                    </tr>
                  </table>
              <%
                 String User = (String)session.getAttribute("User");//get the user information from Login.java
                 if(User == null)
                    {
                  RequestDispatcher view =  request.getRequestDispatcher("index.jsp");//if user name is null than forward request to index.jsp.
                  view.forward(request,response);
                    }
                 else
                   {       %>
            <table align="center" bgcolor="#F7EFE7" ><tr> <td width="800" valign="top" align="center" >
            <tr><td align = "center">
                          <font size="2" face="Verdana, Arial, Helvetica, sans-serif" align = "justify">
                            <b><u>IGNOU Prashnottari Sewa(IPS)</u></b></font> </td></tr>  
     
    <tr><td width="800" align="center">
      <br><b><align = "center">You are required to fill up the following fields...</b></align> <br><br>
        <% String message = (String)session.getAttribute("message");//get message from ChangePassword.java
             if(message != null){  %>
             <b><font color = "red">
             <% 
              out.println(message);//Display the message if messgage is not null.
               }  
               session.removeAttribute("message");
             //After Displaying the message remove the message form session. %></b>
          <div align="center"></div>
        <br> <table border = 2 align = center><tr><td>
          <table align="center">
            <tr> 
              <td width="140" align="left"><b>Current Password</b></td>
              <td width="298" align="center"><input type="password" name="CPassword"align=></td>
      </tr>
          <tr> 
              <td align="left"><b>New Password</b></td>
              <td align="center"><input type="password" name="NPassword"></td>
      </tr>
                      
              <tr> 
              <td align="left"><b>Confirm Password</b></td>
              <td align="center"><input type="password" name="CFPassword">
          </td>
            </tr>
            
            <tr> 
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr> 
              <td><div align="center"> </div></td>
              <td> <div align="left"> 
                  <input type="submit" name="Submit" value="Submit" >
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  <input type="reset" name="Submit" value="Reset">
                </div></td>
            </tr>
          </table>
              
         </table>      
        <h3 align="center">&nbsp; </h3>
        </td>
    </tr>
    </table> 
<tr>
<td height="19" bgcolor="#330000"><div align="center"><font color="white" size="2"><strong>IGNOU
              Education Grid &copy; All rights reserved, ACIIL </strong>
              </font></div></td>
</tr>

</td></tr></table>
   <%  }   %>
</center>
</form>
<map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
    </map>
</body>
</html>
