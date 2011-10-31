<%@ page import = "java.sql.*" %>
<%@ page errorPage = "errorqms.jsp" %>
<%@ page import = "javax.sql.*, javax.naming.*" %>

<html>
<head>
<title>::  IGNOU Prashnottari Sewa::</title></head>
<body  onload= "window.status = 'Welcome to IGNOU Prashnottri Sewa';">
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

<table width="800" height="289" border="0" cellpadding="1" cellspacing="1" align="center">
    <tr><td><%@ include file = "Links3.jsp" %></td></tr>
    <tr> <td>
        <h2 align = center>
  <% String Department = (String)session.getAttribute("Department");
  String User = (String)session.getAttribute("User");
  String Emp_Id = (String)session.getAttribute("Emp_Id");
  String User22 = "";
 if(User == null)
      {
      RequestDispatcher view =  request.getRequestDispatcher("login.jsp");
      view.forward(request,response); 
      }
    else
        {
         Connection conn=null;
         
           try {
               DataSource ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
                conn = ds.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs2 = stmt.executeQuery("SELECT emp_name from employee_details where emp_id = '"+Emp_Id+"'");
                while(rs2.next()) {
                 User22  = rs2.getString(1);                                     
                   }                
                
                }
                    
               
            catch (SQLException e) {
                e.printStackTrace();
               }
           finally { try {  conn.close();  } catch (Exception e) {  }	}
          }
               %>
   <h3 align = "center">Administrator</h3>             
  <h3 align = center> Welcome <%=User22 %></h3>
                </td></tr>
    <tr><TD bgcolor="#F7EFE7">
<P align=center>&nbsp;
                <div align="right"> <FONT
                              face="Verdana, Arial, Helvetica, sans-serif"
                              size=2></FONT></div>
                 <table align = "center" width = 700><tr><td align = "left">
                <B><FONT face="Verdana, Arial, Helvetica, sans-serif"
                              size=2><u>IGNOU Prashanotri Sewa for Administrator </u></FONT></B></P>
                <P align=justify>Welcome to Query Management System- Query admin is the main pivot around which 
                the whole query management system revolves. The main duties vested with the query admin is 
                filtering and organizing the queries according to its category and forwarding it to the
                internal experts and even he/she has the right to answer the queries if they prefer to.
               The super admin has the overall responsibility of the entire query management system. 
               He monitors and controls the system flow process on an up-to-date basis.   </font></P>
               </td></tr></table>
            </td></tr></table><br><br>
       <table width = "800"><tr>
        <td height="15" colspan="3" bgcolor="#330000"><div align="center"><font color="white" size="2"><strong>IGNOU
              Education Grid &copy; All aights reserved, ACIIL </strong>
              </font></div></td></tr></table>    
   
  
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
