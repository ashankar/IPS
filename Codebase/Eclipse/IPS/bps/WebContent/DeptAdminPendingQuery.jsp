<%@ page import="java.sql.Connection,
  javax.sql.DataSource,
  javax.naming.Context,
  javax.naming.InitialContext,
  java.sql.Statement,
  java.sql.ResultSet,
  java.sql.SQLException"%>
<%@ page errorPage="errorqms.jsp" %>
<%@ page import = "java.util.*" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>:: IGNOU Prashnottari Sewa::</title>
     <SCRIPT LANGUAGE = "JAVASCRIPT">

      function Validation25()
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

      function Validation2()
        {             
           var ans = confirm('Are you sure you want to delete the query?');
           if(ans)
               {return true;}
               else{return false;}        
          } 
 </SCRIPT>  
</head>
<body>
<form name="form1" action="DeptAdminPendingQuery" method="post">
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
                        </table></td></tr>
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
                                <td align="center"><font color =#74101A><b>Select</b></font></td> 
                                <td align="center"><font color = #74101A><b>Token Id</b></font></td>  
                                <td align="center"><font color = #74101A><b>Forward Date</b></font></td>
                                <td align="center"><font color = #74101A><b>Dept Name</b></font></td>
                                <td align="center"><font color = #74101A><b>Query Status</b></font></td>
                                <td align="center"><font color = #74101A><b>Forwarded To</b></font></td>

                                
                            
                            <%
                String Query = "";
                Statement stmt = null;
                ResultSet rs4 = null;
                Connection conn = null;
                String Department = (String)session.getAttribute("Department");// Get Attribute from DeptAdminPendingquery.java
                String User = (String)session.getAttribute("User");            // Get User Information from Login.java
                String Emp_Id = (String)session.getAttribute("Emp_Id");        //Get Employee-id from DeptExpertReply.java
                Calendar cal = new GregorianCalendar();                         //create calender Instance.
                double millisec = cal.getTimeInMillis();                        //get time in milisec with calender instance.
                double time = 0.0;
                String color = null;        
                if(User == null)
                    {
                  RequestDispatcher view =  request.getRequestDispatcher("login.jsp");    //If user has not login forward the page to Login.jsp
                  view.forward(request,response);
                  }
                else
                {
                try {            
                DataSource ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");     //Create initial context object and prform lookup with context object.
                conn = ds.getConnection();                                                 //get connection  from Data Source Pooling object.
                stmt = conn.createStatement();                                             //Create Connection with conn Object.
                String sql = "select * from dept_query where status = 'Expert_Forwarded' ";//Select all dept_query information.
                rs4 = stmt.executeQuery(sql);
                while (rs4.next())
                 {
                    String Input4 = rs4.getString(1);
                    time = rs4.getDouble(11);
                    double diff = millisec - time;
                    if(diff < (24*60*1000))
                    {color = "#F7EFE7";}
                    else if ((diff >= (24*60*60*1000)) && (diff < (48*60*60*1000)))
                    color = "#999933";
                    else 
                    color = "#9999ff"; 
                    String CorrectTime = Double.toString(time);                   
                                        
                   }
                
                ResultSet rs = stmt.executeQuery(sql);                       //Execute query and store result in ResultSet.
                while (rs.next()) {

                    String Input = rs.getString(1);
                    session.setAttribute("Input", Input);
                            %>
                            <tr><td align = "center" bgcolor="<%=color%>"><input type = radio button name = r1 value = "<%=Input%>"></td>
                                <td align = "center" bgcolor="<%=color%>"><%=rs.getString(1)%></td> 
                                <td align = "center" bgcolor="<%=color%>"><%=rs.getString(2)%></td> 
                                <td align = "center" bgcolor="<%=color%>"><%=rs.getString(6)%></td>
                                <td align = "center" bgcolor="<%=color%>"><%=rs.getString(7)%></td>
                                <td align = "center" bgcolor="<%=color%>"><%=rs.getString(10)%></td></tr>                           
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
            String s1 = "", s2 = "", s3 = "", s4 = "";
            ResultSet rs2 = (ResultSet) session.getAttribute("rs");
            if (rs2 != null) {
                while (rs2.next()) {
                    s1 = rs2.getString(1);
                    s2 = rs2.getString(2);
                    s3 = rs2.getString(9);
                    s4 = rs2.getString(6);
                   
                  
                }
              ResultSet rs5 = stmt.executeQuery("select Query_Details from dept_query where Token_id = '"+s1+"'");
                while (rs5.next()) {
                Query = rs5.getString(1);
                  }               
            }            
                        %>                         
                        <table border=0 width="700" align="center">
                          <tr>
                            <td><b>Token No</b></td><td><input type = text name = T_No value = "<%=s1%>" readonly></td>
                            <td><b>Forwarded To</b></td>
                 <td><input type = text name = Fwd_Name size="20" maxlength = 20 value ="<%=s3%>" readonly ></td>
                             <tr><td><b>Forward Date</b> </td><td><input type = text name = date value = "<%=s2%>" readonly></td>
                                <td><b>Dept Name</b></td>
                 <td><input type = text name = dept_name size="20" maxlength = 20 value ="<%=s4%>" readonly ></td>
                            </tr>
                              </table><br>
                <table border = 1 width = 700 align = "center">    
                    <tr><td width="800" align = "center"><b>Query Details :-</b><br>&nbsp;&nbsp;&nbsp;<textarea name ="Query_Details" rows="2" cols="90" readonly><%=Query%></textarea></td></tr>
                                    </td></tr></table>
            </td></tr></table>   
           </center>
          <%
            
            } catch (SQLException e) {
            e.printStackTrace();
            } finally { try {  conn.close();  } catch (Exception e) {  }	}
           }  %>

</form>
            <map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
    </map>
</body>

</html>

    
              


