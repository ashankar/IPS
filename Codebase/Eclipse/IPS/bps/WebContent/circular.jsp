<%@ page import="java.sql.Connection,
  javax.sql.DataSource,
  javax.naming.Context,
  javax.naming.InitialContext,
  java.sql.Statement,
  java.sql.ResultSet,
  java.sql.SQLException"%>
<%@ page errorPage="errorqms.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
        <meta http-equiv="Content-Type" content="text/html charset=iso-8859-1" />
        <title>:: IGNOU Prashnottari Sewa::</title>  
        <script type="text/javascript">
            var delay = 3500; //set delay between message change (in miliseconds)
            var maxsteps=30; // number of steps to take to change from start color to endcolor
            var stepdelay=40; // time in miliseconds of a single step
            //**Note: maxsteps*stepdelay will be total time in miliseconds of fading effect
            var startcolor= new Array(255,255,255); // start color (red, green, blue)
            var endcolor=new Array(0,0,0); // end color (red, green, blue)

            var fcontent=new Array();
            begintag='<div style="font: normal 14px Arial; padding: 5px;">'; //set opening tag, such as font declarations
            fcontent[0]='<span class="news_date">July 22, 2009</span><br/><br/> <span class="body_text">Launching the Circulars for the Internal use of IGNOU Officials</span><br/><span class="news_more"><br/><a href="view_circular.jsp">Read More</a></span><br/>'
            fcontent[1]='<span class="news_date">July 9, 2009</span><br/><br/><span class="body_text">You can can post and view the circulars through your respective logins</span><br/><span class="news_more"><br/><a href="view_circular.jsp">Read More</a></span><br/>'
            closetag='</div>';
            var fwidth='150px'; //set scroller width
            var fheight='150px'; //set scroller height
            var fadelinks=1;  //should links inside scroller content also fade like text? 0 for no, 1 for yes.
            ///No need to edit below this line/////////////////
            var ie4=document.all&&!document.getElementById;
            var DOM2=document.getElementById;
            var faderdelay=0;
            var index=0;
            //function to change content
            function changecontent(){
                if (index>=fcontent.length)
                    index=0
                if (DOM2){
                    document.getElementById("fscroller").style.color="rgb("+startcolor[0]+", "+startcolor[1]+", "+startcolor[2]+")"
                    document.getElementById("fscroller").innerHTML=begintag+fcontent[index]+closetag
                    if (fadelinks)
                        linkcolorchange(1);
                    colorfade(1, 15);
                   }
                else if (ie4)
                    document.all.fscroller.innerHTML=begintag+fcontent[index]+closetag;
                index++
               }           
            function linkcolorchange(step){
                var obj=document.getElementById("fscroller").getElementsByTagName("A");
                if (obj.length>0){
                    for (i=0;i<obj.length;i++)
                    obj[i].style.color=getstepcolor(step);
                }
            }

            var fadecounter;
            function colorfade(step) {
                if(step<=maxsteps) {	
                    document.getElementById("fscroller").style.color=getstepcolor(step);
                    if (fadelinks)
                        linkcolorchange(step);
                    step++;
                    fadecounter=setTimeout("colorfade("+step+")",stepdelay);
                }else{
                    clearTimeout(fadecounter);
                    document.getElementById("fscroller").style.color="rgb("+endcolor[0]+", "+endcolor[1]+", "+endcolor[2]+")";
                    setTimeout("changecontent()", delay);
                }   
            }

            function getstepcolor(step) 
             {
                var diff
                var newcolor=new Array(3);
                for(var i=0;i<3;i++) {
                    diff = (startcolor[i]-endcolor[i]);
                    if(diff > 0) {
                        newcolor[i] = startcolor[i]-(Math.round((diff/maxsteps))*step);
                    } else {
                        newcolor[i] = startcolor[i]+(Math.round((Math.abs(diff)/maxsteps))*step);
                    }
                }
                return ("rgb(" + newcolor[0] + ", " + newcolor[1] + ", " + newcolor[2] + ")");
            }
           
            if (window.addEventListener)
                window.addEventListener("load", changecontent, false)
            else if (window.attachEvent)
                window.attachEvent("onload", changecontent)
            else if (document.getElementById)
                window.onload=changecontent         
        </script> 
  
         <script type="text/javascript">
                function validateFormOnSubmit(CircularForm) {
                var reason = "";
                reason+= valDrop(CircularForm.moption);
                reason+= validatesubjectfield(CircularForm.subject);
                reason+= validateaddfield(CircularForm.circular);
                if (reason != "") {
                    alert("Some fields need correction:\n" + reason);
                    return false;
                }
                return true;
            }
   
           
            function valDrop(fld) 
                {
                var error = "";
                if (fld.value == ""){
                fld.style.background = '#F5D0A9'; 
                error="Please select atleast one Deaprtment from Circular Issued to field.\n";
                 } 
                else 
                {
                fld.style.background = 'White';
                }       
                return error;
              } 
       
            function validatesubjectfield(fld) {
                var error = "";
                var illegalChars = /\W/; // allow letters, numbers, and underscores
                if (fld.value == "") {
                    fld.style.background = '#F5D0A9'; 
                    error = "The required field has not been filled in "+fld.name+".\n";
                }   
                else if ((fld.value.length < 5) || (fld.value.length > 100)) {
                    fld.style.background = '#F5D0A9'; 
                    error = "The subject is the wrong length,it should be maximum by 25 characters.\n";
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
                    fld.style.background = '#F5D0A9'; 
                    error = "The required field has not been filled in "+fld.name+".\n";
                }   
                else if ((fld.value.length < 5) || (fld.value.length > 500)) {
                    fld.style.background = '#F5D0A9'; 
                    error = "The address is of the wrong length,it should be maximum by 500 characters.\n";
                } 
                else {
                    fld.style.background = 'White';
                }
                return error;
            }
       
        </script>
    </head>
    
    <body  onload= "window.status = 'Welcome to IGNOU Prashnottri Sewa';">
        <form name="CircularForm" method = "post" action="circular" onsubmit="validateFormOnSubmit(this)" enctype="multipart/form-data">
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
                <td width="800" align="center" valign="top"> <%@ include file = "Links11.jsp" %></td>
        </tr></table></td></tr>                    
                    <tr>
                        <td height="5" colspan="3" bgcolor="#000000" align = "center"></td>
                    </tr>
                </table>
                <%
                Statement stmt2 = null;
                Statement stmt = null;
                Connection conn = null;
                String Department = (String)session.getAttribute("Department");
                String User = (String)session.getAttribute("User");
                try {            
                if(User == null)
                    {
                  RequestDispatcher view =  request.getRequestDispatcher("CirLogin.jsp");
                  view.forward(request,response);
                  }
                else
                {
                DataSource ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
                conn = ds.getConnection();               
                stmt = conn.createStatement();
                stmt2 = conn.createStatement();
                String sql ="select * from dept_details";
                ResultSet rs2 = stmt2.executeQuery(sql);               
                 %>                                
                <table align = "center" width = "815" bgcolor="#F7EFE7" border ="1">
                    <tr>                       
                        <td>
                            <table width = "150" height = "200"  bgcolor="#F7EFE7" border="0">
                                <tr><td align = "center"><strong>Latest Circulars</strong></td></tr>
                                <tr><td id="fscroller"align="center">
                                </td></tr>
                            </table>
                        </td>
                        <td>
                            <table align="center"><tr><td align="center"><h3 align="center">IGNOU Circulars </h3></td></tr></table>
                            <table align = "center" bgcolor="#F7EFE7" border="0" width = 550>    
                                   <td align="left"><strong><font color="#FF0033">*</font>
                                    Circular Issued By </strong></td>
                                    <td align = "left">:</td>
                                   <td align="left" width = 60><select name="issued_by" tabindex="1">
                                  <option value="<%=Department%>"><%=Department%></option>
                                  </select></td>
                                  </tr>
                                <tr><td></td></tr> <tr><td></td></tr>
                                <tr>
                                    <td align="left"><strong><font color="#FF0033">*</font>
                                    Circular Issued To </strong><br><font color="#FF0033">(Please Press ctrl to select more than one option)</font>
                                     </td>
                                    <td align = "left">:</td>
                                    <td align="left">
                                    <select name="moption" size="5" multiple="multiple">
<option value="0">------------------------Please Select------------------------</option>
           <%
             while(rs2.next()){ %>
             <option value="<%=rs2.getString(2)%>"><%=rs2.getString(3)%></option>
           <%}%>
             </select></td>
             <%  rs2.close();   
            } 
           }   
           catch (SQLException e) {
            e.printStackTrace();
            } finally { try {  conn.close();  } catch (Exception e) {  }	}   %>
                                                 
                                </tr>
                                 <tr><td></td></tr> <tr><td></td></tr>

                                <tr> 
                                    <td align="left"><strong><font color="#FF0033">*</font>Topic</strong></td>
                                    <td align = "center">:</td>
                                    <td align="left"><input name="subject" type="text" id="subject" tabindex="2"></td>
                                </tr>
                                 <tr><td></td></tr> <tr><td></td></tr>

                                <tr>
                                    <td align="left"><strong><font color="#FF0033">*</font>Please Enter The Brief Desciption</strong></td>
                                    <td align = "center">:</td>
                                    <td align="left"><textarea name="circular" cols="45" rows="4" tabindex="3"></textarea>
                                    </td>
                                </tr>
                                <tr><td></td></tr> <tr><td></td></tr>

                                <tr>
                                    <td align = "left"><strong><font color="#FF0033">*</font>Attachment</strong></td>
                                    <td align = "center">&nbsp;</td>
                                    <td align="left"><label>
                                            <input type="file" name="file" />
                                    </label></td>
                                </tr> 
                                 
                                <tr>
                                    <td align = "left">&nbsp;</td>
                                    <td align = "center">&nbsp;</td>
                                    <td align="left">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3" align = "left"><font color="#CC0000">**</font>You  can attach supporting file for proper assumption. Please  note that the size of the attachment should not exceed 5MB</td>
                                </tr>
                                <tr>
                                    <td align = "left">&nbsp;</td>
                                    <td align = "center">&nbsp;</td>
                                    <td align="left">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="left">&nbsp;</td>
                                    <td align = "center">&nbsp;</td>
                                    <td align="left"><input type="submit" name="submit" tabindex="4" value="Post">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="reset" name="Reset"  tabindex="0">
                                    </td>
                                </tr>  
                            </table>
                        </td>
                    </tr>
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



















