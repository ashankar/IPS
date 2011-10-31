<%@ page language="java" import ="java.sql.*" %>
<%@ page errorPage = "errorqms.jsp" %>
<%@ page import = "javax.sql.*, javax.naming.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: IGNOU Prashnottari Sewa::</title>

<style type="text/css">
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 13px;
}
</style></head>

<body onload= "window.status = 'Welcome to IGNOU Prashnottri Sewa';">
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
</table></td>
</tr>
<tr>
<td height="5" bgcolor="#000000"></td>
</tr>
<tr>
      <td height="21" align="center"><table width="796" border="0">
    <tr>
      <td width="164"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="TokenSearch.jsp">View Answered Query</a></font></td>
      <td width="528" align="center"><b>FAQ (Frequently Asked Questions)</b>   <font
                              face="Verdana, Arial, Helvetica, sans-serif"
                              size="2"><a href="login.jsp"></a></font></td>
      <td width="90"><div align="right"><font
                              face="Verdana, Arial, Helvetica, sans-serif"
                              size="2"><a href="login.jsp">Staff Login</a></font></div></td>
    </tr>
  </table></td>
</tr>
<tr>
  <td height="5">&nbsp;</td>
</tr>
<tr>
    <td height="192">
<%!
public int nullIntconv(String str)
{
  int conv=0;
  if(str==null)
  {
  str="0";
   }
  else if((str.trim()).equals("null"))
  {
  str="0";
  }
  else if(str.equals(""))
  {
  str="0";
  }
  try{
  conv=Integer.parseInt(str);
  }
  catch(Exception e)
  {
  }
  return conv;
}
%>
<%
  DataSource ds=null;

  Connection conn = null;
  try {

      ds=(DataSource)new InitialContext().lookup("jdbc/ipsDB");
      conn=ds.getConnection();

              } catch (Exception e) {
              }

  ResultSet rsPagination = null;
  ResultSet rsRowCnt = null;

  PreparedStatement psPagination=null;
  PreparedStatement psRowCnt=null;

  int iShowRows=5;
  int iTotalSearchRecords=10; 
  int count=0;

  int iTotalRows=nullIntconv(request.getParameter("iTotalRows"));
  int iTotalPages=nullIntconv(request.getParameter("iTotalPages"));
  int iPageNo=nullIntconv(request.getParameter("iPageNo"));
  int cPageNo=nullIntconv(request.getParameter("cPageNo"));

  int iStartResultNo=0;
  int iEndResultNo=0;

  if(iPageNo==0)
  {
  iPageNo=0;
  }
  else{
  iPageNo=Math.abs((iPageNo-1)*iShowRows);
  }



  String sqlPagination="select SQL_CALC_FOUND_ROWS query,Query_Answer,Query_Reply_Date from user_query, query_info where user_query.token_id = query_info.Token_id AND query_info.FAQ='checked'limit "+iPageNo+", "+iShowRows+"";
        
  psPagination=conn.prepareStatement(sqlPagination);
  rsPagination=psPagination.executeQuery();

  String sqlRowCnt="SELECT FOUND_ROWS() as cnt";
  psRowCnt=conn.prepareStatement(sqlRowCnt);
  rsRowCnt=psRowCnt.executeQuery();

  if(rsRowCnt.next())
  {
  iTotalRows=rsRowCnt.getInt("cnt");
  }
%>

<form name="frm" action="FAQ.jsp">
<input type="hidden" name="iPageNo" value="<%=iPageNo%>"/>
<input type="hidden" name="cPageNo" value="<%=cPageNo%>"/>
<input type="hidden" name="iShowRows" value="<%=iShowRows%>"/>
<table width="100%" cellpadding="1" cellspacing="2" border="1">
<tr> <td width=52 align="center" aligin=center> <p align=center> <b> S. No. </b> </p> </td> <td width=313 align="center" aligin=center> <p align=center> <b> Question </b> </p> </td> <td width=325 align="center" aligin=center> <p align=center> <b> Answer </b> </p> </td> <td width=84 align="center" aligin=center> <p align=center> <b> Updated on </b> </p> </td> </tr>    
    
<%
  while(rsPagination.next())
 {
                count++;
                
                //out.println("<table width=100% cellpadding=0 cellspacing=0 border=1>");
                //out.println("<tr> <td aligin=center width=150> <p align=center> <b> Question </b> </p> </td> <td aligin=center width=150> <p align=center> <b> Answer </b> </p> </td> <td aligin=center width=80> <p align=center> <b> Updated on </b> </p> </td> </tr>");
                //out.println("<tr aligin=left><td aligin=left width=100><p align=left><b>Question :-</b></p></td><td aligin=left><p align=left>"+" " +rsPagination.getString(1) + "</p></td></tr>");
                //out.println("<tr> <td height=5 aligin=left></td><td aligin=left></td></tr>");
                //out.println("<tr> <td aligin=left width=50> <p aligin=left>" + count + ".</p> </td> <td aligin=left width=150> <p aligin=left>" + rsPagination.getString(1) + "</p> </td> <td aligin=left width=150> <p aligin=left>" + rsPagination.getString(2) + "</p> </td> <td aligin=left width=80> <p aligin=left>" + rsPagination.getString(3) + "</p> </td> </tr>");
                //out.println("<tr aligin=left><td aligin=left></td><td aligin=left><p align=left><b>updated on :-</b>"+" " + rsPagination.getString(3)+ "</p></td></tr>");
               //out.println("<tr aligin=left><td height=15 aligin=left></td><td aligin=left></td></tr>");
               //out.println("</table>");
               //out.println("<br>");

     %>
     
     <tr> <td aligin="left" width="52"> <div align="left">  <%=count%>. </div> </td> <td aligin="left" width="313"> <div align="left"> <%=rsPagination.getString(1)%> </div> </td> <td aligin="left" width="325"> <div align="left"> <%=rsPagination.getString(2)%> </div> </td> <td aligin="left" width="84"> <div align="left"> <%=rsPagination.getString(3)%> </div> </td> </tr>
              
<%
    
    
  try{
  if(iTotalRows<(iPageNo+iShowRows))
  {
  iEndResultNo=iTotalRows;
 }
  else
  {
  iEndResultNo=(iPageNo+iShowRows);
  }

  iStartResultNo=(iPageNo+1);
  iTotalPages=((int)(Math.ceil((double)iTotalRows/iShowRows)));

  }
  catch(Exception e)
  {
  e.printStackTrace();
  }
  }

%>

<tr>
    <td colspan="4" align="center">
<div>
<%


  int i=0;
  int cPage=0;
  if(iTotalRows!=0)
  {
  cPage=((int)(Math.ceil((double)iEndResultNo/(iTotalSearchRecords*iShowRows))));

  int prePageNo=(cPage*iTotalSearchRecords)-((iTotalSearchRecords-1)+iTotalSearchRecords);
  if((cPage*iTotalSearchRecords)-(iTotalSearchRecords)>0)
  {
  %>
  <a href="FAQ.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
  <%
  }

  for(i=((cPage*iTotalSearchRecords)-(iTotalSearchRecords-1));i<=(cPage*iTotalSearchRecords);i++)
  {
  if(i==((iPageNo/iShowRows)+1))
  {
  %>
 <a href="FAQ.jsp?iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
  <%
  }
  else if(i<=iTotalPages)
  {
  %>
  <a href="FAQ.jsp?iPageNo=<%=i%>"><%=i%></a>
  <%
  }
  }
  if(iTotalPages>iTotalSearchRecords && i<iTotalPages)
  {
  %>
  <a href="FAQ.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>"> >> Next</a>
  <%
  }
  }
  %>
<b>Rows <%=iStartResultNo%> - <%=iEndResultNo%>  Total FAQs:  <%=iTotalRows%> </b>
</div>
</td>
</tr>
</table>
</form>
<%
  try{
  if(psPagination!=null){
  psPagination.close();
  }
 if(rsPagination!=null){
  rsPagination.close();
  }

  if(psRowCnt!=null){
 psRowCnt.close();
  }
 if(rsRowCnt!=null){
  rsRowCnt.close();
  }

  if(conn!=null){
  conn.close();
  }
  }
 catch(Exception e)
  {
  e.printStackTrace();
  }
%>

    </td>
  </tr>

<tr>
<td height="19" bgcolor="#330000"><div align="center"><font color="white" size="2"><strong>IGNOU
              Education Grid &copy; All rights reserved, ACIIL </strong>
              </font></div></td>
</tr>
</table>
</center>
<map name="Map" id="Map">
  <area shape="rect" coords="273,2,367,24" href="http://www.ignou.ac.in" target="_blank" />
  <area shape="rect" coords="182,2,243,25" href="index.html" />
</map>

<map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="index.jsp" />
<area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
<area shape="rect" coords="368,3,492,23" href="http://www.ignou.ac.in" />
</map></body>
</html>