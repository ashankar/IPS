<%@ page errorPage="errorqms.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html charset=iso-8859-1" />
        <title>:: IGNOU Prashnottari Sewa::</title>
        <script type = "text/javascript">
        function validateFormOnSubmit(IndexForm33) {
        var reason = "";
        reason+=validatename(IndexForm33.name);
        reason+=validateEmail(IndexForm33.email_id);
        reason+=validateE_No(IndexForm33.e_no);
        reason+=valDrop(IndexForm33.Program);
        reason+=valDrop(IndexForm33.region);
        reason+=validatesubject(IndexForm33.subject);
        reason+=validatesubject(IndexForm33.query);

        if (reason != "") {
        alert("Some fields need correction:\n" + reason);
        return false;
        }
        return true;
    }

    function validatename(fld)
    {
        var error = "";
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
        error = "Please Enter the Name.\n";
        fld.style.background = '#F5D0A9';
        }

       else if ((fld.value.length < 3) || (fld.value.length > 25)) {
       error = "The Name is in the wrong length.\n";
       fld.style.background = '#F5D0A9';

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
        var strPass = fld.value;
        var strLength = strPass.length;

        for(var i=0;i<strLength;i++)
         { 
        if(isNaN(parseInt(fld.value.charAt(i))))
        {           
        error = "The "+fld.name+" code contains illegal characters.\n";
        fld.style.background = '#F5D0A9';
         }            
       }
        if (fld.value == "" )
        {
        error = "Please Enter the value in the Feild Enrolnment Number.\n";
        fld.style.background = '#F5D0A9';
        }
        else if ((fld.value.length < 9)||(fld.value.length > 9)) {
        error = "Please Enter the correct Enrolnment number.\n";
        fld.style.background = '#F5D0A9';
        } 
        else if (illegalChars.test(fld.value)) {
        error = "The Feild Enrolnment Number contains illegal characters.\n";
        fld.style.background = '#F5D0A9'; 
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

    function valDrop(fld) {

        var error = "";
        if (fld.value == ""){
        fld.style.background = '#F5D0A9';
        error="Please Select the concerned field "+" "+fld.name+".\n";
        }
        else
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
        <form name="IndexForm33" action="User_Query" onSubmit = "return validateFormOnSubmit(this)" method = "post" enctype="multipart/form-data" >
        <center>
        <table width="800" align="center" bgcolor="#F7EFE7">
        <tr><td width = "115" align = "center">
        <table width = "800" align = "center">
        <tr><td width="115"><img src="Images/head.gif" width="800" height="150"></td>
        </tr><tr>
        <td><img src="Images/links.gif" width="500" height="27" border="0" align="right" usemap="#Map2"></td></tr>
        </table>
        </td>
        </tr>
        <tr>
        <td height="5" colspan="3" bgcolor="#000000" align = "center"></td></tr>
        </table>
        <table align = "center" bgcolor="#F7EFE7" width = "800">
        <tr><td align = "center" width = "800" bgcolor="#F7EFE7">
        <table align = center width = "650"><tr><td align = "center">
        <font size="2" face="Verdana, Arial, Helvetica, sans-serif" align = "justify">
        <b><u>IGNOU Prashnottari Sewa(IPS)</u></b></font> </td></tr> 
        <tr><td align = "center"><b>Please fill the fields below.</b>(Fields with <strong><font color="#FF0033">*</font></strong> are mandatory)
        </td></tr><tr><td></td></tr>
        </table>
        <table align = "center" width = "800" bgcolor="#F7EFE7"><tr><td>
        <table align = "center" width = "600" bgcolor="#F7EFE7">
        <tr><td align="left"><strong><font color="#FF0033">*</font>Name</strong></td>
        <td align = "center">:</td>
        <td align="left"><input name="name" type="text" id="name" tabindex="1"></td>
        </tr><tr><td align="left"><strong><font color="#FF0033">*</font>E-mail</strong></td>
        <td align = "center">&nbsp;</td>
        <td align="left"><input name="email_id" type="text" tabindex="2" /></td>
        </tr><tr>
        <td align="left"><strong><font color="#FF0033">*</font>Enrolment No.</strong></td>
        <td align = "center">:</td>
        <td align="left"><input name="e_no" type="text" tabindex="3" /></td>
        </tr><tr>
        <td align="left"><strong><font color="#FF0033">*</font>Program</strong></td>
        <td align = "center">:</td><td align="left"><select name="Program">
        <option value="" selected="selected">---Select Program---</option>
                                   <option value="ADTS">ADTS</option>
                                   <option value="ASSO">ASSO</option>
                                   <option value="BCA">BCA</option>
                                   <option value="BDP">BDP</option>
                                   <option value="BED">BED</option>
                                   <option value="BHM">BHM</option>
                                   <option value="BLS">BLS</option>
                                   <option value="BSCN">BSCN</option>
                                   <option value="BSW">BSW</option>
                                   <option value="BTCM">BTCM</option>
                                   <option value="BTME">BTME</option>
                                   <option value="BTS">BTS</option>
                                   <option value="BTWRE">BTWRE</option>
                                   <option value="CAFE">CAFE</option>
                                   <option value="CCDP">CCDP</option>
                                   <option value="CCP">CCP</option>
                                   <option value="CDM">CDM</option>
                                   <option value="CEMBA">CEMBA</option>
                                   <option value="CEMPA">CEMPA</option>
                                   <option value="CES">CES</option>
                                   <option value="CETE">CETE</option>
                                   <option value="CFN">CFN</option>
                                   <option value="CHET">CHET</option>
                                   <option value="CHR">CHR</option>
                                   <option value="CIC">CIC</option>
                                   <option value="CIG">CIG</option>
                                   <option value="CLD">CLD</option>
                                   <option value="CNCC">CNCC</option>
                                   <option value="CNOC">CNOC</option>
                                   <option value="CPE">CPE</option>
                                   <option value="CPFM">CPFM</option>
                                   <option value="CPLT">CPLT</option>
                                   <option value="CRD">CRD</option>
                                   <option value="CSLF">CSLF</option>
                                   <option value="CSUC">CSUC</option>
                                   <option value="CSUS">CSUS</option>
                                   <option value="CTE">CTE</option>
                                   <option value="CTPM">CTPM</option>
                                   <option value="CTS">CTS</option>
                                   <option value="CWDL">CWDL</option>
                                   <option value="CWDM">CWDM</option>
                                   <option value="CWED">CWED</option>
                                   <option value="CYP">CYP</option>
                                   <option value="DAFE">DAFE</option>
                                   <option value="DCE">DCE</option>
                                   <option value="DCH">DCH</option>
                                   <option value="DCLE">DCLE</option>
                                   <option value="DCO">DCO</option>
                                   <option value="DCYP">DCYP</option>
                                   <option value="DDT">DDT</option>
                                   <option value="DECE">DECE</option>
                                   <option value="DEME">DEME</option>
                                   <option value="DHHM">DHHM</option>
                                   <option value="DNA">DNA</option>
                                   <option value="DNHE">DNHE</option>
                                   <option value="DPE">DPE</option>
                                   <option value="DTS">DTS</option>
                                   <option value="DVAPFV">DVAPFV</option>
                                   <option value="MADE">MADE</option>
                                   <option value="MAH">MAH</option>
                                   <option value="MARD">MARD</option>
                                   <option value="MCA">MCA</option>
                                   <option value="MCOM">MCOM</option>
                                   <option value="MEC">MEC</option>
                                   <option value="MEG">MEG</option>
                                   <option value="MHA">MHA</option>
                                   <option value="MHD">MHD</option>
                                   <option value="MLS">MLS</option>
                                   <option value="MP">MP</option>
                                   <option value="MPA">MPA</option>
                                   <option value="MPB">MPB</option>
                                   <option value="MPS">MPS</option>
                                   <option value="MSCDFSM">MSCDFSM</option>
                                   <option value="MSO">MSO</option>
                                   <option value="MTM">MTM</option>
                                   <option value="PGCCP">PGCCP</option>
                                   <option value="PGCMRR">PGCMRR</option>
                                   <option value="PGCPDT">PGCPDT</option>
                                   <option value="PGCRS">PGCRS</option>
                                   <option value="PGCRW">PGCRW</option>
                                   <option value="PGCTW">PGCTW</option>
                                   <option value="PGDAPP">PGDAPP</option>
                                   <option value="PGDDE">PGDDE</option>
                                   <option value="PGDDM">PGDDM</option>
                                   <option value="PGDESD">PGDESD</option>
                                   <option value="PGDGM">PGDGM</option>
                                   <option value="PGDHE">PGDHE</option>
                                   <option value="PGDIBO">PGDIBO</option>
                                   <option value="PGDIPR">PGDIPR</option>
                                   <option value="PGDLAN">PGDLAN</option>
                                   <option value="PGDMCH">PGDMCH</option>
                                   <option value="PGDRD">PGDRD</option>
                                   <option value="PGDRP">PGDRP</option>
                                   <option value="PGDT">PGDT</option>
                                   <option value="PGJMC">PGJMC</option>
                                   <option value="SAVINI">SAVINI</option>
                        </select></td></tr>
                        <tr><td align="left"><strong><font color="#FF0033">*</font>Partner Institutions</strong></td>
                        <td align="center">:</td>
                        <td align="left"><select name="region" tabindex="3">
                                            <option selected="selected">---Select---</option>
                                            <option value="5102">ABU DHABI</option>
                                            <option value="5502">DUBAI-5502</option>
                                            <option value="5503">DUBAI-5503</option>
                                            <option value="5505">RAS_AL_KHAIMAH</option>
                                            <option value="5402">QATAR</option>
                                            <option value="5704">KUWAIT</option>
                                            <option value="5905">SULTANATE OF OMAN</option>
                                            <option value="6001">BAHRAIN</option>
                                           <option value="6101">SAUDI ARABIA-6101</option>
                                           <option value="6102">SAUDI ARABIA-6002</option>
                                           <option value="6103">SAUDI ARABIA-6003</option>
                                           <option value="6105">SAUDI ARABIA-6105</option>
                                           <option value="7202">MAURITIUS-7202</option>
                                           <option value="7203">MAURITIUS-7203</option>
                                           <option value="8105">ETHIOPIA</option>
                                           <option value="9401">KENYA</option>
                                           <option value="9301">SINGAPORE</option>
                                           <option value="9602">NEPAL-9602</option>
                                           <option value="9603">NEPAL-9603</option>
                                           <option value="9604">NEPAL-9604</option>
                                           <option value="9702">SRI LANKA</option>
                                           <option value="9202">KYRGYZSTAN-9202</option>
                                           <option value="9203">KYRGYZSTAN-9203</option>
                                           <option value="9710">AFGHANISTAN</option>
                                           <option value="9305">FIJI</option>
                                           <option value="9801">BAGLADESH</option>
                                           <option value="9802">MONOGLIYA</option>
                                           <option value="8101">ETHIOPIA</option>
                                           <option value="8102">GHANA(w)</option>
                                           <option value="8103">GHANA(c)</option>
                                           <option value="8403">GAMBIA</option>
                                           <option value="8402">SIERRA LEONE</option>
                                           <option value="8201">MADAGASCAR</option>
                                           <option value="8202">LIBERIA</option>
                                           <option value="9001A">MALAWI</option>
                                           <option value="8602">SWAZILAND</option>
                                           <option value="8901">JAMAICA</option>
                                           <option value="7102">SEYCHELLES</option>
                                           <option value="8801">SAMOA</option>
                                           <option value="8703">NAMIBIA</option>
                                           <option value="8501">LESOTHO</option>
                                           <option value="9001B">MALAWI</option>
                                           <option value="8601">SWAZILAND</option>
                                           <option value="9501">NIGERIA-9501</option>
                                           <option value="9502">NIGERIA-9502</option>
                                           <option value="9503">NIGERIA-9503</option>
                                           <option value="8106">ETHIOPIA-8106</OPTION>
                                           <option value="8107">ETHOPIA-8107</option>
                                           <option value="8505">BOTSWANA</option>
                                           <option value="8506">ZAMBIA</option>
                                           <option value="8501B">LESOTHO</option>
                                           <option value="9001C">MALAWI</option>
                                           </select></td></tr>
                             <tr>
                             <td align="left"><strong><font color="#FF0033">*</font>Subject of your query</strong></td>
                             <td align = "center">:</td>
                             <td align="left"><input name="subject" type="text" id="subject" tabindex="4">                                    </td>
                             </tr>
                             <tr>
                             <td align="left"><strong><font color="#FF0033">*</font>Query Concerned To<br>
                             (Departments/Divisions/Schools)</strong></td>
                             <td align = "center">:</td>
                             <td align="left"><select name="department" tabindex="5">
                             <option value="ID">International Division</option>
                             </select></td></tr>
                             <tr><td align="left"><strong><font color="#FF0033">*</font>Query</strong></td>
                             <td align = "center">:</td>
                             <td align="left"><textarea name="query" cols="50" rows="6" tabindex="6"></textarea>                                    </td>
                             </tr><tr>
                             <td align = "left"><strong>Attachment<font color="#CC0000">**</font></strong></td>
                             <td align = "center">&nbsp;</td>
                             <td align="left"><label>
                             <input type="file" name="file" /></label></td>
                             </tr><tr>
                             <td align = "left">&nbsp;</td>
                             <td align = "center">&nbsp;</td>
                             <td align="left">&nbsp;</td></tr>
                             <tr><td colspan="3" align = "left"><font color="#CC0000">**</font><font size="1" face="Verdana">You  can attach any type of pdf,doc,ppt,txt,mp3,gif,jpg or mpg file for proper assumption. Please  note that the size of the attachment should not exceed 5 MB</font></td>
                             </tr><tr><td align="left">&nbsp;</td>
                             <td align = "center">&nbsp;</td>
                             <td align="left"><input type="submit" name="submit" tabindex="7" value="Post">
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <input type="reset" name="Reset"  tabindex="8"></td>
                             </tr></table>
                             </table>
                             <table height = "2" width = "800">
                             <tr>
                             <td bgcolor="#330000" height = "2"><div align="center"><font color="#FFFFFF" size="1"><strong>IGNOU
                             Edugrid &copy; All rights reserved 2009,ACIIL</strong></font> </div></td>
                             </tr>
                             </table></center>
            <map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="index.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
           </map>
           </form>
           </body>
      </html>

