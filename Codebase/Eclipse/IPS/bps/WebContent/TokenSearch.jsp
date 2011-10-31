<%@ page import ="java.sql.*" %>
<%@ page errorPage="errorqms.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <SCRIPT LANGUAGE = "JAVASCRIPT">
    function Validation1()
    {
        var user1 = document.form1.T_No1.value ;
        var error = "";
        var stripped = user1.replace(/[\(\)\.\-\ ]/g, '');   
        var illegalChars = /\W/; // allow letters, numbers, and underscores
        var strPass = user1;
        var strLength = strPass.length;
      
        if(user1=="")
        {           
            alert("Please enter the Token Number");
            return false;
        }
       
               return true;
     } 
     function Validation2()
      {       var user2 = document.form1.T_No2.value ;       
          var error = "";
         var strPass = user2;
        var strLength = strPass.length;
      for(var i=0;i<strLength;i++)
      {    if(!isNaN(parseInt(user2.charAt(i)))){
           
     alert("Tne name contains illegal Characters,Please enter your name.\n");
      
      return false;
        }   
      } 
   
        if(user2=="")
        {           
            alert("Please enter the your Name");
            return false;
        }
        
               return true;
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
                 
     function Validation4()
       {
      var User4 = document.NewQueryForm.Query_Reply.value ;
      
                           
      if(User4=="")
        {           
            alert("Query Reply field is mandatory");
            return false;
         }
                      
       return true;
      } 

     </SCRIPT>  
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>::IGNOU-Query Management System::</title>

<style type="text/css">
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 13px;
}
</style></head>

<body>
    <form name="form1" action="TokenSearch" method="post">
<center>
<table width="800" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#F7EFE7">
   <tr>
    <td>
        <table width="425" cellpadding="0" cellspacing="0">
          <tr>
             <td width="115"><img src="Images/head.gif" width="800" height="150" /></td>
          </tr>
          <tr>
          <td><img src="Images/links.gif" width="500" height="27" border="0" align="right" usemap="#Map2" /></td>
          </tr>
        </table>
    </td>
  </tr>
    <tr>
        <td height="5" bgcolor="#000000"></td>
    </tr>
    <tr>
         <td>
            <table width="800" border="0" align = "center">
             <tr>
              <td><h3 align = "center">View Answered Queries</h3></td>      
             </tr>
           </table>
         </td>
     </tr>
<tr>
  <td height="21">&nbsp;</td>
</tr>
<tr>
    <td height="192"><table align="center">
      <tr>
        <td align = "center" bordercolor="#330000" bgcolor="#74101A" width="526" ><b> <font size="2" face="Verdana, Arial, Helvetica, sans-serif" color = "white">Search your Answer by Token Number</font> </td>
      </tr>
    </table>
      <table width="529"  bordercolor="#330000" height="127" align="center">
        <tr>
          <td height="114" valign="middle" align="center" class="table_with_border"><table width="515" border="0" align = "center">
              <tr>
                <td width="86" height="2"><div align="right"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="1">Token ID</font></b></font></div></td>
                <td align="center" valign="middle" colspan="2" height="2">
                    <input type="text" name="T_No1" size="20"/>
                    <input type="hidden" name="flag" value="0" />
                    <input type="submit" name="Button1" value="Submit Token" onclick = "return Validation1();" />
                </td>
              </tr>
              <tr>
                <td width="86" height="2">&nbsp;</td>
                <td align="center" valign="middle" width="362" height="2"><div align="right"></div>
                    <div align="left"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#FF0000">*</font><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Please
                      enter your Token Number( the number given
                      to you at the time of posting the question)
                      to get your answer</font></div></td>
                <td align="center" valign="middle" width="73" height="2">&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <table align="center">
        <tr>
          <td align = "center"  bordercolor="#330000" bgcolor="#74101A" width="526" ><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color = "white">Search
              Answered Queries by Sender's Name</font></b></td>
        </tr>
      </table>
      <table width="529"  bordercolor="#330000" height="127" align="center">
        <tr>
          <td height="114" valign="middle" align="center" class="table_with_border"><table width="515" border="0" align = "center">
              <tr>
                <td width="86" height="2"><div align="right"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="1">Query Sender Name</font></b></font></div></td>
                <td align="center" valign="middle" colspan="2" height="2">
                    <input type="text" name="T_No2" size="20"/>
                    <input type="hidden" name="flag2" value="0" />
                    <input type="submit" name="Button2" value="Submit Name" onclick = "return Validation2();" />
                   
                </td>
              </tr>
              <tr>
                <td width="86" height="2">&nbsp;</td>
                <td align="center" valign="middle" width="362" height="2"><div align="right"></div>
                    <div align="left"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#FF0000">*</font><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Please
                      enter your Name( the name you specified at the time of posting the query )
                      to get your answer</font></div></td>
                <td align="center" valign="middle" width="73" height="2">&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <table width="628" border="0" align="center">
        <tr>
          <td>
                <%
            String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "",s6 ="",s7="";
            int flag=1;
            int flag1=1;

            ResultSet rs2 = (ResultSet)session.getAttribute("rs");
            ResultSet rs3 = (ResultSet)session.getAttribute("rs1");
         
            
            String Token = (String)session.getAttribute("Token");
            String Name = (String)session.getAttribute("Name");
            String abc=(String)session.getAttribute("abc");
            String tokennew=(String)session.getAttribute("tokennew");
                       
            if (rs2 != null) {
             flag=0;  
                while (rs2.next()) {
                    if(Token.equalsIgnoreCase(rs2.getString(1))|| Name.equalsIgnoreCase(rs2.getString(2)))
                       {
                        flag=1;
                    s1 = rs2.getString(1);
                    s2 = rs2.getString(2);
                    s3 = rs2.getString(3);
                    s4 = rs2.getString(4);
                    s5 = rs2.getString(5);
                    s6 = rs2.getString(6);
              
                    %>
                     <table border = 1 width = 530 align="center">
      <tr><td align="left"><b>Token No</b> </td><td align="left"><%= s1%></td></tr>
      <tr><td align="left"><b>Senders Name</b> </td><td align="left"><%= s2%></td></tr>
<tr><td align="left"><b>Query</b> </td><td align="left"><%= s3 %></td></tr>



<%if(s4==null){%>
  <p align="center"> <font color="red"><b><%="your Query has been forwarded to expert please wait for the response..."%></b></font></p>
 <%}
else{
    %>
<tr><td align="left"><b>Query Answer</b></td><td align="left"> <%= s4 %>
  
 <% }%>
  
  </td></tr>

    <%if(s5==null)
    {
    }
    else{
    %>
 <tr><td align="left" width = "25%"><b>Query Replied Date</b></td><td align="left"><%= s5%></td></tr>
  
 <% }%>
  
 <%if(s6==null)
    {
    }
    else{
    %>
 <tr><td align="left"><b>Replied By</b></td><td align="left"><%= s6%></td></tr>
  
 <% }%>
 <%
 
  %>              
   </table><br>
<%


        }
          
                     
        }
     } if(abc=="new")
                {
       %>
               <p align="center"><b>Token Number:-<%=tokennew%></b></p>
               <p align="center"> <font color="red"><b><%="Please wait Query under processing..."%></b></font></p>
        <%
       }
    else if(flag==0)
       
    {%>
                    <p align="center"> <font color="red"><b><%="Query not Found.."%></b></font></p>
        <%
   }
   
    
       
            %>          
                                       
</td>
        </tr>
      </table>
      <P align="justify">&nbsp;</P>
      <p align="justify" class="style1">&nbsp;</p></td>
  </tr>

<tr>
<td height="19" bgcolor="#330000"><div align="center"><font color="white" size="2"><strong>IGNOU
              Education Grid &copy; All rights reserved, ACIIL </strong>
              </font></div></td>
</tr>
</table>
</center>
</form>
<map name="Map" id="Map">
  <area shape="rect" coords="273,2,367,24" href="http://www.ignou.ac.in" target="_blank" />
  <area shape="rect" coords="182,2,243,25" href="index.html" />
</map>

<map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="index.jsp" />
<area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
<area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
</map></body>
</html>

