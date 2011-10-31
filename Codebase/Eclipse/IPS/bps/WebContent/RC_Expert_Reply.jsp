<%@ page import="java.sql.Connection,
  javax.sql.DataSource,
  javax.naming.Context,
  javax.naming.InitialContext,
  java.sql.Statement,
  java.sql.ResultSet,
  java.sql.SQLException"%>
<%@ page  errorPage="errorqms.jsp" %>
<%@ page import = "java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>::  IGNOU Prashnottari Sewa ::</title>
<SCRIPT LANGUAGE = "JAVASCRIPT">
//javascript funtion validation15 is called to find that the radio button is checked or not
//function validation25 is called to check that Token No.matches and to select a radio button for selecting the query.
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
     function Validation25()
      {
        var x = document.getElementsByName('r1')
        var comp = "" ;
        for(var k=0;k<x.length;k++)
        if(x[k].checked)
        var comp = x[k].value;          
        var User22 = document.Reply_Query.t1.value ;
        if(User22 == "" || comp == "")
          {
         alert('Please select the query');
         return false;
           }
         else if(comp != User22)
           {
          alert('Token No. does not matches ! Please select a right query !!'); 
          return false;
            }
        }  
     
  </SCRIPT>  
</head>
<body onload= "window.status = 'Welcome to IGNOU Prashnottri Sewa';">
<form name="Reply_Query" action="RC_Expert_Reply" method="post">
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
        <td width="800" height="221" bgcolor="#F7EFE7" valign="top">
        <center>
         <table width="800" border="0" bgcolor="#F7EFE7"align = center>
            <tr>
                <td width="800" align="center" valign="top"> <%@ include file = "Links5.jsp" %></td>
        </tr></table>       
        <center>
            <table border=1 width = 800 > <tr><td> 
                        <table border = 1 width = 800><tr> 
                                <td align = "center" ><font color =#74101A><b>Select</b></font></td> 
                                <td align = "center"><font color = #74101A><b>Token Id</b></font></td> 
                                <td align = "center"><font color = #74101A><b>Forward Date</b></font></td> 
                                <td align = "center"><font color = #74101A><b>Department</b></font></td>
                                <td align = "center"><font color = #74101A><b>Query Fwd To</b></font></td>
                                <td align = "center"><font color = "#74101A"><b>Attachment</b></font></td>
                            </tr>
                            
                            <%
                 String User22 = (String)session.getAttribute("User22");//getting the value of user22 from session and storing it into user22 variable
                Statement stmt = null;
                ResultSet rs = null;
                Connection conn = null;
                String Department = (String)session.getAttribute("Department");//getting the value of department from session and storing it into department variable
                String User = (String)session.getAttribute("User");//getting the value of user from session and storing it into user variable
                String Emp_Id = (String)session.getAttribute("Emp_Id");//getting the value of emp_id from session and storing it into emp_id variable
                Calendar cal = new GregorianCalendar();
                double millisec = cal.getTimeInMillis();
                double time = 0.0;
                String color = null;           
                if(User == null)
                    {
                  RequestDispatcher view =  request.getRequestDispatcher("login.jsp");
                  view.forward(request,response);
                  }
                else
                {                
                try {            
                DataSource ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");//database pooling
                conn = ds.getConnection(); //getting database connection
                stmt = conn.createStatement();//statement is created on connection object
                String sql = "SELECT Token_id,Query_Fwd_date,dept_name,Query_Fwd_To,Time,MAPEDNAME FROM query_info,uploads where dept_name = '"+Department+"' && Query_Status = 'RC_Expert_Forwarded' && query_info.Token_id=uploads.UPLOADID";
                //sql statement is created and stored in sql variable
                rs = stmt.executeQuery(sql);//sql statement is paassed to executequery methodand called with statement variable and stored in result set variable rs.
                while (rs.next())//resultset rs object will iterate till it has values in the database
                    {

                    String Input = rs.getString("Token_id");//gets the value of coloumn token id with resultset rs object and stores it in input variable
                    time = rs.getDouble("Time");
                    double diff = millisec - time;
                    if(diff < (24*60*60*1000))
                    {color = "#F7EFE7";}
                    else if ((diff >= (24*60*60*1000)) && (diff < (48*60*60*1000)))
                    color = "#999933";
                    else 
                    color = "#9999ff"; 
                    String CorrectTime = Double.toString(time);                   
                    session.setAttribute("Input", Input);   
                            %>
                            <tr><td bgcolor="<%=color%>"><input type = radio button name = r1 value = "<%=Input%>"></td>
                                <td bgcolor="<%=color%>"><%=rs.getString("Token_id")%></td>
                                <td bgcolor="<%=color%>"><%=rs.getString("Query_Fwd_date")%></td>
                                <td bgcolor="<%=color%>"><%=rs.getString("dept_name")%></td>
                                <td bgcolor="<%=color%>"><%=rs.getString("Query_Fwd_To")%></td>
                                <td bgcolor="<%=color%>" align="center">
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
                             </td> </tr>
                           <%  }
           
                        }
            catch (SQLException e) {
            e.printStackTrace();
            } finally { try {  conn.close();  } catch (Exception e) {  }	}
           }  %>                       
                  
                        </table><br><br>                     
                        
                        <center>
                            &nbsp;&nbsp;&nbsp; 
                            <input type = submit name = button value = ViewQuery onClick = "return Validation15();">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                            <input type = submit  name = button value = PostReply onClick="return Validation25();">&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <input type = submit  name = button value = Cancel></center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             
                        <br>
                        <%
            String s1 = "", s2 = "", s3 = "",s9 = "";
            ResultSet rs2 = (ResultSet) session.getAttribute("rs");
            if (rs2 != null) {
                while (rs2.next()) {
                    s1 = rs2.getString(1);
                    s2 = rs2.getString(2);
                    s9 = rs2.getString(9);
                    s3 = rs2.getString(10);
                   
                }
            }

                        %> 
                        <br>
                <table border = 1 width = 700 align = "center">  
                    <tr><td align = left>&nbsp;&nbsp;&nbsp;<input type = text name = "t1"  value = "<%=s1%>" readonly></td></tr>  
                    <tr><td width="800" align = "center"><b>Query Details :-</b><br>&nbsp;&nbsp;&nbsp;<textarea name ="Query_Details" rows="2" cols="90" readonly><% out.println(s9);%></textarea></td></tr>
                    <tr><td align = "center"><b>Query Reply :-</b><br>&nbsp;&nbsp;&nbsp;<textarea name ="Query_Reply" rows="2" cols="90"></textarea>
                </td></tr></table>
    </td></tr></table>   
</center>
<map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
    </map>

</form> 
</body>

</html>

    
              

