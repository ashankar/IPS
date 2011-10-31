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

public class DeptLogin extends HttpServlet 
  {
   public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        PrintWriter out=response.getWriter();
        String password = request.getParameter("password");
        String usertype = request.getParameter("usertype");
        HttpSession session = request.getSession();
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
              rs = stmt.executeQuery("select *from login where Username = '"+username+"' && Password = '"+password+"' && User_Type = '"+usertype+"'");                           
              if (rs.next())
                 {
                     String User_type = rs.getString(3);
                     session.setAttribute("Emp_Id",(String)rs.getString(1));
                     session.setAttribute("User",(String)rs.getString(4));
                     session.setAttribute("Department",(String)rs.getString(2));

                     if(User_type.equals("admin"))
                          {
                            RequestDispatcher view =  request.getRequestDispatcher("DeptAdminDashboard.jsp");
                            view.forward(request,response);
                          }

                     else if(User_type.equals("dept"))
                          {
                           RequestDispatcher view =  request.getRequestDispatcher("DeptQueryDashboard.jsp");
                           view.forward(request,response);
                          }   
                     else if(User_type.equals("Experts"))
                          {
                           RequestDispatcher view =  request.getRequestDispatcher("DeptExpertDashBoard.jsp");
                           view.forward(request,response);
                          }  
                     else if(User_type.equals("rc_cord"))
                          {
                           RequestDispatcher view =  request.getRequestDispatcher("DeptRCDashboard.jsp");
                           view.forward(request,response);
                          }  
                     else if(User_type.equals("RCExperts"))
                          {
                           RequestDispatcher view =  request.getRequestDispatcher("DeptRCExpertDashBoard.jsp");
                           view.forward(request,response);
                          }   
                       
                    }   
               else
                {
                 String Fail = "Sorry ! Wrong UserName or Password,Retry !!!";
                 session.setAttribute("Fail",Fail); 
                 RequestDispatcher view =  request.getRequestDispatcher("DeptLogin.jsp");
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
  
