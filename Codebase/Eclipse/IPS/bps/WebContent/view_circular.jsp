<%@ page  errorPage="errorqms.jsp" %>
<%@ page import ="java.sql.*, javax.sql.DataSource, javax.naming.Context, javax.naming.InitialContext, javax.naming.NamingException" %>

<%@ page language="java" session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>::IGNOU-Query Management System::</title>

<style type="text/css">
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 13px;
}
</style></head>

<body onload= "window.status = 'Welcome to IGNOU Prashnottri Sewa';">
    <form name="form1" action="c_descrip.jsp" method="post">
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
      <td width="151"></td>
    <center> <h3>IGNOU Prashnottari Sewa</h3></center>
           <center> <h4><u>IGNOU Circular</u></h4></center>
               
    </tr>
  </table></td>
</tr>
<tr>
  <td height="21">&nbsp;</td>
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
              Connection conn = null;
              DataSource ds = null;
              try {
               ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
		  conn = ds.getConnection();
              }
              catch(Exception e)
              { }

  ResultSet rsPagination = null;
  ResultSet rsRowCnt = null;

  PreparedStatement psPagination=null;
  PreparedStatement psRowCnt=null;

  int iShowRows=5;
  int iTotalSearchRecords=6; 
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

  String sqlPagination="select SQL_CALC_FOUND_ROWS c_id,c_subject,c_description,c_date,issued_by,issued_to from circular limit "+iPageNo+", "+iShowRows+"";
 
 
        
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

<form name="frm" action="view_cir.jsp">
<input type="hidden" name="iPageNo" value="<%=iPageNo%>"/>
<input type="hidden" name="cPageNo" value="<%=cPageNo%>"/>
<input type="hidden" name="iShowRows" value="<%=iShowRows%>"/>
<table width="100%" cellpadding="1" cellspacing="2" border="1">
<tr>    <td align = "center"><font color =#74101A><b>ID</b></font></td> 
                                <td align = "center"><font color = #74101A><b>Topic</b></font></td> 
                                <td align = "center"><font color = #74101A><b>Date</b></font></td>
                                <td align = "center"><font color = #74101A><b>Issued By</b></font></td>
                                <td align = "center"><font color = #74101A><b>Issued To</b></font></td>
                              </tr>
<%
  while(rsPagination.next())
 {
                count++;   
     %>
     
     <tr><td align = "center"><a href="./c_descrip.jsp?<%=rsPagination.getString(1)%>"><%=rsPagination.getString(1)%></td> 
                              <td align = "center"><%=rsPagination.getString(2)%></td>
			    
			      <td align = "center"><%=rsPagination.getString(4)%></td>
                              <td align = "center"><%=rsPagination.getString(5)%></td>
                               <td align = "center"><%=rsPagination.getString(6)%></td>                          
                         
                                   </tr> 
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
    <td colspan="5" align="center">
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
  <a href="view_circular.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
  <%
  }

  for(i=((cPage*iTotalSearchRecords)-(iTotalSearchRecords-1));i<=(cPage*iTotalSearchRecords);i++)
  {
  if(i==((iPageNo/iShowRows)+1))
  {
  %>
 <a href="view_circular.jsp?iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
  <%
  }
  else if(i<=iTotalPages)
  {
  %>
  <a href="view_circular.jsp?iPageNo=<%=i%>"><%=i%></a>
  <%
  }
  }
  if(iTotalPages>iTotalSearchRecords && i<iTotalPages)
  {
  %>
  <a href="view_circular.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>"> >> Next</a>
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
  out.print(e);
  }
%>
            <center>
            <table border=0 width = 800 > <tr><td> 
                         
</td>
        </tr>
      </table>
      <P align="justify">&nbsp;</P>
      <p align="justify" class="style1">&nbsp;</p></td>
  </tr>

<tr>
<td height="19" bgcolor="#330000"><div align="center"><font color="white" size="2"><strong>IGNOU
              Education Grid &copy; All aights reserved, ACIIL </strong>
              </font></div></td>
</tr>
</table>
</center>
</form>
<map name="Map" id="Map">
  <area shape="rect" coords="273,2,367,24" href="http://www.ignou.ac.in" target="_blank" />
  <area shape="rect" coords="182,2,243,25" href="index.html" />
</map>

<map name="Map2" id="Map2"><area shape="rect" coords="162,2,241,25" href="Home.jsp" />
<area shape="rect" coords="259,3,346,23" href="http://www.ignou.ac.in" />
<area shape="rect" coords="368,3,492,23" href="http://www.ignou.ac.in" />
</map></body>
</html>

