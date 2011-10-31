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

public class Report extends HttpServlet
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
              String datefrom = year+"-"+month+"-"+day;
              String dateto = year2+"-"+month2+"-"+day2; 
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
              String sql = "select *from query_info where Query_Fwd_date between '"+datefrom+"' and '"+dateto+"' and dept_name = '"+department+"'";
               rs = stmt.executeQuery(sql);
                sess.setAttribute("rs",rs);                          
              RequestDispatcher view =  request.getRequestDispatcher("Report.jsp");
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
          
                