<%@ page import="java.sql.Connection,
  javax.sql.DataSource,
  javax.naming.Context,
  javax.naming.InitialContext,
  java.sql.Statement,
  java.sql.ResultSet,
  java.sql.SQLException"%>
<%@ page  errorPage="errorqms.jsp" %>

<html>
<head><title>::  IGNOU Prashnottari Sewa::</title>
</head>
<body onload= "window.status = 'Welcome to IGNOU Prashnottri Sewa';">
<form name="form1" action="Posted.jsp" method="post">
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
                           </table>
<table width="800" height="350" border="0" cellpadding="1" cellspacing="1" align="center">
    <tr><td><%@ include file = "Links5.jsp" %></td></tr>
    <tr> <td align = "center">
        <h3 align = center>
        <%  
                String rc_code = "";
                String User22 = ""; 
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
                rs = stmt.executeQuery("SELECT emp_name ,department from employee_details where department = '"+Department+"'and emp_id = '"+Emp_Id+"'");
                while(rs.next()) {
                   rc_code = rs.getString(2);
                   User22  = rs.getString(1);                                     
                   session.setAttribute("RC_code",rc_code);    
                     }
                out.println("Regional Center"+" "+"-"+" "+rc_code+"</h2>");                       
               }
                catch (SQLException e) {
            e.printStackTrace();
            } finally { try {  conn.close();  } catch (Exception e) {  }	}
           }  
         session.setAttribute("User22",User22);             
               %>

                
  <b> Welcome <%out.println(User22);%></b>
                </td></tr>
    <tr><td bgcolor="#F7EFE7">
       <table width = 700 align = center><tr><td align = center>
                  <P align= left>
                 <B><FONT face="Verdana, Arial, Helvetica, sans-serif"
                 size=2><u>IPS (IGNOU Prashanotri Sewa) for Regional Center Experts </u></FONT></B></P>
                <P align=justify>Query admin is the main pivot around which the whole query management system revolves. The main duties vested with the query admin is filtering and organizing the queries according to its category and forwarding it to the internal experts and even he/she has the right to answer the queries if they prefer to.</font></P>
                <P align=center>&nbsp;</P>
                <div align="center">               
               </td></tr>
                </table>
              </td></tr>
              <tr>
              <td height="19" bgcolor="#330000" align="center"><font color="white" size="2"><strong>IGNOU
              Education Grid &copy; All rights reserved, ACIIL </strong>
              </font></td>
             </tr>
               </table>    
   
  
</form>
        <map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
    </map>
</body>
</html>