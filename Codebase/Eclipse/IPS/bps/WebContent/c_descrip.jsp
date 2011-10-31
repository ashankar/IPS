<%@page import="java.sql.Connection,
  javax.sql.DataSource,
  javax.naming.Context,
  javax.naming.InitialContext,
  java.sql.Statement,
  java.sql.ResultSet,
  java.sql.SQLException"%>
<%@ page  errorPage="errorqms.jsp" %>
<%@ page import = "java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: IGNOU Query Management System ::</title>
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
       <td height="5" bgcolor="#000000"></td>
      </tr>           
            </table></td>
      </tr>
           <tr>
        <td bgcolor="#FFFFFF"><table width="800" border="0" align="center" cellspacing="1" cellpadding="1">
        <tr> 
          <td height="291" >
          <table width="800" height="289" border="0" align="center" cellpadding="1" cellspacing="1">
              <tr> 
                <td width="611" height="221" align="left" border="0"  valign="top" bgcolor="#F7EFE7">                   
                                 
                 </p>
                  <p><b>                           
           
                        <table  align="center"border="0" width = 800>
                      <tr align="center"><td align="center">
                           
                <%
                String id = request.getQueryString();
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
                  String sql ="select issued_by,c_date,issued_to,c_subject,c_description,MAPEDNAME from circular,uploads where c_id ='"+id+"' && circular.c_id=uploads.UPLOADID";
                   rs = stmt.executeQuery(sql);               
                  while (rs.next())
                    {                                                                       
                      %>
                     <table align="center"><tr><td>
    <center> <h3>IGNOU Prashnottari Sewa</h3></center>
   <center> <h4><u>IGNOU Circular</u></h4></center>


   <p>_________________________________________________________________________</p>
                     <p align="right"><b>Dated.</b><%=rs.getString("c_date")%></p>
               
                  <p><b>From:-</b><%=rs.getString("issued_by")%> </p>
                  <p><b>To:-</b><%=rs.getString("issued_to")%> </p>
                  <p><b>Subject:-</b><%=rs.getString("c_subject")%> </p>
                   <textarea name="description" cols="70" rows="6" tabindex="0" readonly><%=rs.getString("c_description")%></textarea>
                          
                        </td>
                        </tr>
                        <tr><td align="center">

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
                          </td></tr>                
                           
                             <%   
                      }   
                    }    
            catch (SQLException e) {
            e.printStackTrace();
            } finally { try {  conn.close();  } catch (Exception e) {  }	}
             }  %>
                                           
               <td>
                 
                  <p>Thank You</p>                               
                  <p>&nbsp; </p>
                    </td></tr>
                    <tr><td><b>Admin (IPS)</b></td></tr>
                    </table>
                     </table>                    
              </tr>
            </table>
            </table></td>
       
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