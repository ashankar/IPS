<%@ page errorPage="errorqms.jsp" %>
<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*, javax.naming.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>::IGNOU-Query Management System::</title>
<script type="text/javascript">
    function validateFormOnSubmit(AdminForm) {
        var reason = "";
        reason+= validateEmpID(AdminForm.empid);
        reason+=validatename(AdminForm.name);
        reason+=checkRadio(AdminForm.gender);
         reason+=checkRadio(AdminForm.category);
    //    reason+= valDrop(AdminForm.department);
        reason+= validateEmail(AdminForm.emailid);
        reason+= valDrop(AdminForm.country);
        reason+= validateaddfield(AdminForm.add);
        reason+=validateNumeric(AdminForm.zip);
        reason+=validateNumeric(AdminForm.std);
        reason+=validateNumeric(AdminForm.cntno);
        reason+=validateMobile(AdminForm.mob);
        reason+=validatename(AdminForm.login);
        reason+= validatePassword(AdminForm.pass);
        reason+= confirmpass(AdminForm.pass,AdminForm.cpass);
        if (reason != "") {
            alert("Some fields need correction:\n" + reason);
            return false;
        }
        return true;
    }
   
    function validateNumeric(fld)
    {
        var error = "";
        var stripped = fld.value.replace(/[\(\)\.\-\ ]/g, '');   
         var strPass = fld.value;
        var strLength = strPass.length;
      for(var i=0;i<strLength;i++)
      {
          if(isNaN(parseInt(fld.value.charAt(i)))){
           
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
     
      
    
    function validateMobile(fld) {
    var error = "";
    var stripped = fld.value.replace(/[\(\)\.\-\ ]/g, '');    
   var strPass = fld.value;
        var strLength = strPass.length;
      for(var i=0;i<strLength;i++)
      {
          
         
           if(isNaN(parseInt(fld.value.charAt(i)))){
           
      error = "You didn't enter correct mobile number.\n";
        fld.style.background = '#F5D0A9';
        }            
    } if (fld.value == "") {
        error = "You didn't enter a mobile number.\n";
        fld.style.background = '#F5D0A9';
    } else if ((strLength!= 10)) {
        error = "The mobile number is the wrong length.\n";
        fld.style.background = '#F5D0A9';
    }else if(stripped.charAt(0)!="9"){
       error="Mobile number should start with 9 .\n";
       fld.style.background = '#F5D0A9'; 
    }
          
 else 
        {
            fld.style.background = 'White';
        }
        
    return error;
}
      function checkRadio(fld)
    {
        var cnt = -1;
        var error = "";
        for (var i=fld.length-1; i > -1; i--) 
        {
            if (fld[i].checked) {cnt = i; i = -1;}
        
        }
        if(cnt <=-1)
            error="Please select a concerned radio button..\n";
        
   
        return  error;
         
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
    
    function validateEmpID(fld)
    {
        var error = "";
        var illegalChars = /\W/; // allow letters, numbers, and underscores
         
        
        if (fld.value == "" ) 
        {
            fld.style.background = '#F5D0A9'; 
            error = "Please Enter the Employee ID.\n";
        } 
                
        else if (illegalChars.test(fld.value)) {
            fld.style.background = '#F5D0A9'; 
            error = "The Employee id contains illegal characters.\n";
        }
        
       
        else {
            fld.style.background = 'White';
        }
        return error;        
    }
    
    function validatename(fld)
    {
        var error = "";
        var illegalChars = /\W/; // allow letters, numbers, and underscores
        var re=/^[A-z]+$/;
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
                
     
        else if ((fld.value.length < 3) || (fld.value.length > 25)) {
             error = "The username is the wrong length.\n";
                fld.style.background = '#F5D0A9'; 
         
        }
     
        else {
            fld.style.background = 'White';
        }
        return error;
        
    }
    
    function validatePassword(fld) {
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers 
 
    if (fld.value == "") {
        fld.style.background =  '#F5D0A9';
        error = "You didn't enter a "+fld.name+"word.\n";
    } else if ((fld.value.length < 7)) {
        error = "The"+fld.name+"word is the wrong length. \n";
        fld.style.background =  '#F5D0A9';
    } else if (illegalChars.test(fld.value)) {
        error = "The "+fld.name+"word contains illegal characters.\n";
        fld.style.background =  '#F5D0A9';
    } 
    else {
        fld.style.background = 'White';
    }
   return error;
}   
function confirmpass(fld,cfld)
{ 
var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers 
 
    if (cfld.value == "") {
         error = "You didn't enter a "+cfld.name+"word.\n";
        cfld.style.background =  '#F5D0A9';
    } else if ((cfld.value.length < 7)) {
        error = "The"+cfld.name+"word is the wrong length. \n";
        cfld.style.background =  '#F5D0A9';
    } else if (illegalChars.test(cfld.value)) {
        error = "The "+cfld.name+"word contains illegal characters.\n";
        cfld.style.background =  '#F5D0A9';
    } 
   
 
  else if(cfld.value!=fld.value)
  
       {
            error = "please confirm password.\n";
      
             fld.style.background = '#F5D0A9'; 
       }
    
        else {
            fld.style.background = 'White';
        }
        return error;
           
}
    
    function validatesubjectfield(fld) {
        var error = "";
        var illegalChars = /\W/; // allow letters, numbers, and underscores
        if (fld.value == "") {
           
            error = "The required field has not been filled in "+fld.name+".\n";
             fld.style.background = '#F5D0A9'; 
        }   
        else if ((fld.value.length < 5) || (fld.value.length > 100)) {
          
            error = "The subject is the wrong length,it should be maximum by 25 characters.\n";
              fld.style.background = '#F5D0A9';
        } 
        else {
            fld.style.background = 'White';
        }
        return error;
    }

    function validateaddfield(fld) {
        var error = "";
        var illegalChars = /\W/; // allow letters, numbers, and underscores
        if (fld.value == "") {
           error = "The required field has not been filled in "+fld.name+".\n";
              fld.style.background = '#F5D0A9'; 
        }   
        else if ((fld.value.length < 5) || (fld.value.length > 500)) {
           
            error = "The address is of the wrong length,it should be maximum by 500 characters.\n";
            
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
         document.AdminForm.region.disabled=false;
         document.AdminForm.department.disabled=true;
         
       }
     function enableField2()
      {
         document.AdminForm.department.disabled=false;
         document.AdminForm.region.disabled=true;
       
       }



    function validateEmail(fld) {
        var error="";
        var tfld = trim(fld.value);                        // value of field with whitespace trimmed off
        var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/ ;
        var illegalChars= /[\(\)\<\>\,\;\:\\\"\[\]]/ ;
   
        if (fld.value == "") {
            fld.style.background = '#F5D0A9';
            error = "Please Enter the Email address.\n";
        } else if (!emailFilter.test(tfld)) {              //test email for illegal characters
            fld.style.background = '#F5D0A9';
            error = "Please Enter a valid email address.\n";
        } else if (fld.value.match(illegalChars)) {
            fld.style.background = '#F5D0A9';
            error = "The Email address contains illegal characters.\n";
        } else {
            fld.style.background = 'White';
        }
        return error;
    } 
        
    var monthtext=['01','02','03','04','05','06','07','08','09','10','11','12'];

    function populatedropdown(dayfield, monthfield, yearfield){
        var today=new Date()
        var dayfield=document.getElementById(dayfield)
        var monthfield=document.getElementById(monthfield)
        var yearfield=document.getElementById(yearfield)
        for (var i=0; i<31; i++)
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
        //yearfield.options[0]=new Option(today.setYear(1950), today.setYear(1950), true, true) //select today's year

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


    </head>

<body>
    <form name = "AdminForm" action = "Deptadmin_reg" method = "post" onsubmit="return validateFormOnSubmit(this)" >
    
    <center>
                <table width="800" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#F7EFE7">
                    <tr>
                        <td colspan="3">
                            <table width="680" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="115"><img src="Images/head.gif" width="800" height="150" /></td>
                                </tr>
                                <tr>
                                    <td><img src="Images/links.gif" width="500" height="27" border="0" align="right" usemap="#Map2" /></td>
                                </tr>
                        </table>
            <table width="800" border="0" align="center" cellpadding="1" cellspacing="1" align="center"> 
            <tr>
            <td> <%@ include file="Links8.jsp" %></td>
    </tr></table>
       
                
                <table bgcolor="#F7EFE7" align = center><tr> <td width="800" valign="top" align="center">
                                
                                   <table align="center">
                                       <h3 align = center>Administrators Registration Form</h3>
                                   <table align="center">
                                    <tr> 
                                        <td width="112"><b>Employee ID.:</b></td>
                                        <td width="320"><input type="text" name="empid"></td>
                                    </tr>
                                    
                                    <tr> 
                                        <td><b>Name:</b></td>
                                        <td><input type="text" name="name"></td>
                                    </tr>
                                    
                                    <tr> 
                                        <td><b>Gender:</b></td>
                                        <td>
                                            <input type="radio" name="gender" value="Female"/>Female
                                            <input type="radio" name="gender" value="Male"/>Male
                                        </td>
                                    </tr>
                                    
                                    <tr> 
                                    
                                     <td><b>Date of Birth:</b></td>
        <td>
        
       <select id="daydropdown" name = "day">
        </select> 
        <select id="monthdropdown" name = "month">
        </select> 
        <select id="yeardropdown" name = "year">
        </select> 
            </td>              </tr>
                                    
                                    <tr> 
                                        <td><b>Category:</b></td>
                                        <td><input type="radio" name="category" value="admin" />Administrator
                                            <br>
                                             <input type="radio" name="category" value="dept" />Department Official
                                        <br>
                                        <input type="radio" name="category" value="rc_cord" />RC Cordinator
                                         <br>
                                            <input type="radio" name="category" value="Experts" />Dept Experts
                                         <br>
                                         <input type="radio" name="category" value="RCExperts"/>RC Experts

                                           </td>
                                        
                                    </tr>
                                     <tr>
                                   <td><b>Department:</b></td>
                                        <td>
                                              <input type = radio name = "r1" value = "Dept" onClick = "enableField2();">&nbsp; 
                                               <select name="department" disabled = "true">
                                                 <option value="">------------Select One------------</option>
                                                <%
            String Department = (String) session.getAttribute("Department");
            String User = (String) session.getAttribute("User");
             if(User == null)
            {
            RequestDispatcher view =  request.getRequestDispatcher("login.jsp");
            view.forward(request,response); 
            }
            else
            {
                Connection conn=null;

                 try {
                    Statement stmt = null;
                    ResultSet rs = null;
                    DataSource ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
                    conn = ds.getConnection();
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery("select *from  dept_details where status = 'True'");
                    while (rs.next()) {%>
            <option value="<%=rs.getString(2)%>"><%=rs.getString(3)%></option>
            <% }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally { try {  conn.close();  } catch (Exception e) {  }	}
            }%>                                       
            </select>
            </td></tr>
             <tr> <td>&nbsp;</td>  
                  <td align="left">             <input type = radio name = "r1" value = "RC" onClick = "enableField();">&nbsp;
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
                                        <td><b>Emailid:</b></td>
                                        <td><input type="text" name="emailid"></td>
                                    </tr>
                                    <tr> 
                                        <td><b>Country:</b></td>
                                        <td><select name="country">
                                             <option value="">--------------Select One--------------</option>
                                                
                                            <option value="af">Afghanistan</option>
                                            <option value="ax">Aland Islands</option>
                                            <option value="al">Albania</option>
                                            <option value="dz">Algeria</option>
                                            <option value="as">American Samoa</option>
                                            <option value="ad">Andorra</option>
                                            
                                            <option value="ao">Angola</option>
                                            <option
                                                value="ai">Anguilla</option>
                                            <option value="aq">Antarctica</option>
                                            <option
                                                value="ag">Antigua and Barbuda</option>
                                            <option value="ar">Argentina</option>
                                            <option value="am">Armenia</option>
                                            
                                            <option value="aw">Aruba</option>
                                            <option
                                                value="au">Australia</option>
                                            <option value="at">Austria</option>
                                            <option
                                                value="az">Azerbaijan</option>
                                            <option value="bs">Bahamas</option>
                                            <option
                                                value="bh">Bahrain</option>
                                            
                                            <option value="bd">Bangladesh</option>
                                            <option
                                                value="bb">Barbados</option>
                                            <option value="by">Belarus</option>
                                            <option
                                                value="be">Belgium</option>
                                            <option value="bz">Belize</option>
                                            <option
                                                value="bj">Benin</option>
                                            
                                            <option value="bm">Bermuda</option>
                                            <option
                                                value="bt">Bhutan</option>
                                            <option value="bo">Bolivia</option>
                                            <option
                                                value="ba">Bosnia and Herzegovina</option>
                                            <option value="bw">Botswana</option>
                                            <option value="bv">Bouvet Island</option>
                                            
                                            <option value="br">Brazil</option>
                                            <option value="io">British Indian Ocean Territory</option>
                                            <option
                                                value="vg">British Virgin Islands</option>
                                            <option value="bn">Brunei</option>
                                            <option value="bg">Bulgaria</option>
                                            <option value="bf">Burkina Faso</option>
                                            
                                            <option value="bi">Burundi</option>
                                            <option value="kh">Cambodia</option>
                                            <option
                                                value="cm">Cameroon</option>
                                            <option value="ca">Canada</option>
                                            <option
                                                value="cv">Cape Verde</option>
                                            <option value="ky">Cayman Islands</option>
                                            
                                            <option
                                                value="cf">Central African Republic</option>
                                            <option value="td">Chad</option>
                                            <option value="cl">Chile</option>
                                            <option value="cn">China</option>
                                            <option
                                                value="cx">Christmas Island</option>
                                            <option value="cc">Cocos (Keeling) Islands</option>
                                            
                                            <option value="co">Colombia</option>
                                            <option value="km">Union of the Comoros</option>
                                            <option value="cg">Congo</option>
                                            <option value="ck">Cook Islands</option>
                                            <option value="cr">Costa Rica</option>
                                            <option
                                                value="hr">Croatia</option>
                                            
                                            <option value="cu">Cuba</option>
                                            <option
                                                value="cy">Cyprus</option>
                                            <option value="cz">Czech Republic</option>
                                            <option
                                                value="cd">Democratic Republic of Congo</option>
                                            <option
                                                value="dk">Denmark</option>
                                            <option value="xx">Disputed Territory</option>
                                            
                                            <option
                                                value="dj">Djibouti</option>
                                            <option value="dm">Dominica</option>
                                            <option
                                                value="do">Dominican Republic</option>
                                            <option value="tl">East Timor</option>
                                            <option value="ec">Ecuador</option>
                                            <option value="eg">Egypt</option>
                                            
                                            <option
                                                value="sv">El Salvador</option>
                                            <option value="gq">Equatorial Guinea</option>
                                            <option value="er">Eritrea</option>
                                            <option value="ee">Estonia</option>
                                            <option
                                                value="et">Ethiopia</option>
                                            <option value="fk">Falkland Islands</option>
                                            
                                            <option
                                                value="fo">Faroe Islands</option>
                                            <option value="fm">Federated States of Micronesia</option>
                                            <option value="fj">Fiji</option>
                                            <option
                                                value="fi">Finland</option>
                                            <option value="fr">France</option>
                                            <option
                                                value="gf">French Guyana</option>
                                            
                                            <option value="pf">French Polynesia</option>
                                            <option value="tf">French Southern Territories</option>
                                            <option
                                                value="ga">Gabon</option>
                                            <option value="gm">Gambia</option>
                                            <option
                                                value="ge">Georgia</option>
                                            <option value="de">Germany</option>
                                            
                                            <option
                                                value="gh">Ghana</option>
                                            <option value="gi">Gibraltar</option>
                                            <option
                                                value="gr">Greece</option>
                                            <option value="gl">Greenland</option>
                                            <option
                                                value="gd">Grenada</option>
                                            <option value="gp">Guadeloupe</option>
                                            
                                            <option
                                                value="gu">Guam</option>
                                            <option value="gt">Guatemala</option>
                                            <option
                                                value="gn">Guinea</option>
                                            <option value="gw">Guinea-Bissau</option>
                                            <option
                                                value="gy">Guyana</option>
                                            <option value="ht">Haiti</option>
                                            
                                            <option
                                                value="hm">Heard Island and McDonald Islands</option>
                                            <option
                                                value="hn">Honduras</option>
                                            <option value="hk">Hong Kong</option>
                                            <option
                                                value="hu">Hungary</option>
                                            <option value="is">Iceland</option>
                                            <option value="India">India</option>
                                            
                                            <option value="id">Indonesia</option>
                                            <option
                                                value="ir">Iran</option>
                                            <option value="iq">Iraq</option>
                                            <option
                                                value="xe">Iraq-Saudi Arabia Neutral Zone</option>
                                            <option
                                                value="ie">Ireland</option>
                                            <option value="il">Israel</option>
                                            
                                            <option
                                                value="it">Italy</option>
                                            <option value="ci">Ivory Coast</option>
                                            <option
                                                value="jm">Jamaica</option>
                                            <option value="jp">Japan</option>
                                            <option
                                                value="jo">Jordan</option>
                                            <option value="kz">Kazakhstan</option>
                                            
                                            <option
                                                value="ke">Kenya</option>
                                            <option value="ki">Kiribati</option>
                                            
                                            <option
                                                value="kw">Kuwait</option>
                                            <option value="kg">Kyrgyz Republic</option>
                                            <option
                                                value="la">Laos</option>
                                            <option value="lv">Latvia</option>
                                            
                                            <option
                                                value="lb">Lebanon</option>
                                            <option value="ls">Lesotho</option>
                                            <option
                                                value="lr">Liberia</option>
                                            <option value="ly">Libya</option>
                                            <option
                                                value="li">Liechtenstein</option>
                                            <option value="lt">Lithuania</option>
                                            
                                            <option
                                                value="lu">Luxembourg</option>
                                            <option value="mo">Macau</option>
                                            <option
                                                value="mk">Macedonia</option>
                                            <option value="mg">Madagascar</option>
                                            <option
                                                value="mw">Malawi</option>
                                            <option value="my">Malaysia</option>
                                            
                                            <option
                                                value="mv">Maldives</option>
                                            <option value="ml">Mali</option>
                                            <option
                                                value="mt">Malta</option>
                                            <option value="mh">Marshall Islands</option>
                                            <option
                                                value="mq">Martinique</option>
                                            <option value="mr">Mauritania</option>
                                            
                                            <option
                                                value="mu">Mauritius</option>
                                            <option value="yt">Mayotte</option>
                                            <option
                                                value="mx">Mexico</option>
                                            <option value="md">Moldova</option>
                                            <option
                                                value="mc">Monaco</option>
                                            <option value="mn">Mongolia</option>
                                            
                                            <option
                                                value="ms">Montserrat</option>
                                            <option value="ma">Morocco</option>
                                            <option
                                                value="mz">Mozambique</option>
                                            <option value="mm">Myanmar</option>
                                            <option
                                                value="na">Namibia</option>
                                            <option value="nr">Nauru</option>
                                            
                                            <option
                                                value="np">Nepal</option>
                                            <option value="nl">Netherlands</option>
                                            <option
                                                value="an">Netherlands Antilles</option>
                                            <option value="nc">New Caledonia</option>
                                            <option value="nz">New Zealand</option>
                                            <option value="ni">Nicaragua</option>
                                            
                                            <option value="ne">Niger</option>
                                            <option value="ng">Nigeria</option>
                                            <option
                                                value="nu">Niue</option>
                                            <option value="nf">Norfolk Island</option>
                                            <option
                                                value="kp">North Korea</option>
                                            <option value="mp">Northern Mariana Islands</option>
                                            
                                            <option value="no">Norway</option>
                                            <option
                                                value="om">Oman</option>
                                            <option value="pk">Pakistan</option>
                                            <option
                                                value="pw">Palau</option>
                                            <option value="ps">Occupied Palestinian Territories</option>
                                            <option value="pa">Panama</option>
                                            
                                            <option value="pg">Papua New Guinea</option>
                                            <option value="py">Paraguay</option>
                                            <option
                                                value="pe">Peru</option>
                                            <option value="ph">Philippines</option>
                                            <option
                                                value="pn">Pitcairn Islands</option>
                                            <option value="pl">Poland</option>
                                            
                                            <option
                                                value="pt">Portugal</option>
                                            <option value="pr">Puerto Rico</option>
                                            <option
                                                value="qa">Qatar</option>
                                            <option value="re">Reunion</option>
                                            <option
                                                value="ro">Romania</option>
                                            <option value="ru">Russia</option>
                                            
                                            <option
                                                value="rw">Rwanda</option>
                                            <option value="sh">Saint Helena and Dependencies</option>
                                            <option value="kn">Saint Kitts &amp; Nevis</option>
                                            <option value="lc">Saint Lucia</option>
                                            <option value="pm">Saint Pierre and Miquelon</option>
                                            
                                            <option value="vc">Saint Vincent and the Grenadines</option>
                                            <option value="ws">Samoa</option>
                                            <option value="sm">San Marino</option>
                                            <option
                                                value="st">Sao Tome and Principe</option>
                                            <option value="sa">Saudi Arabia</option>
                                            <option value="sn">Senegal</option>
                                            
                                            <option value="cs">Serbia and Montenegro</option>
                                            <option value="sc">Seychelles</option>
                                            <option
                                                value="sl">Sierra Leone</option>
                                            <option value="sg">Singapore</option>
                                            <option
                                                value="sk">Slovakia</option>
                                            <option value="si">Slovenia</option>
                                            
                                            <option
                                                value="sb">Solomon Islands</option>
                                            <option value="so">Somalia</option>
                                            <option
                                                value="za">South Africa</option>
                                            <option value="gs">South Georgia and the South Sandwich
                                            Islands</option>
                                            <option value="kr">South Korea</option>
                                            <option
                                                value="es">Spain</option>
                                            
                                            <option value="pi">Spratly Islands</option>
                                            <option
                                                value="lk">Sri Lanka</option>
                                            <option value="sd">Sudan</option>
                                            <option
                                                value="sr">Suriname</option>
                                            <option value="sj">Svalbard and Jan Mayen Islands</option>
                                            <option value="sz">Swaziland</option>
                                            
                                            <option
                                                value="se">Sweden</option>
                                            <option value="ch">Switzerland</option>
                                            <option
                                                value="sy">Syria</option>
                                            <option value="tw">Taiwan</option>
                                            <option
                                                value="tj">Tajikistan</option>
                                            <option value="tz">Tanzania</option>
                                            
                                            <option
                                                value="th">Thailand</option>
                                            <option value="tg">Togo</option>
                                            <option
                                                value="tk">Tokelau</option>
                                            <option value="to">Tonga</option>
                                            <option
                                                value="tt">Trinidad and Tobago</option>
                                            <option value="tn">Tunisia</option>
                                            
                                            <option value="tr">Turkey</option>
                                            <option value="tm">Turkmenistan</option>
                                            <option value="tc">Turks and Caicos Islands</option>
                                            <option
                                                value="tv">Tuvalu</option>
                                            <option value="ug">Uganda</option>
                                            <option
                                                value="ua">Ukraine</option>
                                            
                                            <option value="ae">United Arab Emirates</option>
                                            <option value="uk">United Kingdom</option>
                                            <option value="xd">United Nations Neutral Zone</option>
                                            <option value="us">United States</option>
                                            <option
                                                value="um">United States Minor Outlying Islands</option>
                                            <option
                                                value="uy">Uruguay</option>
                                            
                                            <option value="vi">US Virgin Islands</option>
                                            <option
                                                value="uz">Uzbekistan</option>
                                            <option value="vu">Vanuatu</option>
                                            <option
                                                value="va">Vatican City</option>
                                            <option value="ve">Venezuela</option>
                                            <option
                                                value="vn">Vietnam</option>
                                            
                                            <option value="wf">Wallis and Futuna Islands</option>
                                            <option value="eh">Western Sahara</option>
                                            <option value="ye">Yemen</option>
                                            <option value="zm">Zambia</option>
                                            <option value="zw">Zimbabwe</option>

                                        </select></td>
                                    </tr>
                                    <tr> 
                                   
                                    <tr> 
                                        <td><b>Address:</b></td>
                                        
                                        <td><textarea name="add" cols = 30 rows = 3></textarea></td>
                                    </tr>
                                    <tr> 
                                        <td><b>Zip Code:</b></td>
                                        <td><input name="zip" type="text" size="6" maxlength="6"> 
                                        </td>
                                    </tr>
                                    
                                    
                                    <tr> 
                                        <td><b>Contact No.</b></td>
                                        
                                      <td>                
                                                                               
                                            Isd/Std code 
                                            <input name="std" type="text" size="7" maxlength="7">
                                                <br>
                                            phone no. 
                                        <input name="cntno" type="text" size="10" maxlength="10"></td>
                                    </tr>
                                    <tr> 
                                    
                                    
                                    
                                        <td><b>Mobile No.:</b></td>
                                        <td>                                           
                                              <input name="mob" type="text" size="10" maxlength="10"> 
                                        </td>
                                    </tr>
                                    
                                    <tr> 
                                        <td height="28"><b>Login Id:</b></td>
                                        
                                        <td><input type="text" name="login"></td>
                                    </tr>
                                    <tr> 
                                        <td><b>Password:</b></td>
                                        <td><input type="password" name="pass"></td>
                                    </tr>
                                    <tr> 
                                        <td><b>Confirm password:</b></td>
                                        <td><input type="password" name="cpass"></td>
                                        
                                    </tr>
                                    <tr> 
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr> 
                                        <td colspan="2"><div align="center">
                                                <input type="submit" name="Submit" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="Reset" name="Reset" value="Reset">
                                            </div>
                                            
                                        <div align="center"> </div></td>
                                    </tr>
                                </table>
<map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
    </map>

                            
            </form>
        </body>
        
    
</html>






























