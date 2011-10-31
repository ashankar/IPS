<%@ page import="java.sql.Connection,
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html charset=iso-8859-1" />
        <title>::IGNOU Prashnottari Sewa::</title>   
       <script type="text/javascript">

    function validateFormOnSubmit(IndexForm) {
        var reason = "";
        reason+= validateNumeric(IndexForm.e_no);
        reason+=validatename(IndexForm.name);
        reason+= validateEmail(IndexForm.email_id);
        reason+=valDrop(IndexForm.region);
         reason+= validateNumeric(IndexForm.studycenter);        
        reason+= validatesubject(IndexForm.subject);
        reason+= valDrop(IndexForm.department);
        reason+=validatesubject(IndexForm.query);
       
        if (reason != "") {
            alert("Some fields need correction:\n" + reason);
            return false;
        }
        return true;
    }

    function validatename(fld)
    {
        var error = "";
        var illegalChars = /\W/; // allow letters, numbers, and underscores
        var re=/^[A-z]/;
        var strLength = fld.value.length;
        for(var i=0;i<strLength;i++)
        {  
            if(!isNaN(parseInt(fld.value.charAt(i))))
            {   
                     error = "Please Enter character only in Name feild.\n";
                     fld.style.background = '#F5D0A9';
            }
        }
      
        if (fld.value == "" ) 
        {
                error = "The required field has not been filled in "+fld.name+".\n";
              fld.style.background = '#F5D0A9';
        }             
          else if(!re.test(fld.value) )
          { 
             fld.style.background = '#F5D0A9'; 
              error="please enter char only.\n";  
             return error
            }
        else if ((fld.value.length < 3) || (fld.value.length > 50)) {
             error = "The username is the wrong length.\n";
                fld.style.background = '#F5D0A9'; 
         
        }
        else if (illegalChars.test(fld.value)) {
            fld.style.background = '#F5D0A9'; 
           error = "The username contains illegal characters.\n";
        }
        else {
            fld.style.background = 'White';
        }
        return error;
        
    }
    function validateE_No(fld)
    {
        var error = "";
        var illegalChars = /\W/;               
        if (fld.value == "" ) 
        {
            fld.style.background = '#F5D0A9'; 
            error = "The required field has not been filled in "+fld.name+".\n";
        }                 
        else if (illegalChars.test(fld.value)) {
            fld.style.background = '#F5D0A9'; 
            error = "The empid contains illegal characters.\n";
        }       
        else {
            fld.style.background = 'White';
        }
        return error;       
      }

     function validateEmail(fld) {
        var error="";
        var tfld = trim(fld.value);                       
        var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/ ;
        var illegalChars= /[\(\)\<\>\,\;\:\\\"\[\]]/ ;
   
        if (fld.value == "") {
            fld.style.background = '#F5D0A9';
            error = "The required field has not been filled in "+fld.name+".\n";
        } else if (!emailFilter.test(tfld)) {             
            fld.style.background = '#F5D0A9';
            error = "Please enter a valid email address.\n";
        } else if (fld.value.match(illegalChars)) {
            fld.style.background = '#F5D0A9';
            error = "The email address contains illegal characters.\n";
        } else {
            fld.style.background = 'White';
        }
        return error;
     }

    function valDrop(fld) {
        
        var error = "";
        if (fld.value == ""){
            fld.style.background = '#F5D0A9'; 
            error="Please select a concerned field "+fld.name+".\n";        
        } 
        else 
        {
            fld.style.background = 'White';
        }   
        return error;
      }    
   
    function validateNumeric(fld)
    {
        var error = "";
        var stripped = fld.value.replace(/[\(\)\.\-\ ]/g, '');   
         var strPass = fld.value;
        var strLength = strPass.length;
      
      for(var i=0;i<strLength;i++)
      {  if(isNaN(parseInt(fld.value.charAt(i))))
        {
           
      error = "The "+fld.name+" code contains illegal characters.\n";
        fld.style.background = '#F5D0A9';
        }            
       }
        
        if (fld.value == "") {
            error = "You didn't enter the "+fld.name+"code.\n";
            fld.style.background = '#F5D0A9';
         } else if (isNaN(parseInt(stripped))) {
            error = "The "+fld.name+" code contains illegal characters.\n";
            fld.style.background = '#F5D0A9';
         } else 
         {
            fld.style.background = 'White';
         }
        return error;
    }
     
   
     function validatesubject(fld) {
        var error = "";
        var illegalChars = /\W/; // allow letters, numbers, and underscores
        if (fld.value == "") {
           
            error = "The required field has not been filled in "+fld.name+".\n";
             fld.style.background = '#F5D0A9'; 
        }   
        else if ((fld.value.length < 5) || (fld.value.length > 500)) {
          
            error = "The subject is of wrong length.\n";
              fld.style.background = '#F5D0A9';
        } 
        else {
            fld.style.background = 'White';
        }
        return error;
    }

  
    function validateEmpty(fld) {
        var error = "";
 
        if (fld.value.length == 0) {
            fld.style.background = '#F5D0A9'; 
            error = "The required field has not been filled in.\n"
        } else {
            fld.style.background = 'White';
        }
        return error;  
    }

    function trim(s)
    {
        return s.replace(/^\s+|\s+$/, '');
    }

     function enableField()
      {
         document.IndexForm.region.disabled=false;
         document.IndexForm.deptTo.disabled=true;
         
       }
     function enableField2()
      {
         document.IndexForm.deptTo.disabled=false;
         document.IndexForm.region.disabled=true;
       
       }
    
</script>   
       </head>   
            <body onload= "window.status = 'Welcome to IGNOU Prashnottri Sewa';">
            <form name="IndexForm" action="DeptIndexRC" onSubmit="return validateFormOnSubmit(this)" method = "post" enctype="multipart/form-data">
             <center>          
               <table width="800" align="center" bgcolor="#F7EFE7">
                    <tr>
                        <td width = "115" align = "center">
                            <table width = "800" align = "center">
                                 <tr>
                                    <td width="115"><img src="Images/head.gif" width="800" height="150"></td>
                                 </tr>
                                 <tr>
                                    <td><img src="Images/links.gif" width="500" height="27" border="0" align="right" usemap="#Map2"></td>
                                 </tr>
                            </table>
 <table width="800" border="0" bgcolor="#F7EFE7"align = center>
            <tr>
                <td width="800" align="center" valign="top"> <%@ include file = "Links9.jsp" %></td>
        </tr></table>                    

                           </td>
                        </tr>
                      <tr>
                        <td height="5" colspan="3" bgcolor="#000000" align = "center"></td>
                     </tr>
                  </table>
            
                  <table align = "center" width = "815" bgcolor="#F7EFE7">
                   <tr>
                     <td align = "center" width = "815"><font size="3" face="Verdana, Arial, Helvetica, sans-serif">
                              <h3 align = "center"><u>IGNOU Prashnottari Sewa</u></h3></font></td></tr><td><tr></td></tr>
                             <tr><td align = "left"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">  
                           <table width = 650 align = "center"><tr><td> 
                          </td></tr><tr><td></td></tr>
                        </table> 
                         <table align = "center" width = "815" bgcolor="#F7EFE7"><tr><td>
                          <table align = "center" width = "600" bgcolor="#F7EFE7">
            <tr> 
              <td width="226" align="left"><strong><font color="#FF0033">*</font>Name</strong></td>
              <td width="10" align = "center">:</td>
              <td width="355" align="left"><input name="name" type="text" id="name" tabindex="1"></td>
            </tr>
            <tr> 
              <td align="left"><strong><font color="#FF0033">*</font>Emp-id</strong></td>
              <td align = "center">:</td>
              <td align="left"><input name="emp_id" type="text" tabindex="2"></td>
            </tr>
            <tr> 
              <td align="left"><strong><font color="#FF0033">*</font>Query
                From </strong></td>
              <td align = "center">:</td>
               
               <% String Department = (String)session.getAttribute("Department"); %>
              <td align="left"><select name="deptFrom" tabindex="3">
                                  <option value = "<%=Department %>"><%=Department %> </option>
                                   </select></td>
                                               
                   <%                                                    
                                                     
                Statement stmt = null;
                ResultSet rs = null;
                Connection conn = null;
                String User = (String)session.getAttribute("User");
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
                  %>  		                                
            </tr>
            <tr> 
              <td align="left"><strong><font color="#FF0033">*</font>Query
                To <br />
                </strong></td>
              <td align = "center">:</td>
              <td align="left">              <input type = radio name = "r1" value = "RC" onClick = "enableField();">&nbsp;
                                             <select name="region" tabindex="4" disabled = "true">
                                            <option value = "">---Select Regional Center---</option>
                                            <option value="RC 26">Agartala</option>
                                            <option value="RC 09">Ahmedabad</option>
                                            <option value="RC 19">Aizwal</option>
                                            <option value="RC 47">Aligarh</option>
                                            <option value="RC 13">Bangalore</option>
                                            <option value="RC 15">Bhopal</option>
                                            <option value="RC 21">Bhubneshwar</option>
                                            <option value="RC 52">Chandimandir</option>
                                            <option value="RC 25">Chennai</option>
                                            <option value="RC 14">Cochin</option>
                                            <option value="RC 46">Darbangha</option>
                                            <option value="RC 31">Dehradun</option>
                                            <option value="RC 07">Delhi 1</option>
                                            <option value="RC 29">Delhi 2</option>
                                            <option value="RC 24">Gangtok</option>
                                            <option value="RC 04">Guwahati</option>
                                            <option value="RC 01">Hyderabad</option>
                                            <option value="RC 17">Imphal</option>
                                            <option value="RC 03">Itanagar</option>
                                            <option value="RC 41">Jabalpur</option>
                                            <option value="RC 23">Jaipur</option>
                                            <option value="RC 12">Jammu</option>
                                            <option value="RC 10">Karnal</option>
                                            <option value="RC 22">Khanna</option>
                                            <option value="RC 20">Kohima</option>
                                            <option value="RC 74">Kochi Navy</option>
                                            <option value="RC 28">Kolkata</option>
                                            <option value="RC 51">Kolkata Army</option>
                                            <option value="RC 44">Koraput</option>
                                            <option value="RC 27">Lucknow</option>
                                            <option value="RC 53">Lucknow Army</option>
                                            <option value="RC 43">Madurai</option>
                                            <option value="RC 49">Mumbai</option>
                                            <option value="RC 72">Mumbai Navy</option>
                                            <option value="RC 71">New Delhi Navy</option>
                                            <option value="RC 08">Panaji</option>
                                            <option value="RC 05">Patna</option>
                                            <option value="RC 02">Port Blair</option>
                                            <option value="RC 16">Pune</option>
                                            <option value="RC 54">Pune Army</option>
                                            <option value="RC 35">Raipur</option>
                                            <option value="RC 42">Rajkot</option>
                                            <option value="RC 32">Ranchi</option>
                                            <option value="RC 18">Shillong</option>
                                            <option value="RC 81">Shillong Assam Rifles</option>
                                            <option value="RC 11">Shimla</option>
                                            <option value="RC 45">Siliguri</option>
                                            <option value="RC 30">Srinagar</option>
                                            <option value="RC 55">Udhampur</option>
                                            <option value="RC 48">Varanasi</option>
                                            <option value="RC 33">Vijayawada</option>
                                            <option value="RC 73">Visakhapatnam Navy</option>
                                            </select></td></tr>

                                     <tr>
                    <td>&nbsp</td>    <td>&nbsp;</td>    
                    <td align="left"> <input type = radio name = "r1" value = "Dept" onClick = "enableField2();">&nbsp;

                       <select name="deptTo" tabindex="4" disabled = "true">
                  <option value="">------------Select Department------------</option>
                                             <%
                                                  ResultSet rs2 = stmt.executeQuery("select * from  dept_details where status ='True'");
                                                  while (rs2.next()) {  %>
                  <option value = "<%=rs2.getString(2)%>"><%=rs2.getString(3)%></option>
              <% }
                  } 
            catch (SQLException e) {
            e.printStackTrace();
            } finally { try {  conn.close();  } catch (Exception e) {  }	}
             }  %>

                </select>
                         </td>
                   </tr>
			 <tr> 
              <td width="226" align="left"><strong><font color="#FF0033">*</font>Query Subject</strong></td>
              <td width="10" align = "center">:</td>
              <td width="355" align="left"><input name="Subject" type="text" id="name" tabindex="5"></td>
            </tr>
			<tr> 
              <td width="226" align="left"><strong><font color="#FF0033">*</font>Query</strong></td>
              <td width="10" align = "center">:</td>
              <td width="355" align="left"><textarea  name = "query" rows ="4" cols ="30" tabindex = "6"></textarea></td>
			    </tr>
			
            <tr> 
              <td align="left"><strong><font color="#FF0033">*</font>Date <br/>
                </strong></td>
				<td align = "center">:</td>
              <td colspan="2" align = "left">
              <%! String Date = null;  %>
               <%
			  Calendar cal = Calendar.getInstance();                
              int day=cal.get(Calendar.DATE);
              int month = cal.get(Calendar.MONTH) + 1;
              int year = cal.get(Calendar.YEAR);    
              Date = day+"/"+month+"/"+year;    %>
              
              
               <input type = "text" name = "CDate" value = "<%=Date%>"readonly>
              
</td>
            </tr>
<tr>
			<td width ="226" align ="left"><strong><font color="#ff0033">*</font>Attachment </td>
			 <td width="10" align = "center">:</td>
              <td width="355" align="left"><input type ="file" name = "file1" tabindex = "8"></td>
            </tr>
            <tr><td height = "10">&nbsp;</td></tr> 
            <tr> 
              <td align="left">&nbsp;</td>
              <td align = "center">&nbsp;</td>
              <td align="left"><input type="submit" name="submit" tabindex="9" value="Post"> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <input type="reset" name="Reset"  tabindex="10"> </td>
            </tr>
			
          </table>
                           </table>
                          <table height = "5" width = "815">
                           <tr>        
                            <td bgcolor="#330000" height = "5"><div align="center"><font color="#FFFFFF" size="1"><strong>IGNOU 
                            Edugrid &copy; All rights reserved 2009,ACIIL</strong></font> </div></td>
                            </tr>
                           </table>
                     </center>                     
            <map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
           </map>
            </form>       
        </body>
</html>
