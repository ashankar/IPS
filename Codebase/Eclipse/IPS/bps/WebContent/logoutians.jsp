<%-- 
    Document   : logoutians
    Created on : 20 Oct, 2010, 4:56:09 PM
    Author     : anand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>::  IGNOU Prashnottari Sewa ::</title>
    </head>
    <body>
       <%
     session.invalidate();
     RequestDispatcher view =  request.getRequestDispatcher("loginians.jsp");
     view.forward(request,response);
 %>
    </body>
</html>
