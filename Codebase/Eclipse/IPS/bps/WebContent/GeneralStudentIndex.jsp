<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.Connection,
   javax.sql.DataSource,
   javax.naming.Context,
   javax.naming.InitialContext,
   java.sql.Statement,
   java.sql.ResultSet,
   java.sql.SQLException"%>
<%@ page errorPage="errorqms.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <meta http-equiv="Content-Type" content="text/html charset=iso-8859-1" />
        <title>:: IGNOU Prashnottari Sewa::</title>
        <script type="text/javascript">

            function validateFormOnSubmit(IndexForm2) {
                var reason = "";
                reason+=validatename(IndexForm2.name);
                reason+= validateEmail(IndexForm2.email_id);
                reason+= validatesubject(IndexForm2.subject);
                reason+= valDrop(IndexForm2.department);
                reason+=validatesubject(IndexForm2.query);

                if (reason != "") {
                    alert("Some fields need correction:\n" + reason);
                    return false;
                }
                return true;
            }
            function validatename(fld)
            {
                var error = "";
                var illegalChars = /\W/; // allow letters, numbers, and underscores
                var re=/^[A-z]+$/;
                var strLength = fld.value.length;
                for(var i=0;i<strLength;i++)
                {  
                    if(!isNaN(parseInt(fld.value.charAt(i))))
                    {   
                     error = "Please Enter character in the Name Feild.\n";
                     fld.style.background = '#F5D0A9';
                     }
                }
                if (fld.value == "" )
                {
                    error = "Please Enter the Name.\n";
                    fld.style.background = '#F5D0A9';
                }
                else if ((fld.value.length < 3) || (fld.value.length > 25)) {
                    error = "The Name is in the wrong length.\n";
                    fld.style.background = '#F5D0A9';
               }
               else {
                    fld.style.background = 'White';
                }
                return error;
        
            }

            function validateEmail(fld) {
                var error="";
                var tfld = trim(fld.value);
                var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/ ;
                var illegalChars= /[\(\)\<\>\,\;\:\\\"\[\]]/ ;

                if (fld.value == "") {
                    fld.style.background = '#F5D0A9';
                    error = "Please Enter the value in the Feild Email ID.\n";
                } else if (!emailFilter.test(tfld)) {
                    fld.style.background = '#F5D0A9';
                    error = "Please Enter a valid Email Address.\n";
                } else if (fld.value.match(illegalChars)) {
                    fld.style.background = '#F5D0A9';
                    error = "The Email Address contains illegal characters.\n";
                } else {
                    fld.style.background = 'White';
                }
                return error;
            }

            function valDrop(fld) {

                var error = "";
                if (fld.value == ""){
                    fld.style.background = '#F5D0A9';
                    error="Please select a concerned field "+fld.name+".\n";
                }
                else
                {
                    fld.style.background = 'White';
                }
                return error;
            }

            function validatesubject(fld) {
                var error = "";
                var illegalChars = /\W/; // allow letters, numbers, and underscores
                if (fld.value == "") {

                    error = "The required field has not been filled in "+fld.name+".\n";
                    fld.style.background = '#F5D0A9';
                }
                else if ((fld.value.length < 5) || (fld.value.length > 500)) {

                    error = "The"+" "+fld.name+" is of wrong length.\n";
                    fld.style.background = '#F5D0A9';
                }
                else {
                    fld.style.background = 'White';
                }
                return error;
            }


            function validateEmpty(fld) {
                var error = "";

                if (fld.value.length == 0) {
                    fld.style.background = '#F5D0A9';
                    error = "The required field has not been filled in.\n"
                } else {
                    fld.style.background = 'White';
                }
                return error;
            }

            function trim(s)
            {
                return s.replace(/^\s+|\s+$/, '');
            }


        </script>

    </head>

    <body onload= "window.status = 'Welcome to IGNOU Prashnottari Sewa';">
        <form name="IndexForm33" action="User_Query" onSubmit="return validateFormOnSubmit(this)" method = "post" enctype="multipart/form-data">
            <center>
                <table width="800" align="center" bgcolor="#F7EFE7">
                    <tr>
                        <td width = "115" align = "center">
                            <table width = "800" align = "center">
                                <tr>
                                    <td width="115" align = "right"><img src="Images/head.gif" width="800" height="150"></td>
                                </tr>
                                <tr>
                                    <td><img src="Images/links.gif" width="500" height="27" border="0" align="right" usemap="#Map2"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="5" colspan="3" bgcolor="#000000" align = "center"></td>
                    </tr>
                </table>

                <table align = "center" bgcolor="#F7EFE7" width = "800">
                    <tr>
                        <td align = "center" width = "800" bgcolor="#F7EFE7">
                            <table align = center width = "800"><tr><td align = "center">
                                        <font size="2" face="Verdana, Arial, Helvetica, sans-serif" align = "justify">
                                            <b><u>IGNOU Prashnottari Sewa(IPS)</u></b></font> </td></tr>                                                                            
                                     <tr><td align = "center"><b>Please fill the fields below.</b>(Fields with <strong><font color="#FF0033">*</font></strong> are
                            mandatory)

                                    </td></tr><tr><td></td></tr>
                            </table>
                            <table align = "center" width = "800" bgcolor="#F7EFE7"><tr><td>
                                        <table align = "center" width = "600" bgcolor="#F7EFE7">
                                            <tr>
                                                <td align="left"><strong><font color="#FF0033">*</font>Name</strong></td>
                                                <td align = "center">:</td>
                                                <td align="left"><input name="name" type="text" id="name" title="Enter your name here" tabindex="1"></td>
                                            </tr>
                                            <tr>
                                                <td align="left"><strong><font color="#FF0033">*</font>E-mail</strong></td>
                                                <td align = "center">:</td>
                                                <td align="left"><input name="email_id" type="text" title="Enter your email address here" tabindex="2"></td>
                                            </tr>

                                            <tr>
                                                <td align="left"><strong><font color="#FF0033">*</font>Subject of your query</strong></td>
                                                <td align = "center">:</td>
                                                <td align="left"><input name="subject" type="text" title="Enter subject of your query here" id="subject" tabindex="3">                                    </td>
                                            </tr>

                                            <tr>
                                                <td align="left"><strong><font color="#FF0033">*</font>Query Concerned To<br>
                                                            (Departments/Divisions/Schools)</strong></td>
                                                <td align = "center">:</td>
                                                <td align="left"><select name="department" title="Select Department to whom query is to be forwarded" tabindex="4">

                                                        <option value="">--------------Select One--------------</option>
                                                        <%                         

                                                 Statement stmt = null;
                                                 ResultSet rs = null;
                                                 Connection conn = null;

                                              try {
                                                  DataSource ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
                                                   conn = ds.getConnection();                                                  
                                                   stmt = conn.createStatement();

                            rs = stmt.executeQuery("select * from  dept_details where status ='True'");
                            while (rs.next()) {%>
                            <option value = "<%=rs.getString(2)%>"><%=rs.getString(3)%></option>
                                 <% }
                                                  rs.close();
                                                  rs = null;
                                                  stmt.close();
                                                  stmt = null;
                                                  conn.close();
                                                  conn = null;
                                                 } 
                                                 catch (SQLException e) {
                                                 e.printStackTrace();
                                                 } finally { try {  conn.close();  } catch (Exception e) {  }	}   %>

                                                    </select></td></tr><tr>
                                                <td align="left"><strong><font color="#FF0033">*</font>Query</strong></td>
                                                <td align = "center">:</td>
                                                <td align="left"><textarea name="query" cols="50" rows="6" title="Enter your query discription here" tabindex="5"></textarea></td>
                                            </tr>
                                            <tr>
                                                <td align = "left"><strong>Attachment<font color="#CC0000">**</font></strong></td>
                                                <td align = "center">&nbsp;</td>
                                                <td align="left"><label>
                                                        <input type="file" name="file" />
                                                    </label></td>
                                            </tr>
                                            <tr>
                                                <td align = "left">&nbsp;</td>
                                                <td align = "center">&nbsp;</td>
                                                <td align="left">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" align = "left"><font color="#CC0000">**</font><font size="1" face="Verdana">You  can attach any type of pdf,doc,ppt,txt,mp3,gif,jpg or mpg file for proper assumption. Please  note that the size of the attachment should not exceed 5 MB</font></td>
                                            </tr>
                                            <tr>
                                                <td align="left">&nbsp;</td>
                                                <td align = "center">&nbsp;</td>
                                                <td align="left"><input type="submit" name="submit" tabindex="6" value="Post">
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <input type="reset" name="Reset"  tabindex="7"> </td>
                                                            </tr>
                                                            </table>
                                                            </table>
                                                            <table height = "2" width = "800">
                                                                <tr>
                                                                    <td bgcolor="#330000" height = "2"><div align="center"><font color="#FFFFFF" size="1"><strong>IGNOU
                                                                                    Edugrid &copy; All rights reserved 2009,ACIIL</strong></font> </div></td>
                                                                </tr>
                                                            </table>
                                                            
                                                            <map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
                                                                <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
                                                                <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
                                                            </map>
                                                            </form>
                                                            </body>
                                                            </html>
