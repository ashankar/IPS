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

public class DeptRCPending extends HttpServlet
   {
       public void doPost(HttpServletRequest request,HttpServletResponse response)
                    throws IOException,ServletException
             {
              response.setContentType("text/html");
              HttpSession sess = request.getSession();
              String Value = request.getParameter("r1");
              String Button = request.getParameter("button");
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
                 if(Button.equals("Cancel"))
                   {               
                      RequestDispatcher view =  request.getRequestDispatcher("DeptRCDashboard.jsp");
                      view.forward(request,response);
                     }
                  
                  else if(Button.equals("ViewQuery"))
                   {               
                      rs = stmt.executeQuery("select TokenId,QueryFwdDate,DeptName,QueryFwdTo from deptqueryinfo where TokenId = '"+Value+"'");                    
                      sess.setAttribute("rs",rs);
                      RequestDispatcher view =  request.getRequestDispatcher("DeptRCPending.jsp");
                      view.forward(request,response);
                     }
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
          
                