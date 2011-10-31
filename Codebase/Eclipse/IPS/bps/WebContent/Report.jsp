<%@ page import="java.sql.Connection,
  javax.sql.DataSource,
  javax.naming.Context,
  javax.naming.InitialContext,
  java.sql.Statement,
  java.sql.ResultSet,
  java.sql.SQLException"%>
<%@ page errorPage = "errorqms.jsp" %>

<html>
   <head>
<title>::  IGNOU Prashnottari Sewa ::</title>
</head>
 <body  onload= "window.status = 'Welcome to IGNOU Prashnottri Sewa';"> 
 <form name = "Report" action = "Report" method = "post">
  <center>
                <table width="800" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#F7EFE7">
                    <tr>
                        <td colspan="3">
                            <table width="425" cellpadding="0" cellspacing="0" align = "center">
                                <tr>
                                    <td width="115"><img src="Images/head.gif" width="800" height="150" /></td>
                                </tr>
                                <tr>
                                    <td><img src="Images/links.gif" width="500" height="27" border="0" align="right" usemap="#Map2" /></td>
                                </tr>
                        </table></td>
                     </tr>

                     <tr>
                     <td height="5" bgcolor="#000000"></td>
                        </tr>
                         </table>
          
           <table align = "center" width="800" height="289" border="0" bgcolor="#F7EFE7">
              <tr><td>
                                 
                    <h3 align = "center"><u> Generate Reports </u></h3>
                     <table align="center">
                  <tr><td align = center bordercolor="#330000" bgcolor="#74101A" width="526" ><b> 
                          <font size="2" face="Verdana, Arial, Helvetica, sans-serif" color = white>Select the Department</font>
                              </td>
                            </tr>
                          </table>
                          <table width="529"  bordercolor="#330000" height="127" align="center">
                            <tr> 
                              <td height="114" valign="middle" align="center" class="table_with_border"> 
                                <table width="615" border="0" align = "center" >
                                  <tr> 
                                    <td width="86" height="2" align = "center"> 
                                      <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="1">Department</font></b></font>
                                    </td>
                                    <td align="center" colspan="1" height="2"> 
                                      <select name="department">
                                       <option value = "">------------------Please Select Department----------------</option>

                                                <%
                                                          Statement stmt = null;
                                                          ResultSet rs = null;
                                                          Connection conn = null;
                                                          String Department = (String)session.getAttribute("Department");
                                                          String User = (String)session.getAttribute("User");
                                                          String Emp_Id = (String)session.getAttribute("Emp_Id");
                                                        try
                                                          {                                                          
                                                          if(User == null)
                                                          {
                                                          RequestDispatcher view =  request.getRequestDispatcher("login.jsp");
                                                          view.forward(request,response);
                                                          }
                                                          else
                                                          {
                                                          DataSource ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
                                                          conn = ds.getConnection();                                                  
                                                          stmt = conn.createStatement();
                                                          rs = stmt.executeQuery("select *from  dept_details where status = 'True'");                   
                                                          while(rs.next())
                                                          { %>
                                                           <option value =<%=rs.getString(2)%>><%=rs.getString(3)%></option>
                                                           <%  }
                                                              %>
                                         </select>                                      
                                         </td>
                                         </tr>                                                                                                                                                                                                                                                  
                                         <tr> 
                                        <td width="86" height="2">&nbsp;</td>
                                        <td align="center" valign="middle" width="362" height="2">                                      
                                        <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#FF0000">*</font><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><align = "center"><b>Please 
                                        select the department(the name of the department for which you want to view the daily report) 
                                        to get daily report</b></font></div>
                                    </td>
                                    <td align="center" valign="middle" width="73" height="2">&nbsp;</td>
                                  </tr><br></table>

                                           <table width = 700 align = "center"><tr><td align = "center" bordercolor="#330000" bgcolor="#74101A"><b> 
                          <font size="2" face="Verdana, Arial, Helvetica, sans-serif" color = white>Enter Date</font>
                              </td>
                            </tr>
                          </table>
                          <table width="529"  bordercolor="#330000" height="127" align="center">
                            <tr> 
                              <td height="114" valign="middle" align="center" class="table_with_border"> 
                                <table width="615" border="0" align = "center">
                                  <tr> 
                                    <td width="86" height="2" align = "center"> 
                                      <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="1">From Date</font></b></font>
                                    </td>
                                    <td align="center" colspan="2" height="2"> 
                                      <select name = "day">
                                      <option value = "">DD</option>
                                      <option value = "01">01</option>
                                      <option value = "02">02</option>
                                      <option value = "03">03</option>
                                      <option value = "04">04</option>
                                      <option value = "05">05</option>
                                      <option value = "06">06</option>
                                      <option value = "07">07</option>
                                      <option value = "08">08</option>
                                      <option value = "09">09</option>   
                                      <% for(int i=10;i<32;i++)
                                         {  %>
                                        <option value = "<%=i %>"><%=i %></option>
                                         <% }  %>

                                      </select> 
                                     <select name = "month">
                                     <option value = "">MM</option>
                                     <option value = "01">01</option>
                                      <option value = "02">02</option>
                                      <option value = "03">03</option>
                                      <option value = "04">04</option>
                                      <option value = "05">05</option>
                                      <option value = "06">06</option>
                                      <option value = "07">07</option>
                                      <option value = "08">08</option>
                                      <option value = "09">09</option>    
                                      <option value = "10">10</option>    
                                      <option value = "11">11</option>    
                                      <option value = "12">12</option>    
                                     </select> 
                                      <select name="year">
                                      <option value = "">YYYY</option>
                                       <% for(int i=2010;i<2020;i++)
                                         {  %>
                                        <option value = "<%=i %>"><%=i %></option>
                                         <% }  %>
                                     </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="1">
                                       To Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <select name = "day2">
                                      <option value = "">DD</option>
                                      <option value = "01">01</option>
                                      <option value = "02">02</option>
                                      <option value = "03">03</option>
                                      <option value = "04">04</option>
                                      <option value = "05">05</option>
                                      <option value = "06">06</option>
                                      <option value = "07">07</option>
                                      <option value = "08">08</option>
                                      <option value = "09">09</option>   
                                      <% for(int i=10;i<32;i++)
                                         {  %>
                                        <option value = "<%=i %>"><%=i %></option>
                                         <% }  %>
                                      </select> 
                                     <select name = "month2">
                                     <option value = "">MM</option>
                                     <option value = "01">01</option>
                                      <option value = "02">02</option>
                                      <option value = "03">03</option>
                                      <option value = "04">04</option>
                                      <option value = "05">05</option>
                                      <option value = "06">06</option>
                                      <option value = "07">07</option>
                                      <option value = "08">08</option>
                                      <option value = "09">09</option>    
                                      <option value = "10">10</option>    
                                      <option value = "11">11</option>    
                                      <option value = "12">12</option>    
                                      </select> 
                                      <select name="year2">
                                      <option value = "">YYYY</option>
                                       <% for(int i=2010;i<2020;i++)
                                         {  %>
                                        <option value = "<%=i %>"><%=i %></option>
                                         <% }  %>

                                   </select></td></tr>
                                    <tr><td>&nbsp;</td>
                                    <td align = "center" valign="middle"><input type="Submit" name="Button" value="View Report"></td></tr>
                                    <tr> 
                                    <td width="86" height="2">&nbsp;</td>
                                    <td align="center" valign="middle" width="362" height="2"> 
                                     
                                      <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#FF0000">*</font><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><align = "center"><b>Please 
                                        select the date(the date for the query for which you want to view the report) 
                                        to get report</b></font></div>
                                    </td>
                                    <td align="center" valign="middle" width="73" height="2">&nbsp;</td>
                                  </tr

                                </table>
                              </td>
                      </tr>
 
                                  </table>

                                <table border = 1 width = 780><tr> 
  <td align = center bgcolor = "#74101A"><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color = white><b>Token Id</b></font></td> 
  <td align = center bgcolor = #74101A><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color = white><b>Forward Date</b></font></td> 
  <td align = center bgcolor = #74101A><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color = white><b>Query Reply Date</b></font></td>
 <td align = center bgcolor = #74101A><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color = white><b>Dept. Name</b></font></td>
 <td align = center bgcolor = #74101A><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color = white><b>Query Status</b></font></td></tr>
                            <%
             ResultSet rs2 = (ResultSet) session.getAttribute("rs");
            if (rs2 != null) {
                while (rs2.next()) {
                        %> 
                    
                            <tr>
                            <td align = center><b><%out.println(rs2.getString(1));%></b></td> 
                        <td align = center><b><%out.println(rs2.getString(2));%></b></td> 
                <td align = center><b><%if((rs2.getString(4))!= null)out.println(rs2.getString(4));%></b></td>
                    <td align = center><b><%out.println(rs2.getString(6));%></b></td>
                <td align = center><b><%out.println(rs2.getString(7));%></b></td>
                   </tr>
                     <% }
                          }  
                            }
                              }
                              catch (SQLException e) {
                              e.printStackTrace();
                              } finally { try {  conn.close();  } catch (Exception e) {  }	}   %>
                    
                      
                    </table></table><br><br><br><br>
                    <table width = "800">
                   <tr>
                 <td height="10" bgcolor="#330000"><div align="center"><font color="white" size="1"><strong>IGNOU
              Education Grid &copy; All rights reserved, ACIIL </strong>
              </font></div></td>
                  </tr></table>
                    
                    </form>
                   
        <map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
    </map>

</body></html>
