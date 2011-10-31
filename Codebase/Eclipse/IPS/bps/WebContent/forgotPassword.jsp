<%@ page  errorPage="errorqms.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>::IGNOU-Query Management System::</title>
<script type="text/javascript">

    function Validation()
     {
        var User11 = document.AdminForm.Emp_Id.value ;
        var User22 = document.AdminForm.Name.value ;
        var User33 = document.AdminForm.EmailId.value ;
        var User44 = document.AdminForm.UserName.value ;
        if(User11 == "" || User22 == "" || User33 == "" || User44 == "")
        {
              alert('All the fields are mandatory ! Please fill all the fields !!');
		  return false;	
        }
	  return true;
    }     

   

    var monthtext=['01','02','03','04','05','06','07','08','09','10','11','12'];

    function populatedropdown(dayfield, monthfield, yearfield){
        var today=new Date()
        var dayfield=document.getElementById(dayfield)
        var monthfield=document.getElementById(monthfield)
        var yearfield=document.getElementById(yearfield)
        for (var i=0; i<32; i++)
            dayfield.options[i]=new Option(i, i+1)
        dayfield.options[today.getDate()]=new Option(today.getDate(), today.getDate(), true, true) //select today's day
        for (var m=0; m<12; m++)
            monthfield.options[m]=new Option(monthtext[m], monthtext[m])
        monthfield.options[today.getMonth()]=new Option(monthtext[today.getMonth()], monthtext[today.getMonth()], true, true) //select today's month
        var thisyear=today.getFullYear()-50
       
        for (var y=0; y<40; y++){
            yearfield.options[y]=new Option(thisyear, thisyear)
            thisyear+=1
        }
        yearfield.options[0]=new Option(today.getFullYear()-50, today.getFullYear()-50, true, true) //select today's year
      

    }
</script>
<script type="text/javascript">


    //populatedropdown(id_of_day_select, id_of_month_select, id_of_year_select)
    window.onload=function(){
        populatedropdown("daydropdown", "monthdropdown", "yeardropdown")
    }
 </script>

<style type="text/css">
    .style1 {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 13px;
    }
    .style2 {font-weight: bold}
</style>


<body>
    <form name = "AdminForm" action = "Forgot_Password" method = "post">
    
    <center>
                <table width="800" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#F7EFE7">
                    <tr>  <td><table width="800" border="0" cellspacing="0" cellpadding="0">
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
                        <td height="5" colspan="3" bgcolor="#000000"></td>
                    </tr>
                  </table>
            <table align="center" bgcolor="#F7EFE7" ><tr> <td width="800" valign="top" align="center" >
            <tr><td align = "center">
                          <font size="2" face="Verdana, Arial, Helvetica, sans-serif" align = "justify">
                            <b><u>IGNOU Prashnottari Sewa(IPS)</u></b></font> </td></tr>  
     
    <tr><td width="800" align="center">
      <br><b><align = "center">You are required to answer the following questions.</b></align> 
        <p>&nbsp; </p>
          <div align="center"></div>
         <table border = 2 align = center><tr><td>
          <table align="center">
            <tr> 
              <td width="112" align="left"><b>Employee Id.</b></td>
              <td width="298" align="center"><input type="text" name="emp_id"align=></td>
      </tr>
          <tr> 
              <td align="left"><b>Name</b></td>
              <td align="center"><input type="text" name="name"></td>
      </tr>
           <tr> 
            <td><b>Date of Birth:</b></td>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
             &nbsp;&nbsp;
       <select id="daydropdown" name="day">
        </select> 
        <select id="monthdropdown" name="month">
        </select> 
        <select id="yeardropdown" name="year">
        </select>       
        </td>
         </tr>                      
              <tr> 
              <td align="left"><b>Email Id</b></td>
              <td align="center"><input type="text" name="email_id">
          </td>
            </tr>
            
            <tr> 
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr> 
              <td><div align="center"> </div></td>
              <td> <div align="left"> 
                  <input type="submit" name="Submit" value="Submit" onClick="return Validation();">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  <input type="reset" name="Submit" value="Reset">
                </div></td>
            </tr>
          </table>
              
       
           <% 
           String Username = (String)session.getAttribute("Username");
           String Password = (String)session.getAttribute("Password");
           if(Password != null && Username != null)
              {
           out.println("<center><font color = red>Your Username is :- "+ Username+"</font><br>");
           out.println("<font color = red>Your Password is :- "+ Password+"</font></center>");  
           session.invalidate();
               }
           
              %>
      </table>      
        <h3 align="center">&nbsp; </h3>
        </td>
    </tr>
    </table> 
<tr>
<td height="19" bgcolor="#330000"><div align="center"><font color="white" size="2"><strong>IGNOU
              Education Grid &copy; All rights reserved, ACIIL </strong>
              </font></div></td>
</tr>

</td></tr></table>
</center>
</form>
<map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
    </map>
</body>
</html>
