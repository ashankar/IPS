import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;
import java.sql.Connection;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import javax.naming.NamingException;

public class deptt_reg extends HttpServlet 
{
   public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
   {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String s1 = request.getParameter("empid");
        String s2 = request.getParameter("name");               
        String s3 = request.getParameter("category");
        String s4 = request.getParameter("department");
        String s5 = request.getParameter("add");
        String s6 = request.getParameter("zip");
        String s7 = request.getParameter("std");
        String s8 = request.getParameter("cntno");
        String s9 = request.getParameter("mob");
        String s10 = request.getParameter("emailid");
        String day = request.getParameter("day");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        String s11 = day+"/"+month+"/"+year;
        String s12 = request.getParameter("gender"); 
        String s13 = request.getParameter("country");
        String s14 = request.getParameter("login");
        String s15 = request.getParameter("pass");
              
              Statement stmt = null;
              Connection conn = null;
              DataSource ds = null;
              try {
              ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
              }
              catch(NamingException e)
              { }
              try
              {
              conn = ds.getConnection();                                                  
              stmt = conn.createStatement();
              int result = stmt.executeUpdate("insert into employee_details values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','"+s8+"','"+s9+"','"+s10+"',str_to_date('"+s11+"','%d/%m/%Y'),'"+s12+"','"+s13+"')"); 
              stmt.executeUpdate("insert into login values('"+s1+"','"+s4+"','"+s3+"','"+s14+"','"+s15+"')"); 
              if(result>0)
              {
               RequestDispatcher view =  request.getRequestDispatcher("Ack_Reg.jsp");
               view.forward(request,response);
              }
            
              }
            
               catch (SQLException e) {
               e.printStackTrace();
               }  finally { try {

                   conn.close();

                  } catch (Exception e) {
                  }
                }
    } 

    
}
