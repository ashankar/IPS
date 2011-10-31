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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: IGNOU EDUCATION GRID ::</title>
<style type="text/css">
</style>
<title>::IGNOU-Query Management System::</title>
<SCRIPT LANGUAGE = "JAVASCRIPT">

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
        var User11 = document.NewQueryForm.T_No.value ;
        var User22 = document.NewQueryForm.Expert.value ;
        if(User22 == "" || comp == "")
          {
         alert('Please select the expert and the query');
         return false;
           }
         else if(comp != User11)
           {
          alert('Token No. does not matches ! Please select a right query !!');
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


      function Validation35()
      {
        var x = document.getElementsByName('r1')
        var comp = "" ;
        for(var k=0;k<x.length;k++)
        if(x[k].checked)
        var comp = x[k].value;
        var User11 = document.NewQueryForm.T_No.value ;
        var User22 = document.NewQueryForm.Query_Reply.value ;
         if(User22 == "")
          {
         alert('Please give answer for the query before posting the reply');
         return false;
           }
         else if(comp != User11)
           {
          alert('Token No. does not matches ! Please select a right query !!');
          return false;
            }
        }

     </SCRIPT>

</head>
<body  onload= "window.status = 'Welcome to IGNOU Prashnottri Sewa';">
<form name="NewQueryForm" action = "NewQuery" onSubmit="return validateFormOnSubmit(this)" method="post">
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
                <tr><td> <%@ include file = "Links.jsp" %>   </td></tr></table>
                <center> <table width="800" height="360" border="0" bgcolor="#F7EFE7">
                <tr>
                <td align = "center">
                <table border=1 width = 800 > <tr><td>
                <table border = 1 width = 800><tr>
                    <td><font color = #74101A><b>Select</b></font></td>
                    <td><font color = #74101A><b>Token No</b></font></td>
                    <td><font color = #74101A><b>Name</b></font></td>
                    <td><font color = #74101A><b>Email Id</b></font></td>
                    <td><font color = #74101A><b>Query Date</b></font></td>
                    <td><font color = #74101A><b>RC/PI</b></font></td>
                    <td><font color = #74101A><b>Subject</b></font></td>
                    <td><font color = "#74101A"><b>Attachment</b></font></td>
                </tr>

                <%
                String Input = null;
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
                  RequestDispatcher view =  request.getRequestDispatcher("login.jsp");
                  view.forward(request,response);
                  }
                else
               {                
                try {            
                DataSource ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
                conn = ds.getConnection();                                                  
                stmt = conn.createStatement();
                String sql = "select token_id,name,email_id,region,subject,date,time,MAPEDNAME from user_query,uploads where department=" + "'" +Department+ "'&& status = 'New' && user_query.token_id=uploads.UPLOADID";
                String sql3 = "select emp_name from employee_details where department = '"+Department+"' and emp_category = 'Experts' ";
                rs = stmt.executeQuery(sql);                
                    while (rs.next()) {
                    Input = rs.getString("token_id");
                    time = rs.getDouble("time");
                    double diff = millisec - time;
                    if(diff < (1*60*60*1000))
                    {color = "#F7EFE7";}
                    else if ((diff >= (1*60*60*1000)) && (diff < (2*60*60*1000)))
                    color = "999933";
                    else
                    color = "#9999ff";
                    String CorrectTime = Double.toString(time);
                    session.setAttribute("Input", Input);
                    session.setAttribute("time",CorrectTime);

                %>
               <tr><td bgcolor="<%=color%>"><input type = "radio" name = "r1" value = "<%=Input%>"></td>
                    <td bgcolor="<%=color%>"><%=rs.getString("token_id")%></td>
                    <td bgcolor="<%=color%>"><%=rs.getString("name")%></td>
                    <td bgcolor="<%=color%>"><%=rs.getString("email_id")%></td>
                    <td bgcolor="<%=color%>"><%=rs.getString("date")%></td>
                    <td bgcolor="<%=color%>"><%=rs.getString("region")%></td>
                    <td bgcolor="<%=color%>"><%=rs.getString("subject")%></td>
                    <td bgcolor="<%=color%>" align = "center">
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
                           <% } %>
                           </table>
                           </center><br><br>
                 <center>
                &nbsp;&nbsp;&nbsp;
                <input type = submit name = button value = ViewQuery onClick = "return Validation15();">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <input type = submit name = button value = DeleteQuery onClick = "return Validation2();">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <input type = submit  name = button value = ForwardQuery onClick = "return Validation25();">&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type = submit  name = button value = Cancel></center>
               <br>
              <%
            String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", s7 = "", s8 = "", s9 = "",s10 = "";

            ResultSet rs2 = (ResultSet) session.getAttribute("rs");
            if (rs2 != null) {
                while (rs2.next()) {
                    s1 = rs2.getString(1);
                    s2 = rs2.getString(2);
                    s3 = rs2.getString(3);
                    s4 = rs2.getString(4);
                    s5 = rs2.getString(5);
                    s6 = rs2.getString(6);
                    s7 = rs2.getString(7);
                    s8 = rs2.getString(8);
                    s9 = rs2.getString(9);
                    s10 = rs2.getString(10);
                }    
            }
            %>
                <table border=0 width="650" align="center">
                <tr>
                <td align = "left"><b><b>Token No</b></td><td><input type = text name = T_No value = "<%=s1%>" readonly></td>
                <td align = "left"><b>Name</b></td><td><input type = text name = name size="20" maxlength = 30 value = "<%=s2%>" readonly></td></tr>
                <tr><td align = "left"><b>Email Id</b> </td><td><input type = text name = Email_Id value = "<%=s3%>" readonly></td>
                <td align = "left"><b>Study Center</b></td>
                <td><input type = text name = SC size="20" maxlength = 20 value ="<%=s4%>" readonly ></td>
                </tr>
                <tr><td align = "left"><b>RC / PI</b></td><td><input type = text name = Rc value = "<%=s5%>" readonly size="20" maxlength = 20></td>
                <td align = "left"><b>Subject</b></td><td><input type = text name = subject size="20" maxlength = 20 value = "<%=s7%>" readonly></td></tr>
                <tr><td align = "left"><b>Query Experts</b></td><td><select name = "Expert">
                    <option value = "" >----Select One----</option>
                 <%
                     ResultSet rs3 = stmt.executeQuery(sql3);
                     while(rs3.next())
                     { %>
                      <option value = "<%=rs3.getString(1)%>"><%=rs3.getString(1)%></option>
                      <% } 
                      %>
                      <option value ="admin">Administrator</option>
                      <option value ="rc_coord">Regional center</option>
                      </td>
               <td align = "left"><b>Query Date</b></td><td><input type = text name = Query_Date value = "<%=s10%>" readonly size="20" maxlength = 20></td></tr>
               </table><br>
               <table border = 1 width = 800 align = "center">
               <tr><td width="800" align = "center"><b>Query:-</b><br>&nbsp;&nbsp;&nbsp;<textarea name ="Query_Details" rows="2" cols="90" readonly><%=s9%></textarea></td></tr>
              <tr><td align = "center"><b>Query Reply :-</b><br>&nbsp;&nbsp;&nbsp;<textarea name ="Query_Reply" rows="2" cols="90"></textarea>
             </td></tr>
             <tr><td align="right"><b><input type = submit name = button value = Post_Reply onClick="return Validation35();"></td></tr></table>
             </center>   
            <%  }
            catch (SQLException e) {
            e.printStackTrace();
            } finally { try {  conn.close();  } catch (Exception e) {  }	}
           }  %>        
        </form>
        <tr>
        <td height="19" colspan="3" bgcolor="#330000"><div align="center"><font color="#CC9900" size="2"><strong>IGNOU
        Education Grid &copy; All aights reserved, ACIIL </strong>
        </font></div></td>
        </tr></table>
        </form>
        <map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
        <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
        <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
        </map>
        </body>
        </html>
