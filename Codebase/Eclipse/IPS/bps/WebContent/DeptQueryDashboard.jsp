<%@ page import="java.sql.Connection,
  javax.sql.DataSource,
  javax.naming.Context,
  javax.naming.InitialContext,
  java.sql.Statement,
  java.sql.ResultSet,
  java.sql.SQLException"%>
<%@ page  errorPage="errorqms.jsp" %>
<%@ page import = "java.util.*" %>


<html>
<head>
<title>::  IGNOU Prashnottari Sewa ::</title></head>
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
    <tr><td><%@ include file = "Links6.jsp" %></td></tr>
    <tr> <td>
        <h2 align = center>
  <%
   
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
                try  {
                DataSource ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
                conn = ds.getConnection();                                                  
                stmt = conn.createStatement();
                ResultSet rs2 = stmt.executeQuery("SELECT emp_name from employee_details where emp_id = '"+Emp_Id+"'");
                while(rs2.next()) {
                 User22  = rs2.getString(1);                                     
                   }              
                  }
                       
            catch (SQLException e) {
            e.printStackTrace();
            } finally { try {  conn.close();  } catch (Exception e) {  }	}
         }  %>


     <h3 align = "center">Department Administrator</h3>           
  <h3 align = center> Welcome <%=User22 %> To <%=Department %></h3>
                </td></tr>
   
    <tr><TD bgcolor="#F7EFE7">
       <table width = "700" align = "center"><tr><td align = "left" width = "700">
                <FONT face="Verdana, Arial, Helvetica, sans-serif" size=2></FONT></div>
                <B><FONT face="Verdana, Arial, Helvetica, sans-serif" size=2><u>IGNOU INTERNAL OPERATIONS DASHBOARD </u></FONT></B></P>
                <P align=justify>Welcome to IGNOU Prashanottri Sewa (IPS)- Query admin is the main pivot around which 
                the whole query management system revolves. The main duties vested with the query admin is 
                filtering and organizing the queries according to its category and forwarding it to the
                internal experts and even he/she has the right to answer the queries if they prefer to.
               The super admin has the overall responsibility of the entire query management system. 
               He monitors and controls the system flow process on an up-to-date basis.   </font>
              </td><tr></table>
            </td></tr>
             <tr>        
            <td bgcolor="#330000" width = "815"><div align="center"><font color="#FFFFFF" size="1"><strong>IGNOU 
            Edugrid &copy; All rights reserved 2009,ACIIL</strong></font> </div></td>
           </tr>
            </table>    
   
  
</form>
<map name="Map" id="Map">
            <area shape="rect" coords="273,2,367,24" href="http://www.ignou.ac.in" target="_blank" />
            <area shape="rect" coords="182,2,243,25" href="index.html" />
        </map>
        
        <map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
    </map></
</body>
</html>

 