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
<title>:: IGNOU Prashnottari Sewa ::</title>
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
        var User22 = document.NewQueryForm.Department.value ;
        var User11 = document.NewQueryForm.T_No.value ;
        if(User22 == "" || comp == "")
          {
         alert('Please select the department and the query');
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

       </SCRIPT>  
</head>
<body>
<form name="NewQueryForm" action="DeptInterNewQuery" method="post">
<table width="800" border="0" align="center" cellpadding="1" cellspacing="1">
<tr>
    <td>
        <table width="800" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <div align="center"><img src="Images/head.gif" width="815" height="150" /></div>
                </td>
            </tr>
            <tr><td bgcolor="#F7EFE7"><div align="right"><a href="http://ignou.ac.in"><img src="Images/links.gif" width="500" height="27" border="0" usemap="#Map2" /></a></div>
                </td></tr>            
    </table></td>
</tr>
<tr><td> <%@ include file = "Links8.jsp" %>   </td></tr></table>
       <center> <table width="800" height="360" border="0" bgcolor="#F7EFE7">
        <tr>
        <td width="320" align="center" valign="top"> 
        
        <center>
            <table border=1 width = 800 > <tr><td> 
            <table border = 1 width = 800><tr> 
                    <td ><font color =#74101A><b>Select</b></font></td>
                    <td><font color = #74101A><b>Token No</b></font></td>
                    <td><font color = #74101A><b>Name</b></font></td> 
                    <td><font color = #74101A><b>Dept From</b></font></td>
                    <td><font color = #74101A><b>Subject</b></font></td> 
                    <td><font color = #74101A><b>Query Date </b></font></td>              
                    <td><font color = #74101A><b>Query</b></font></td>
                    </tr>
                
                <%
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
                String sql = "select * from dept_query where Dept_To ='admin' or Dept_To ='others'";
                String sql3 = "select *from dept_details where status = 'True' ";
                rs = stmt.executeQuery(sql);
                while (rs.next()) 
                  {
                    String Input = rs.getString(1);
                    session.setAttribute("Input", Input);   
                %>
               <tr><td><input type = radio button name = r1 value = "<%=Input%>"></td>
                    <td><%out.println(rs.getString(1));%></td> 
                    <td><% out.println(rs.getString(2));%></td> 
                    <td><% out.println(rs.getString(3));%></td>
                    <td><%out.println(rs.getString(5));%></td>
                    <td><% out.println(rs.getString(7));%></td>
                    <td><% out.println(rs.getString(6));%></td></tr>      
                <% } %>                
      
        </table></center><br><br>            
            
            <center>
                &nbsp;&nbsp;&nbsp; 
                <input type = submit name = button value = ViewQuery onClick = "return Validation15();">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <input type = submit name = button value = DeleteQuery onClick="return Validation2();" >
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <input type = submit  name = button value = ForwardQuery onClick = "return Validation25();">&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <input type = submit  name = button value = Cancel></center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            
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
                    <td><b><b>Token_No</b></td><td><input type = text name = T_No value = "<% out.println(s1);%>" readonly></td>
                <td><b>Name</b></td><td><input type = text name = name size="20" maxlength = 30 value = "<% out.println(s2);%>" readonly></td></tr>
                <tr><td><b>Department From</b> </td><td><input type = text name = Department From value = "<% out.println(s3);%>" readonly></td>
                 <td><b>Subject</b></td><td><input type = text name = subject size="20" maxlength = 20 value = "<% out.println(s5);%>" readonly></td>
                  </tr>
           
                <tr><td><b>Forward To</b></td><td><select name = "Dept">
                 <option value = "">---Select One---</option>
                 <% 
                     ResultSet rs3 = stmt.executeQuery(sql3);                   
                     while(rs3.next())
                     { %>
                 <option value = "<%=rs3.getString(2)%>"><%=rs3.getString(3)%></option>
                      <% }                 
                      %>
                     </td>
        <td><b>Query Date</b></td><td><input type = text name = Query Date value = "<% out.println(s7);%>" readonly size="20" maxlength = 20></td></tr>
    </table><br>
    <table border = 1 width = 800>    
        <tr><td width="800" align = "center"><b>Query:-</b><br>&nbsp;&nbsp;&nbsp;<textarea name ="Query_Details" rows="2" cols="90" readonly><% out.println(s6);%></textarea></td></tr>
        <%  }
                          
            catch (SQLException e) {
            e.printStackTrace();
            } finally { try {  conn.close();  } catch (Exception e) {  }	}
             } %>


       </table>    
</center>    
<map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
           </map>

</form> 
</body>

</html>

    
              

