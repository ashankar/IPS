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

public class DeptReport extends HttpServlet
   {
       public void doPost(HttpServletRequest request,HttpServletResponse response)
                    throws IOException,ServletException
             {
              response.setContentType("text/html");
              PrintWriter out = response.getWriter();
              HttpSession sess = request.getSession();
              String User = (String)sess.getAttribute("User");
              String department = (String)request.getParameter("department"); 
              String day = request.getParameter("day");
              String month = request.getParameter("month");
              String year = request.getParameter("year");
              String day2 = request.getParameter("day2");
              String month2 = request.getParameter("month2");
              String year2 = request.getParameter("year2");
              String datefrom = day+"/"+month+"/"+year;
              String dateto = day2+"/"+month2+"/"+year2; 
              Statement stmt = null;
              ResultSet rs = null;
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
              rs = stmt.executeQuery("select *from deptqueryinfo where QueryFwdDate between str_to_date('"+datefrom+"','%d/%m/%Y') and str_to_date('"+dateto+"','%d/%m/%Y') and dept_name = '"+department+"'");
              sess.setAttribute("rs",rs);                          
              RequestDispatcher view =  request.getRequestDispatcher("DeptReport.jsp");
              view.forward(request,response);
               }
              
                   
               catch (SQLException e) {
               e.printStackTrace();
               } finally { try {

                   conn.close();

                  } catch (Exception e) {
                  }
  }
       }
}
          
                