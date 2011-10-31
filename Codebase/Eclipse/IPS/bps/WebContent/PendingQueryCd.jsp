<%-- 
    Document   : PendingQueryCd
    Created on : Dec 4, 2010, 6:03:44 PM
    Author     : Anand Shankar
--%>

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
<title>:: IGNOU-Query Management System ::</title>
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
<body>
<form name="form14" action="PendingQueryCd" method="post">
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
                </tr></table></td>
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
        <td width="800" align="center" valign="top"> <%@ include file = "cdlink.jsp" %></td>
        </tr></table>
        <center>
            <table border=1 width = 800 > <tr><td>
                        <table border = 1 width = 800><tr>
                                <td align = "center" ><font color =#74101A><b>Select</b></font></td>
                                <td align = "center"><font color = #74101A><b>Token Id</b></font></td>
                                <td align = "center"><font color = #74101A><b>Forward Date</b></font></td>
                                <td align = "center"><font color = #74101A><b>Pending With</b></font></td>
                                <td align = "center"><font color = #74101A><b>Query Status</b></font></td>

                                </tr>

                            <%
                String Token_Num = "";
                Statement stmt = null;
                ResultSet rs = null;
                Connection conn = null;
                String Department = (String)session.getAttribute("Department");
                String User = (String)session.getAttribute("User");
                String Emp_Id = (String)session.getAttribute("Emp_Id");
                try {
                if(User == null)
                {
                RequestDispatcher view =  request.getRequestDispatcher("LoginPC.jsp");
                view.forward(request,response);
                }
                else
                {
                DataSource ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
                conn = ds.getConnection();
                stmt = conn.createStatement();
                String sql = "SELECT * FROM user_query WHERE department = '"+Department+"'&& STATUS !='Replied'&& STATUS!='New' && user_query.querytype='Academic'";
                rs = stmt.executeQuery(sql);
                while (rs.next()) {

                    String Input = rs.getString(1);
                    session.setAttribute("Input", Input);
                            %>
                            <tr><td align =center><input type = radio button name = r1 value = "<%=Input%>"></td>
                                <td align = "center"><%=rs.getString(1)%></td>
                                <td align = "center"><%=rs.getString(10)%></td>
                                <td align = "center"><%=rs.getString(8)%></td>
                                <td align = "center"><%=rs.getString(12)%></td>
                               </tr>

                            <%  }

                            %>

                        </table><br><br>

                      <center>
                            &nbsp;&nbsp;&nbsp;
                            <input type = submit name = button value = ViewQuery onClick = "return Validation25();">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<input type = submit  name = button value = Cancel></center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


                        <br>
                        <%
            String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "" ,s6 = "", s7 = "";
            ResultSet rs2 = (ResultSet) session.getAttribute("rs");
            if (rs2 != null) {
                while (rs2.next()) {
                    s1 = rs2.getString(1);
                    s3 = rs2.getString(9);
                    s5 = rs2.getString(10);
                     s6 = rs2.getString(8);
                    s7 = rs2.getString(12);

                }
              ResultSet rs5 = stmt.executeQuery("select * from user_query where token_id = '"+s1+"'");
                while (rs5.next()) {
               Token_Num = rs5.getString(9);
                  }
            }

                        %>

                        <table border=0 width="700" align="center">
                          <tr>
                            <td><b>Token No</b></td><td><input type = text name = T_No value = "<%=s1%>" readonly></td>
                            <td><b>Forwarded Date</b></td>
                 <td><input type = text name = Fwd_Name size="20" maxlength = 20 value ="<%=s5%>" readonly ></td>


                         <tr><td><b>Pending With</b></td><td><input type = text name = Replied_By value = "<%=s6%>" readonly size="20" maxlength = 20></td>
                    <td><b>Query Status</b></td><td><input type = text name = Query_Status size="20" maxlength = 20 value = "<%=s7%>" readonly></td></tr>
                               </tr>
                              </table><br>
                                    <table border = 1 width = 700 align="center">
                    <tr><td width="800" align = "center"><b>Query Details :-</b><br>&nbsp;&nbsp;&nbsp;<textarea name ="Query_Details" rows="2" cols="90" readonly><%=s3%></textarea></td></tr>
                     </td></tr></table>


    </td></tr>
    <tr><td height = 10></td></tr>
   <tr>
<td height="10" colspan="3" bgcolor="#330000"><div align="center"><font color="white" size="2"><strong>IGNOU
              Education Grid &copy; All aights reserved, ACIIL </strong>
              </font></div></td>
</tr>
</table>
</center>

           <% }
            }
              catch (SQLException e) {
              e.printStackTrace();
              } finally { try {  conn.close();  } catch (Exception e) {  }	}   %>

<map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
    </map>

</form>
</body>

</html>





