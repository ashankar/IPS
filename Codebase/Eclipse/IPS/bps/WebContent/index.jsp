<%@ page import = "org.apache.turbine.util.BrowserDetector" %>
<%@ page language = "java" import = "java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml2/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

<script type="text/javascript" src="ddaccordion.js">

/***********************************************
* Accordion Content script- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* Visit http://www.dynamicDrive.com for hundreds of DHTML scripts
* This notice must stay intact for legal use
***********************************************/

</script>

<script type="text/javascript">

ddaccordion.init({
	headerclass: "headerbar", //Shared CSS class name of headers group
	contentclass: "submenu", //Shared CSS class name of contents group
	revealtype: "mouseover", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
	mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
	collapseprev: true, //Collapse previous content (so only one open at any time)? true/false
	defaultexpanded: [0], //index of content(s) open by default [index1, index2, etc] [] denotes no content
	onemustopen: true, //Specify whether at least one header should be open always (so never all headers closed)
	animatedefault: false, //Should contents open by default be animated into view?
	persiststate: true, //persist state of opened contents within browser session?
	toggleclass: ["", "selected"], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
	togglehtml: ["", "", ""], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
	animatespeed: "normal", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
	oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
		//do nothing
	},
	onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
		//do nothing
	}
})

</script>

<style type="text/css">

.urbangreymenu{
width: 190px; /*width of menu*/
}

.urbangreymenu .headerbar{
font: bold 13px Verdana;
color: white;
background: #990000 url(arrowstop.gif) no-repeat 8px 6px; /*last 2 values are the x and y coordinates of bullet image*/
margin-bottom: 0; /*bottom spacing between header and rest of content*/
text-transform: uppercase;
padding: 7px 0 7px 31px; /*31px is left indentation of header text*/
}

.urbangreymenu .headerbar a{
text-decoration: none;
color: white;
display: block;
}

.urbangreymenu ul{
list-style-type: none;
margin: 0;
padding: 0;
margin-bottom: 0; /*bottom spacing between each UL and rest of content*/
}

.urbangreymenu ul li{
padding-bottom: 2px; /*bottom spacing between menu items*/
}

.urbangreymenu ul li a{
font: normal 12px Arial;
color: black;
background: #E9E9E9;
display: block;
padding: 5px 0;
line-height: 17px;
padding-left: 8px; /*link text is indented 8px*/
text-decoration: none;
}

.urbangreymenu ul li a:visited{
color: black;
}

.urbangreymenu ul li a:hover{ /*hover state CSS*/
color: white;
background: black;
}

</style>

<title>IGNOU PRASHNOTTARI SEWA</title><body>
<table width="820" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr><td width="820">
     <table width="820" border="0" cellspacing="0" cellpadding="0">
      <tr><td width="820" align="center" valign="middle"><div align="center"><img src="Images/head.gif" width="820" height="150" /></div></td>
      </tr>
       <tr><td align="center" valign="middle" bgcolor="#F7EFE7"><div align="right"><img src="Images/links.gif" width="500" height="27" border="0" usemap="#Map2" /></div></td>
      </tr>
      <tr><td height="5" colspan="3" bgcolor="#000000"></td></tr> 
      <tr><td align="center" bgcolor="#F7EFE7">
              <font size="2px"> Version 1.1</font> <div align="right"><a href="http://code.google.com/p/querymanagementsystem/downloads/list"> <font size="2px"> Download IPS</font></a></div>
        <p><font size = "5"><b><u>IGNOU Prashanottari Sewa</u></b></font> </p>
        <table width="200" align="left">
          <tr>
            <td><div align="center"><a href="TokenSearch.jsp"><strong>View Query Response</strong> </a></div></td>
          </tr>
          
        </table>        		
		<table width="200" border="0" align="right">
          <tr>
            <td><div align="center"><a href="FAQ.jsp"><strong>Frequently Asked Queries </strong></a></div></td>
          </tr>
          
        </table> 
		
		</p></td></tr>     
      <tr><td height="385" align="center" valign="middle" bgcolor="#FFFFFF">
        <table width="815" height="379" border="0" cellpadding="1" cellspacing="1" bgcolor="#F7EFE7" align = "center">
         <tr><td>
         <table width="677" height="379" border="0" cellpadding="1" cellspacing="1" bgcolor="#F7EFE7" align = "center">
           <tr><td width="230">    
         <div class="urbangreymenu">

<h3 class="headerbar" align="center">POST QUERIES</a></h3>
<ul class="submenu">
<li><a href="IgnouStudentIndex.jsp">Query by IGNOU Students </a></li>
            <li><a href="GeneralStudentIndex.jsp">Query by General Public</a></li>
            <li><a href="DeptIndex.jsp">Query by Regional Center  </a></li>
            <li><a href="DeptIndex.jsp">Query by Study Center  </a></li>
            <li><a href="IgnouStudentIndex.jsp">Query by Counselors  </a></li>
            <li><a href="webmaster.jsp">IGNOU Website related queries</a></li>
            
            
</ul>
</div>
</td>
<td width="230">
<div class="urbangreymenu">

<h3 align="center" class="headerbar">SERVICES</h3>
<ul class="submenu">
              <li><a href="http://aciil.ignou.ac.in/Survey/">Students Satisfaction Survey </a></li>
              <li><a href="http://aciil.ignou.ac.in/mnrs">Students SMS Service </a></li>
              <li><a href="index.jsp">Students E-mail </a></li>

</ul>
</div>
</td>

<td width="207">
<div class="urbangreymenu">

<h3 align="center" class="headerbar">IPS MANAGEMENT</a></h3>
<ul class="submenu">
<li><a href="login.jsp">IPS Administrator  </a></li>
            <li><a href="LoginPC.jsp"> Program Query Administrator</a></li>
            <li><a href="LoginPC.jsp"> Student Support Centre</a></li>
            <li><a href="LoginPC.jsp">Computer Division </a></li>
            <li><a href="CirLogin.jsp">Post Circular </a></li>
            <li><a href="loginians.jsp"> IANS </a></li>
</ul>
</div>
</td>
</tr></table>
 </td>
         </tr></table>
     </td></tr></table>
  </td></tr>
       
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
          log("Error loading counter Neeraj",e);
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
           log("Error loading counter Neeraj",e);
          }
      }
   %>
  <%
      BrowserDetector bd = new BrowserDetector(request.getHeader("User-Agent"));
            %>
     <tr>
          <td height="15" align="center" valign="middle" bgcolor="#330000"><div align="center"><font color="white" size="2"><strong> 
             Visitor No. - &nbsp;<%= count %>&nbsp;&nbsp;&nbsp;
                Browser Name - &nbsp;<%=bd.getBrowserName( )%></strong>    
          </font></div></td>
      </tr>

     

       <tr>
          <td height="15" align="center" valign="middle" bgcolor="#330000"><div align="center"><font color="white" size="2"><strong>IPS &copy; All rights reserved 2010, ACIIL </strong> 
          </font></div></td>
      </tr>
    </table></td>
  </tr>
</table>
 <map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="index.jsp" />
            <area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
            <area shape="rect" coords="368,3,492,23" href="ContactUs.jsp" />
           </map>       
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-10506028-7");
pageTracker._trackPageview();
} catch(err) {}</script>
</body>
</html>
