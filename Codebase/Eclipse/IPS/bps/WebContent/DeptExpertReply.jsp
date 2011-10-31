<%@ page import="java.sql.Connection,
  javax.sql.DataSource,
  javax.naming.Context,
  javax.naming.InitialContext,
  java.sql.Statement,
  java.sql.ResultSet,
  java.sql.SQLException"%>
<%@ page errorPage = "errorqms.jsp" %>
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
        var User23 = document.Reply_Query.Query_Reply.value ;
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
          else if(User23 == "")
          {
         alert('Please give answer for the query before posting the reply');
         return false;
            }
        }       
  </SCRIPT>  
</head>
<body>
<form name="Reply_Query" action="DeptExpertReply" method="post">
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
                <td width="800" align="center" valign="top"> <%@ include file = "Links7.jsp" %></td>
        </tr></table>       
        <center>
            <table border=1 width = 800 > <tr><td> 
                        <table border = 1 width = 800><tr> 
                                <td align = "center"><font color =#74101A><b>Select</b></font></td> 
                                <td align = "center"><font color = #74101A><b>Token Id</b></font></td> 
                                <td align = "center"><font color = #74101A><b>Forward Date</b></font></td> 
                                <td align = "center"><font color = #74101A><b>Department</b></font></td>
                                <td align = "center"><font color = #74101A><b>Query Fwd To</b></font></td></tr>
                            
                            <%
                     String s1 = "", s2 = ""; 
                     Statement stmt = null;
                     ResultSet rs = null;
                     ResultSet rs2 = null;
                     Connection conn = null;
                     String Department = (String)session.getAttribute("Department");//getting the value of department from session and storing it into department variable
                     String User = (String)session.getAttribute("User");//getting the value of user from session and storing it into user variable
                     String Emp_Id = (String)session.getAttribute("Emp_Id");//getting the value of emp_id from session and storing it into emp_id variable
                     String User22 = (String)session.getAttribute("User22");;//getting the value of user from session and storing it into user22 variable
                     String color = null;
                     String status = null;
                     Calendar cal = Calendar.getInstance();  
                     double millisec = cal.getTimeInMillis();
                     double time = 0.0; 
                     if(User == null)
                      {
                     RequestDispatcher view =  request.getRequestDispatcher("DeptLogin.jsp");//if user variable is not initialized then the page will be forwarded to the DeptLogin.jsp
                     view.forward(request,response); //request and respose objects are passed to the forward method
                     }
                     else
                     {
                  try  {                                     
                DataSource ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");//database pooling
                conn = ds.getConnection();                                                  
                stmt = conn.createStatement();
                //query is stored in sql variable
                String sql = "SELECT * FROM deptqueryinfo where DeptName = '"+Department+"' && QueryFwdTo ='"+User22+"' && QueryStatus = 'Expert_Forwarded'";
                rs = stmt.executeQuery(sql);//string variable is paased in executeQuery method to execute
                                           //the string passed with the statement object and stored in request object rs
                while (rs.next())//resultset rs object will iterate till it has values in the database
                    {
                    String Input = rs.getString(1);//first column value is fetched and stored in input variable
                    time = rs.getDouble(10);
                    double diff = millisec - time;
                    if(diff < (24*60*60*1000))
                    {color = "#F7EFE7";}
                    else if ((diff >= (24*60*60*1000)) && (diff < (48*60*60*1000)))
                    color = "#999933";
                    else 
                    color = "#9999ff"; 
                    String CorrectTime = Double.toString(time);                          
                    session.setAttribute("Input", Input);   //input variable is stored in session input variable
                            %>
                            <tr><td align = "center" bgcolor="<%=color%>"><input type = radio button name = r1 value = "<%=Input%>"></td>
                                <td align = "center" bgcolor="<%=color%>"><%=rs.getString(1)%></td> 
                                <td align = "center" bgcolor="<%=color%>"><%=rs.getString(2)%></td>
                                <td align = "center" bgcolor="<%=color%>"><%=rs.getString(6)%></td>
                                <td align = "center" bgcolor="<%=color%>"><%=rs.getString(9)%></td></tr>
                               <%  } 
                             
                            %>
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
            rs2 = (ResultSet) session.getAttribute("rs");//rs variable is stored in session variable and typecast into resultset and stored in resultset object
            if (rs2 != null)//checks that rs2 value is not null
                {
                while (rs2.next())//checks untill rs2 is not null
                    {
                    s1 = rs2.getString(1);//stores the value of first column in string variable s1
                    s2 = rs2.getString(6);//stores the value of sixth column in string variable s2
                   }
                } 
            }
             catch (SQLException e) {
            e.printStackTrace();
            } finally { try {  conn.close();  } catch (Exception e) {  }	}
            }  %>          
                      
                        <br>
                <table border = 1 width = 700 align="center">  
                    <tr><td align = left>&nbsp;&nbsp;&nbsp;<input type = text name = "t1"  value = "<%=s1%>" readonly></td></tr>  
                    <tr><td width="800" align="center"><b>Query Details :-</b><br>&nbsp;&nbsp;&nbsp;<textarea name ="Query_Details" rows="2" cols="90" readonly><% out.println(s2);%></textarea></td></tr>
                    <tr><td align="center"><b>Query Reply :-</b><br>&nbsp;&nbsp;&nbsp;<textarea name ="Query_Reply" rows="2" cols="90"></textarea>
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

    
              

