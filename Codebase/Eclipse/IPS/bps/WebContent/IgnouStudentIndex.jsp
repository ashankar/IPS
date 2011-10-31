<%@ page import="java.sql.Connection,
   javax.sql.DataSource,
   javax.naming.Context,
  javax.naming.InitialContext,
  java.sql.Statement,
  java.sql.ResultSet,
  java.sql.SQLException"%>
<%@ page errorPage = "errorqms.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html charset=iso-8859-1" />
        <title>:: IGNOU Prashnottari Sewa::</title>
        <script type="text/javascript">

        function validateFormOnSubmit(IndexForm)
      {
        var reason = "";
        reason+=validatename(IndexForm.name);
        reason+= validateE_No(IndexForm.e_no);
        reason+= validateEmail(IndexForm.email_id);
        reason+=valDrop(IndexForm.Program);
        reason+=valDrop(IndexForm.region);
        reason+= validateNumeric(IndexForm.studycenter);
        reason+= validatesubject(IndexForm.subject);
        reason+= valDrop(IndexForm.department);
        reason+=validatesubject(IndexForm.query);

        if (reason != "") {
            alert("Some fields need correction:\n" + reason);
            return false; }
        return true;
      }

    function validatename(fld)
    {
        var error = "";
        var illegalChars = /\W/; // allow letters, numbers, and underscores
        var re=/^[A-z]+$/;
        var result =true;
        var strLength = fld.value.length;
        var iChars = "*|,\":<>[]{}`\';()@&$#%";
        var string = fld.value.length;
       
        for(var i=0;i<strLength;i++)
        {  
        if(!isNaN(parseInt(fld.value.charAt(i))))
            {   
        error = "Please Enter character only in name feild.\n";
        fld.style.background = '#F5D0A9';
            }
        }

        if (fld.value == "" )
        {   error = "Please Enter the name .\n";
        fld.style.background = '#F5D0A9';
        }

        else if ((fld.value.length < 3) || (fld.value.length > 25))
         {  error = "The Name is in the wrong length.\n";
        fld.style.background = '#F5D0A9';
         }
        else 
         {  
        fld.style.background = 'White';
         }
        return error;
    }

    function validateE_No(fld)
    {
        var error = "";
        var stripped = fld.value.replace(/[\(\)\.\-\ ]/g, '');
        var illegalChars = /\W/;
        var strLength = fld.value.length;
        for(var i=0;i<strLength;i++)
          { 
        if(isNaN(parseInt(fld.value.charAt(i))))
            {           
        error = "The "+fld.name+" code contains illegal characters.\n";
        fld.style.background = '#F5D0A9';
            }            
          }
        if (fld.value == "") {
        error = "Please Enter in Feild Enrolnment Number.\n";
        fld.style.background = '#F5D0A9';
           }
        else if (illegalChars.test(fld.value)) {            
        error = "The Feild Enrolnment Number contains illegal characters.\n";
        fld.style.background = '#F5D0A9'; 
        }
        else if ((fld.value.length < 9)||(fld.value.length > 9)) {
        error = "Please enter the correct Enrolnment number.\n";
        fld.style.background = '#F5D0A9';
        } 
        else
         {
        fld.style.background = 'White';
         }
        return error;
     }

     function validateEmail(fld) 
      {
        var error="";
        var tfld = trim(fld.value);
        var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/ ;
        var illegalChars= /[\(\)\<\>\,\;\:\\\"\[\]]/ ;

        if (fld.value == "") {
        fld.style.background = '#F5D0A9';
        error = "Please Enter the value in the Feild Email ID.\n";
        } else if (!emailFilter.test(tfld)) {
        fld.style.background = '#F5D0A9';
        error = "Please Enter a valid Email Address.\n";
        } else if (fld.value.match(illegalChars)) {
        fld.style.background = '#F5D0A9';
        error = "The Email Address contains illegal characters.\n";
        } else {
        fld.style.background = 'White';
        }
        return error;
      }

     function valDrop(fld) 
      {
        var error = "";
        if (fld.value == ""){
        fld.style.background = '#F5D0A9';
        error="Please select a concerned field "+" "+fld.name+".\n";
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
         { 
       if(isNaN(parseInt(fld.value.charAt(i))))
        {       
       error = "The "+fld.name+" code contains illegal characters123213213.\n";
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

     </script>
     </head>
            <body onload= "window.status = 'Welcome to IGNOU Prashnottari Sewa';">
            <form name="IndexForm" action="User_Query" onSubmit="return validateFormOnSubmit(this)" method = "post" enctype="multipart/form-data" >
             <center>

              <% String Dept = request.getParameter("Dept");  
                 String Subject = request.getParameter("Subject");
                  %>

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
                           </td>
                        </tr>
                      <tr>
                        <td height="5" colspan="3" bgcolor="#000000" align = "center"></td>
                     </tr>
                  </table>

                 <table align = "center" bgcolor="#F7EFE7" width = "800">
                   <tr>
                     <td align = "center" width = "800" bgcolor="#F7EFE7">
                      <table align = center width = "700"><tr><td align = "center">
                          <font size="2" face="Verdana, Arial, Helvetica, sans-serif" align = "justify">
                            <b><u>IGNOU Prashnottari Sewa(IPS)</u></b></font> </td></tr>
                             <tr><td align = "center"><b>Please fill the fields below.</b>(Fields with <strong><font color="#FF0033">*</font></strong> are
                            mandatory)
                          </td></tr><tr><td></td></tr>
                        </table>
                         <table align = "center" width = "800" bgcolor="#F7EFE7"><tr><td>
                          <table align = "center" width = "600" bgcolor="#F7EFE7">
                            <tr>
                              <td align="left"><strong><font color="#FF0033">*</font>Name</strong></td>
                              <td align = "center">:</td>
                              <td align="left"><input name="name" type="text" id="name" title="Enter your name here" tabindex="1"></td>
                            </tr>
                             <tr>
                                <td align="left"><strong><font color="#FF0033">*</font>E-mail</strong></td>
                                <td align = "center">:</td>
                                <td align="left"><input name="email_id" type="text" title="Enter your email address here" tabindex="2"></td>
                               </tr>
                                 <tr>
                                   <td align="left"><strong><font color="#FF0033">*</font>Enrolment No.</strong></td>
                                   <td align = "center">:</td>
                                   <td align="left"><input name="e_no" type="text" title="Enter your enrollment no. here" tabindex="3" /></td>
                                 </tr>
                                 <tr>
                                <td align="left"><strong><font color="#FF0033">*</font>Program</strong></td>
                                <td align = "center">:</td>
                                <td align="left"><select name="Program" title="Select your program here" tabindex = "4">
                                  <option value="" selected="selected">---Select Program---</option>
                                  <option
  value="ADTS">ADTS</option>
                                  <option value="ASSO">ASSO</option>
                                  <option
  value="BCA">BCA</option>
                                  <option value="BDP">BDP</option>
                                  <option
  value="BED">BED</option>
                                  <option value="BHM">BHM</option>
                                  <option
  value="BLS">BLS</option>
                                  <option value="BSCN">BSCN</option>
                                  <option
  value="BSW">BSW</option>
                                  <option value="BTCM">BTCM</option>
                                  <option
  value="BTME">BTME</option>
                                  <option value="BTS">BTS</option>
                                  <option
  value="BTWRE">BTWRE</option>
                                  <option value="CAFE">CAFE</option>
                                  <option
  value="CCDP">CCDP</option>
                                  <option value="CCP">CCP</option>
                                  <option
  value="CDM">CDM</option>
                                  <option value="CEMBA">CEMBA</option>
                                  <option
  value="CEMPA">CEMPA</option>
                                  <option value="CES">CES</option>
                                  <option
  value="CETE">CETE</option>
                                  <option value="CFN">CFN</option>
                                  <option
  value="CHET">CHET</option>
                                  <option value="CHR">CHR</option>
                                  <option
  value="CIC">CIC</option>
                                  <option value="CIG">CIG</option>
                                  <option
  value="CLD">CLD</option>
                                  <option value="CNCC">CNCC</option>
                                  <option
  value="CNOC">CNOC</option>
                                  <option value="CPE">CPE</option>
                                  <option
  value="CPFM">CPFM</option>
                                  <option value="CPLT">CPLT</option>
                                  <option
  value="CRD">CRD</option>
                                  <option value="CSLF">CSLF</option>
                                  <option
  value="CSUC">CSUC</option>
                                  <option value="CSUS">CSUS</option>
                                  <option
  value="CTE">CTE</option>
                                  <option value="CTPM">CTPM</option>
                                  <option
  value="CTS">CTS</option>
                                  <option value="CWDL">CWDL</option>
                                  <option
  value="CWDM">CWDM</option>
                                  <option value="CWED">CWED</option>
                                  <option
  value="CYP">CYP</option>
                                  <option value="DAFE">DAFE</option>
                                  <option
  value="DCE">DCE</option>
                                  <option value="DCH">DCH</option>
                                  <option
  value="DCLE">DCLE</option>
                                  <option value="DCO">DCO</option>
                                  <option
  value="DCYP">DCYP</option>
                                  <option value="DDT">DDT</option>
                                  <option
  value="DECE">DECE</option>
                                  <option value="DEME">DEME</option>
                                  <option
  value="DHHM">DHHM</option>
                                  <option value="DNA">DNA</option>
                                  <option
  value="DNHE">DNHE</option>
                                  <option value="DPE">DPE</option>
                                  <option
  value="DTS">DTS</option>
                                  <option value="DVAPFV">DVAPFV</option>
                                  <option
  value="MADE">MADE</option>
                                  <option value="MAH">MAH</option>
                                  <option
  value="MARD">MARD</option>
                                  <option value="MCA">MCA</option>
                                  <option
  value="MCOM">MCOM</option>
                                  <option value="MEC">MEC</option>
                                  <option
  value="MEG">MEG</option>
                                  <option value="MHA">MHA</option>
                                  <option
  value="MHD">MHD</option>
                                  <option value="MLS">MLS</option>
                                  <option
  value="MP">MP</option>
                                  <option value="MPA">MPA</option>
                                  <option
  value="MPB">MPB</option>
                                  <option value="MPS">MPS</option>
                                  <option
  value="MSCDFSM">MSCDFSM</option>
                                  <option value="MSO">MSO</option>
                                  <option
  value="MTM">MTM</option>
                                  <option value="PGCCP">PGCCP</option>
                                  <option
  value="PGCMRR">PGCMRR</option>
                                  <option value="PGCPDT">PGCPDT</option>
                                  <option
  value="PGCRS">PGCRS</option>
                                  <option value="PGCRW">PGCRW</option>
                                  <option
  value="PGCTW">PGCTW</option>
                                  <option value="PGDAPP">PGDAPP</option>
                                  <option
  value="PGDDE">PGDDE</option>
                                  <option value="PGDDM">PGDDM</option>
                                  <option
  value="PGDESD">PGDESD</option>
                                  <option value="PGDGM">PGDGM</option>
                                  <option
  value="PGDHE">PGDHE</option>
                                  <option value="PGDIBO">PGDIBO</option>
                                  <option
  value="PGDIPR">PGDIPR</option>
                                  <option value="PGDLAN">PGDLAN</option>
                                  <option
  value="PGDMCH">PGDMCH</option>
                                  <option value="PGDRD">PGDRD</option>
                                  <option
  value="PGDRP">PGDRP</option>
                                  <option value="PGDT">PGDT</option>
                                  <option
  value="PGJMC">PGJMC</option>
                                  <option value="SAVINI">SAVINI</option>
                                </select></td>
                               </tr>
                                <tr>
                                 <td align="left"><strong><font color="#FF0033">*</font>Regional Centre</strong></td>
                                  <td align = "center">:</td>
                                     <td align="left"><select name="region" title="Select your regional centre here" tabindex="5">
                                            <option value = "">----- Select RC ------</option>
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
                                            </select></td>
                                </tr>
                                <tr>
                                 <td align="left"><strong><font color="#FF0033">*</font>Study Center Code</strong></td>
                                 <td align = "center">:</td>
                                 <td align="left"><input type = text name="studycenter" title="Enter your study centre here" tabindex="6">                                            </td>
                                       </tr>

                                 <tr>
                                    <td align="left"><strong><font color="#FF0033">*</font>Subject of your query</strong></td>
                                    <td align = "center">:</td>
                                    <td align="left"><input name="subject" type="text" tabindex="7">                                    </td>
                                   </tr>

                                <tr>
                                    <td align="left"><strong><font color="#FF0033">*</font>Query Concerned To<br>
                                       (Departments/Divisions/Schools)</strong></td>
                                    <td align = "center">:</td>
                                    <td align="left"><select name="department" tabindex="8" readonly>
                                     
                                            <%

                                               Statement stmt = null;
                                               ResultSet rs = null;
                                               Connection conn = null;

                                              try {
                                                    DataSource ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
                                                   conn = ds.getConnection();                                                  
                                                   stmt = conn.createStatement();
                                                   rs = stmt.executeQuery("select * from  dept_details");
                                                   while (rs.next()) {%>
                                                   <option value = "<%=rs.getString(2)%>"><%=rs.getString(3)%></option>
                                                   <% }
                                                  rs.close();
                                                  rs = null;
                                                  stmt.close();
                                                  stmt = null;
                                                  conn.close();
                                                  conn = null;
                                                  } 
                                                  catch (SQLException e) {
                                                  e.printStackTrace();
}  finally { try {  conn.close();  } catch (Exception e) {  }	}   %>

                                                </select>
                                      </td>
                                   </tr>

                                   <tr>
                                     <td align="left"><strong><font color="#FF0033">*</font>Query</strong></td>
                                    <td align = "center">:</td>
                                    <td align="left"><textarea name="query" cols="50" rows="8" title="Enter your query discription here" tabindex="9"></textarea>                                    </td>
                                   </tr>
                                    <tr>
                                      <td align = "left"><strong>Attachment<font color="#CC0000">**</font></strong></td>
                                      <td align = "center">&nbsp;</td>
                                      <td align="left"><label>
                                        <input type="file" name="file" />
                                      </label></td>
                                    </tr>
                                    <tr>
                                      <td align="left">&nbsp;</td>
                                      <td align = "center">&nbsp;</td>
                                      <td align="left">&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td colspan="3" align="left"><font color="#CC0000">**</font><font size="1" face="Verdana">You  can attach any type of pdf,doc,ppt,txt,mp3,gif,jpg or mpg file for proper assumption. Please  note that the size of the attachment should not exceed 5 MB</font></td>
                                    </tr>
                                   <tr>
                                    <td align="left">&nbsp;</td>
                                    <td align = "center">&nbsp;</td>
                                    <td align="left"><input type="submit" name="submit" tabindex="9" value="Post">
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      <input type="reset" name="Reset"  tabindex="10">                                     </td>
                                   </tr>
                               </table>
                           </table>
                          <table height = "5" width = "800">
                           <tr>
                            <td bgcolor="#330000" height = "5"><div align="center"><font color="#FFFFFF" size="1"><strong>IGNOU
                            Edugrid &copy; All rights reserved 2009,ACIIL</strong></font> </div></td>
                            </tr>
                           </table>
                     </center>
            <map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="index.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
           </map>
            </form>
        </body>
</html>
