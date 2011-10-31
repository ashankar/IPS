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
<title>::  IGNOU Prashnottari Sewa::</title></head>
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

<table width="800" height="389" border="0" cellpadding="1" cellspacing="1" align="center">
    <tr><td><%@ include file = "Links7.jsp" %></td></tr>
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
                Calendar cal = new GregorianCalendar();
                double millisec = cal.getTimeInMillis();
                double time = 0.0;
                String color = null;        
             
               if(User == null)
                    {
                  RequestDispatcher view =  request.getRequestDispatcher("DeptLogin.jsp");
                  view.forward(request,response);
                  }
                else
                {
                 try {            
                DataSource ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
                conn = ds.getConnection();                                                  
                stmt = conn.createStatement(); 
                rs = stmt.executeQuery("SELECT dept_discription from dept_details where dept_name = '"+Department+"'");
                while(rs.next()) {
                   String Dept = rs.getString(1);
                    out.println(Dept+"</h2>");                       
                   }
                ResultSet rs2 = stmt.executeQuery("SELECT emp_name from employee_details where department = '"+Department+"'and emp_id = '"+Emp_Id+"'");
                while(rs2.next()) {
                   User22  = rs2.getString(1);                                        
                   }                
                }
                       
            catch (SQLException e) {
            e.printStackTrace();
            } finally { try {  conn.close();  } catch (Exception e) {  }	}
          }    %>

                
  <h3 align = "center"> Welcome <%out.println(User22);%></h3>
     <% session.setAttribute("User22",User22);%>
                </td></tr>
          <tr><TD>
            <table width = "700" align = "center"><tr><td align = "left">
             <P align=center>&nbsp;
                <div align="right"> <FONT
                              face="Verdana, Arial, Helvetica, sans-serif"
                              size=2></FONT></div>
                <B><FONT
                              face="Verdana, Arial, Helvetica, sans-serif" size=2><u>IGNOU Prashanottri Sewa (IPS) for Department Experts </u></FONT></B></P>
                <P align=justify> Expert processes the queries forwarded by the system admin
                and takes necessary steps to answer the queries. If the query doesn?t fall under his 
                 purview of specialization or if the internal expert needs further guidance he has 
                the option to forward it to external experts.The internal expert also has the privilege 
                to edit (in case of any mistakes) the queries and organize them into category and sub-
                category so that it becomes easy for the users to search the archives.External experts
                are the subject experts in various fields of specialization. The queries posted 
                (forwarded) by the internal expert will be answered by them. The system admin also
                maintains a subject-wise list of all the concerned external experts who are connected
                to IGNOU team both directly and indirectly. 

                     </font></P>
                 </td></tr></table>
                
             </td></tr>
               <tr>
            <td height="15" colspan="3" bgcolor="#330000"><div align="center"><font color="white" size="2"><strong>IGNOU
              Education Grid &copy; All aights reserved, ACIIL </strong>
              </font></div></td>
</tr></</table>
<map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
    </map>

   
  
</form>
</body>
</html>

