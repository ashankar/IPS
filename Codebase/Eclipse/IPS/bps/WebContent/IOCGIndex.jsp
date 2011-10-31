<%@ page import = "java.sql.*" %>
<%@ page errorPage="errorqms.jsp" %>
<%@ page import = "javax.sql.*, javax.naming.*" %>


<%@ page import = "org.apache.turbine.util.BrowserDetector" %>
<%@ page language = "java" import = "java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="ddaccordion.js">
</script>


<link rel="stylesheet" type="text/css" href="anylinkmenu.css"/>
<script type="text/javascript" src="menucontents.js"></script>
<script type="text/javascript" src="anylinkmenu.js">
</script>
<script type="text/javascript">
//anylinkmenu.init("menu_anchors_class") //Pass in the CSS class of anchor links (that contain a sub menu)
anylinkmenu.init("menuanchorclass")
</script>


<script type="text/javascript">


ddaccordion.init({
	headerclass: "expandable", //Shared CSS class name of headers group that are expandable
	contentclass: "categoryitems", //Shared CSS class name of contents group
	revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
	mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
	collapseprev: true, //Collapse previous content (so only one open at any time)? true/false 
	defaultexpanded: [0], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
	onemustopen: false, //Specify whether at least one header should be open always (so never all headers closed)
	animatedefault: false, //Should contents open by default be animated into view?
	persiststate: true, //persist state of opened contents within browser session?
	toggleclass: ["", "openheader"], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
	togglehtml: ["prefix", "", ""], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
	animatespeed: "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
	oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
		//do nothing
	},
	onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
		//do nothing
	}
})


</script>

<style type="text/css">

.arrowlistmenu{
width: 180px; /*width of accordion menu*/
}

.arrowlistmenu .menuheader{ /*CSS class for menu headers in general (expanding or not!)*/
font: bold 14px Arial;
color: white;
background: black url(titlebar.png) repeat-x center left;
margin-bottom: 10px; /*bottom spacing between header and rest of content*/
text-transform: uppercase;
padding: 4px 0 4px 10px; /*header text is indented 10px*/
cursor: hand;
cursor: pointer;
}

.arrowlistmenu .openheader{ /*CSS class to apply to expandable header when it's expanded*/
background-image: url(titlebar-active.png);
}

.arrowlistmenu ul{ /*CSS for UL of each sub menu*/
list-style-type: none;
margin: 0;
padding: 0;
margin-bottom: 8px; /*bottom spacing between each UL and rest of content*/
}

.arrowlistmenu ul li{
padding-bottom: 2px; /*bottom spacing between menu items*/
}

.arrowlistmenu ul li a{
color: #A70303;
background: url(arrowbullet.png) no-repeat center left; /*custom bullet list image*/
display: block;
padding: 2px 0;
padding-left: 19px; /*link text is indented 19px*/
text-decoration: none;
font-weight: bold;
border-bottom: 1px solid #dadada;
font-size: 90%;
}

.arrowlistmenu ul li a:visited{
color: #A70303;
}

.arrowlistmenu ul li a:hover{ /*hover state CSS*/
color: #A70303;
background-color: #F3F3F3;
}

</style>





<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: IGNOU Prashnottari Sewa ::</title>
<style type="text/css">
<!--
body {
	background-color:;
}
.style13 {
	color: #990000;
	font-weight: lighter;
}
.style16 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style17 {font-size: 12px}
.style18 {
	font-size: 16px;
	font-weight: bold;
}
.style19 {font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif; }
-->
</style>

<script type="text/javascript">

    function validateFormOnSubmit(IndexForm) {
        var reason = "";
        reason+=validatename(IndexForm.name);
        reason+= validateEmail(IndexForm.email_id);
        reason+= validatesubject(IndexForm.subject);
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
        var stripped = fld.value.replace(/[\(\)\.\-\ ]/g, '');
        var illegalChars = /\W/;
        var strLength = fld.value.length;
         for(var i=0;i<strLength;i++)
      {  if(isNaN(parseInt(fld.value.charAt(i))))
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

    
    function validateNumeric(fld)
    {
        var error = "";
        var stripped = fld.value.replace(/[\(\)\.\-\ ]/g, '');
         var strPass = fld.value;
        var strLength = strPass.length;

      for(var i=0;i<strLength;i++)
      {  if(isNaN(parseInt(fld.value.charAt(i))))
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

<body>
<form name = "IndexForm" action ="User_Query" onSubmit="return validateFormOnSubmit(this)" method = "post" enctype="multipart/form-data">
<table width="820" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr>
    <td width="820"><table width="820" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="820" align="center" valign="middle"><div align="center"><img src="Images/head.gif" width="820" height="150" /></div></td>
      </tr>
      <tr>
          <td align="center" valign="middle" bgcolor="#F7EFE7"><div align="right"><img src="Images/links.gif" width="500" height="27" border="0" usemap="#Map2" /></div><font size="2px"> Version 1.1</font></td>
      </tr>
      
      
      <tr>
        <td height="385" align="center" valign="middle" bgcolor="#FFFFFF"><table width="815" height="379" border="0" cellpadding="1" cellspacing="1">
              <tr> 
                <td width="880" height="377" valign="top"><table width="400" height="375" border="0" align="left" cellpadding="1" cellspacing="1">
                    <tr> 
                      <td width="350" height="350" valign="top" bordercolor="#FFFFFF" bgcolor="#F7EFE7"><div align="center">
                        <table>
                            <tr>
                             <div class="arrowlistmenu" align="left">    

    
<h3 class="menuheader expandable" align="center">View Answer</h3>
    <ul class="categoryitems">
      <li><a href="TokenSearch.jsp">View Answer</a></li>
    <li><a href="FAQ.jsp">Frequently Asked Queries</a></li>
    
</ul>
    <h3 class="menuheader expandable" align="center">Staff Login</h3>
    <ul class="categoryitems">
    <li><a href="LoginPC.jsp">Login </a></li>
    
</ul>


                    
                        </tr>
                          </table>
                      </div></td>
                      <td width="662" valign="top" bordercolor="#FFFFFF" bgcolor="#F7EFE7"><div align="center" >
                      <table align = "center" bgcolor="#F7EFE7" border="0" width = "550">    
                           <tr><td align = "center">
                            
                          </td></tr>         
                                  <% 
                  String dept_des=null;
                  String dept_name=null;
   
                String id = request.getQueryString();
                String prg=request.getParameter("prg");
                String div =request.getParameter("div"); 
                String course =request.getParameter("course"); 
                 
                 %>  
                                         <%
                                          Connection conn = null;
                                                    Statement stmt = null;
                                                     ResultSet rs = null;

                                                try {
                                                   

                                                 DataSource ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
                                                 conn = ds.getConnection();
                                                  stmt = conn.createStatement();
                                                  rs = stmt.executeQuery("select * from  dept_details where dept_name='"+div+"'");
                                                  while (rs.next()) {
                                                  
                                                        dept_des=rs.getString(3);
                                                        dept_name=rs.getString(2);


                                                   }   %>
                            
                             <table><tr><td><p><strong><font color="black"><u>Send your query to <%=dept_des%>
                                 related to <%=prg%> programme</u></font></strong></p></td></tr></table>
                                <table width = "150" height = "200"  bgcolor="#F7EFE7" border="0">
                                <tr><td align = "center"></td></tr>
                                <tr>
                                
                           <tr>
                              <td align="left"><strong>&nbsp;&nbsp;Name<font color="#FF0033">*</font></strong></td>
                              <td align = "center"></td>
                              <td align="left"><input name="name" type="text" tabindex="1"></td>
                            </tr>
                           <tr>
                               <td align="left"><strong><font color="#FF0033"></font> &nbsp;&nbsp;Enrolment No.</strong><br></br></td>
                              <td align = "center"></td>
                              <td align="left"><input type="text" name="e_no" tabindex="2"> <br> <font size="-1" face="arial,sans-serif" color="#6f6f6f">
  (Only for IGNOU students)
  </font> </br></td>
                            </tr>
                            <tr>
                                <td align="left"><strong>&nbsp;&nbsp;E-mail<font color="#FF0033">*</font></strong></td>
                                <td align = "center"></td>
                                <td align="left"><input name="email_id" type="text" tabindex="3"> <br> <font size="-1" face="arial,sans-serif" color="#6f6f6f">
  <a href="javascript:var popup=window.open('EmailIDHelp.html', 'EmailIDHelp',
            'width=600, height=600, location=no, menubar=no,
            status=no, toolbar=no, scrollbars=yes, resizable=yes');" tabindex="-1">
  </a></font> </br> </td>
                            </tr>
                            <tr>
                                <tr><td align="left"><strong> &nbsp;&nbsp;Program</strong></td>
                                <td align = "center"></td>
                                <td align="left"><input name="Program" type="text" value="<%=prg%>"tabindex="4" readonly></td></tr>

							</tr>
<tr>
                                <tr><td align="left"><strong> &nbsp;&nbsp;Query Type</strong></td>
                                <td align = "center"></td>
                                <td align="left" ><select name = "querytype">
                                                 <option value ="Academic" >Academic </option>
                                                 <option value ="Administrative">Administrative </option>
                                    </select> <br> <font size="-1" face="arial,sans-serif" color="#6f6f6f">
  Select a query type
  <a href="javascript:var popup=window.open('QueryTypeHelp.html', 'QueryTypeHelp',
            'width=600, height=600, location=no, menubar=no,
            status=no, toolbar=no, scrollbars=yes, resizable=yes');" tabindex="-1">
  learn more</a></font> </br></td>
                                
                                  
                                </tr>

							</tr>

                                </tr>     </tr>

                              
                              

                                 <tr>
                                    <td align="left"><strong>&nbsp;&nbsp;Subject of query<font color="#FF0033">*</font></strong></td>
                                    <td align = "center"></td>
                                    <td align="left"><input name="subject" type="text" tabindex="6">
                                    <br> <font size="-1" face="arial,sans-serif" color="#6f6f6f">
  Minimum of 5 characters in length.
  <a href="javascript:var popup=window.open('QuerySubjectHelp.html', 'QuerySubjectHelp',
            'width=600, height=600, location=no, menubar=no,
            status=no, toolbar=no, scrollbars=yes, resizable=yes');" tabindex="-1">
  learn more</a></font>
  
  </br>
                                    </td>
                                   </tr>

                                <tr>
                                    <td align="left"><strong>&nbsp;&nbsp;Query Concerned To<br>
                                       (Departments/Divisions/Schools)</strong></td>
                                    <td align = "center"></td>
                                         
                                                  

                                                <td align="left">
                                                <select name = "department" >
                                                 <option value = "<%=dept_name%>" ><%=dept_des%></option>
                                                </select>  
                                                </td> 
                                              <%  } catch (SQLException e) {

                                                  //out.print(e);
                                                  
                                                    } finally { try {  conn.close();  } catch (Exception e) {  }	} %>
                                   </tr>

                                   <tr>
                                     <td align="left"><strong>&nbsp;&nbsp;Query<font color="#FF0033">*</font></strong></td>
                                    <td align = "center"></td>
                                    <td align="left"><textarea name="query" cols="46" rows="6" tabindex="7"></textarea>                                    </td>
                                   </tr>
                                    <tr>
                                      <td align = "left"><strong>&nbsp;&nbsp;Attachment<font color="#CC0000">**</font></strong></td>
                                      <td align = "center">&nbsp;</td>
                                      <td align="left"><label>
                                        <input type="file" name="file" />
                                      </label></td>
                                    </tr>
                                   
                                    <tr>
                                        <td colspan="3" align="left"><br><br> <font color="#CC0000">*</font><font size="1" face="Verdana">Fields are mandatory.</font><br>
                                          <font color="#CC0000">**</font><font size="1" face="Verdana">You  can attach any type of pdf,doc,ppt,txt,mp3,gif,jpg or mpg file for proper assumption. Please  note that the size of the attachment should not exceed 10 MB</font></td>
                                    </tr>
                                     <tr>
                                    <td align="left">&nbsp;</td>
                                    <td align = "center">&nbsp;</td>
                                    <td align="left"><input type="submit" name="submit" tabindex="9" value="Post">
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      <input type="reset" name="Reset"  tabindex="10">                                     </td>
                                   </tr>
                      </div></td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
      </tr>

       
     <%!
    int count = 1;
    String path = " ";

   public void jspInit()
     {
      try
         {
           path = getServletContext().getRealPath("/WEB-INF/counter.db");
           FileInputStream fis = new FileInputStream(path);
           DataInputStream dis = new DataInputStream(fis);
           count = dis.readInt();
           dis.close();
          }
      catch(Exception e)
        {
          log("Error loading counter",e);

         }
      }
    %>

 <% 
if(session.isNew())
 {
  count ++; 
   }  %>
<%!
 
    public void jspDestroy()
      {
        try
           {
           FileOutputStream fos = new FileOutputStream(path);
           DataOutputStream dos = new DataOutputStream(fos);
           dos.writeInt(count);
           dos.close();
          }
         catch(Exception e)
          {
           log("Error loading counter",e);
          }
      }
   %>
  <%
      BrowserDetector bd = new BrowserDetector(request.getHeader("User-Agent"));
            %>
     <tr>
          <td height="15" align="center" valign="middle" bgcolor="#330000"><div align="center"><font color="#CC9900" size="2"><strong> 
            </strong>    
          </font></div><div align="center"><font color="#CC9900" size="2"><strong>IGNOU 
              Education Grid &copy; All rights reserved, ACIIL </strong> 
          </font></div></td>
      </tr>

       
 
 <map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="<%=request.getHeader("referer")%>"/>
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
           </map>       
</form>

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-10506028-7']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>



