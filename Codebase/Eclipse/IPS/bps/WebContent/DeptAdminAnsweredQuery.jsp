<%@ page import="java.sql.Connection,
  javax.sql.DataSource,
  javax.naming.Context,
  javax.naming.InitialContext,
  java.sql.Statement,
  java.sql.ResultSet,
  java.sql.SQLException"%>
<%@ page errorPage="errorqms.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8" session = "true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>::  IGNOU Prashnottari Sewa::</title>
        <script language = "javascript">
            function Validation2()
            {
                var ans = confirm('Are you sure you want to delete the query?');
                if(ans)
                {return true;}
                else{return false;}
            }

            function Validation15()
            {
                var x = document.getElementsByName('r1')
                var comp = "" ;
                for(var k=0;k<x.length;k++)
                    if(x[k].checked)
                        var comp = x[k].value;
                if(comp == "")
                {
                    alert('Please select the query');
                    return false;
                }
            }
        </script>
    </head>
    <body  onload= "window.status = 'Welcome to IGNOU Prashnottri Sewa';">
        <form name="form14" action="DeptAdminAnsweredQuery" method="post">
            <center>
                <table width="800" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#F7EFE7">
                    <tr>
                        <td colspan="3">
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
                        <td bgcolor="#FFFFFF"><table width="800" border="0" cellspacing="1" cellpadding="1">

                                <tr>
                                    <td height="291">
                                        <table width="800" height="289" border="0" cellpadding="1" cellspacing="1">
                                            <tr>
                                                <td width="800" height="221" bgcolor="#F7EFE7"  valign="top">
                                                    <center>
                                                         <table width="800" border="0" bgcolor="#F7EFE7"align = center>
                                                            <tr>
                                                                <td width="800" align="center" valign="top"> <%@ include file = "Links8.jsp" %></td>
                                                            </tr></table>
                                                        <center>
                                                            <table border=1 width = 800 > <tr><td>
                                                                        <table border = 1 width = 800><tr>
                                                                                <td align = "center"><font color =#74101A><b>Select</b></font></td>
                                                                                <td align = "center"><font color = #74101A><b>Token Id</b></font></td>
                                                                                <td align = "center"><font color = #74101A><b>Forward Date</b></font></td>
                                                                                <td align = "center"><font color = #74101A><b>Query</b></font></td>
                                                                                <td align = "center"><font color = #74101A><b>Query Reply Date</b></font></td>
                                                                                <td align = "center"><font color = #74101A><b>Replied By</b></font></td>
                                                                                <td align = "center"><font color = #74101A><b>Query Status</b></font></td>
                                                                                <td align = "center"><font color = #74101A><b>Dept Name</b></font></td>
                                                                                <td align="center"a><font color = "#74101A"><b>Attachment</b></font></td>
                                                                            </tr>

                                                                            <%
                                                            String Token_Num = "";                                                           
                                                            Statement stmt = null;
                                                            ResultSet rs = null;
                								Connection conn = null;
               								String Department = (String)session.getAttribute("Department");
                								String User = (String)session.getAttribute("User");
                								String Emp_Id = (String)session.getAttribute("Emp_Id");
                								if(User == null)
                								{
                								RequestDispatcher view =  request.getRequestDispatcher("login.jsp");
                				                        view.forward(request,response);
                								}
                								else
                								{
                                                            try {
                								DataSource ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
                								conn = ds.getConnection();                                                  
                								stmt = conn.createStatement();
                                                                String sql = "select TokenId,QueryFwdDate,QueryAnswer,QueryReplyDate,RepliedBy,QueryStatus,DeptName,MAPEDNAME from deptqueryinfo,uploads where QueryStatus = 'Replied' && deptqueryinfo.TokenId=uploads.UPLOADID";
                                                                rs = stmt.executeQuery(sql);
                                                                while (rs.next()) {
                                                                    String Input = rs.getString("TokenId");
                                                                    session.setAttribute("Input", Input);
                                                                            %>
                                                                            <tr><td align = "center"><input type = radio button name = r1 value = "<%=Input%>"></td>
                                                                                <td align = "center"><%=rs.getString("TokenId")%></td>
                                                                                <td align = "center"><%=rs.getString("QueryFwdDate")%></td>
                                                                                <td align = "center"><%=rs.getString("QueryAnswer")%></td>
                                                                                <td align = "center"><%=rs.getString("QueryReplyDate")%></td>
                                                                                <td align = "center"><%=rs.getString("RepliedBy")%></td>
                                                                                <td align = "center"><%=rs.getString("QueryStatus")%></td>
                                                                                <td align = "center"><%=rs.getString("DeptName")%></td>
                                                                                 <td align="center">
                                                                                 <%
                                                                                   String p1,p2;
                                                                                   p1="temp" + "/";
                                                                                  p2=rs.getString("MAPEDNAME");
                                                                                  if(!p2.equals("default.txt"))
                                                                                     {
                                                                                         %>
                                                                                         <a href="<%=p1+p2 %>"> <img src="Images/attachimg.gif"/> </a>
                                                                                         <%
                                                                                            }
                                                                                              %>
                                                                                     </td>                                                                            
                                                                                            </tr>
                                                                                       <%  }  %>     


                                                                        </table><br><br>
                                                                        <center>
                                                                            &nbsp;&nbsp;&nbsp;
                                                                            <input type = submit name = button value = ViewQuery onClick = "return Validation15();">
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                                                            <input type = submit name = button value = DeleteQuery onClick = "return Validation2();">
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                                                            <input type = submit  name = button value = "Add To Faq" onClick = "return Validation15();">&nbsp;&nbsp;&nbsp;
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                            <input type = submit  name = button value = Cancel></center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


                                                                        <br>
                                                                        <%
                                                                String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", s7 = "";
                                                                ResultSet rs2 = (ResultSet) session.getAttribute("rs");
                                                                if (rs2 != null) {
                                                                    while (rs2.next()) {
                                                                        s1 = rs2.getString(1);
                                                                        s2 = rs2.getString(2);
                                                                        s3 = rs2.getString(3);
                                                                        s4 = rs2.getString(4);
                                                                        s5 = rs2.getString(5);
                                                                        s6 = rs2.getString(6);
                                                                        s7 = rs2.getString(7);

                                                                    }

                                                                    ResultSet rs5 = stmt.executeQuery("select token_id from user_query where query = '" + s1 + "'");
                                                                    while (rs5.next()) {
                                                                        Token_Num = rs5.getString(1);
                                                                    }
                                                                  }
                                                                   %>

                                                                        <table border=0 width="700" align="center">
                                                                            <tr>
                                                                                <td><b>Token No</b></td><td><input type = text name = T_No value = "<%=Token_Num%>" readonly></td>
                                                                                <td><b>Forward Date</b></td><td><input type = text name = Fwd_Date size="20" maxlength = 30 value = "<%=s2%>" readonly></td></tr>
                                                                            <tr><td><b>Emp Id</b> </td><td><input type = text name = Emp_Id value = "<%=s4%>" readonly></td>
                                                                                <td><b>Reply Date</b></td>
                                                                                <td><input type = text name = Ans_Query size="20" maxlength = 20 value ="<%=s5%>" readonly ></td>
                                                                            </tr>
                                                                            <tr><td><b>Replied By</b></td><td><input type = text name = Replied_By value = "<%=s6%>" readonly size="20" maxlength = 20></td>
                                                                                <td><b>Department</b></td><td><input type = text name = Query_Status size="20" maxlength = 20 value = "<%=s7%>" readonly></td></tr>
                                                                        </table><br>
                                                                        <table border = 1 width = 700 align = "center">
                                                                            <tr><td width="800" align = "center"><b>Query Details :-</b><br>&nbsp;&nbsp;&nbsp;<textarea name ="Query_Details" rows="2" cols="90" readonly><%=s1%></textarea></td></tr>
                                                                            <tr><td align = "center"><b>Query Reply :-</b><br>&nbsp;&nbsp;&nbsp;<textarea name ="Query_Reply" rows="2" cols="90"><%=s3%></textarea>
                                                                                </td></tr></table>
                                                                    </td></tr></table>
                                                                    <table align = "center" width = "815"><tr>
                                                                     <td height="15" colspan="3" bgcolor="#330000"><div align="center"><font color="white" size="2"><strong>IGNOU
                                                                       Education Grid &copy; All aights reserved, ACIIL </strong>
                                                                     </font></div></td>
                                                                     </tr></table>
                                                        </center>

                                                        <%
                                                            } 
                                                             catch (SQLException e) {
                                                            e.printStackTrace();
                								} finally { try {  conn.close();  } catch (Exception e) {  }	}
                                                            }  %>

                                                        <map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
                                                            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
                                                            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
                                                        </map>

                                                        </form>
                                                        </body>

                                                        </html>





