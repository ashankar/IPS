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

public class adminquery extends HttpServlet
   {
       public void doPost(HttpServletRequest request,HttpServletResponse response)
                    throws IOException,ServletException
             {
              response.setContentType("text/html");
              PrintWriter out = response.getWriter();
              HttpSession sess = request.getSession();
              String Token = request.getParameter("r1");
              String Department = request.getParameter("Department");
              String Button = request.getParameter("button");
         //     String Department = (String)sess.getAttribute("Department");
              String User = (String)sess.getAttribute("User");
              String Emp_Id = (String)sess.getAttribute("Emp_Id");
          //    int Time = (Integer)sess.getAttribute("Time");
                      
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
                  if(Button.equals("DeleteQuery"))
                     {               
                        stmt.executeUpdate("delete from user_query where token_id = '"+Token+"' " );
                        RequestDispatcher view =  request.getRequestDispatcher("adminquery.jsp");
                        view.forward(request,response);
                      }                                             
                    
                 else if(Button.equals("Cancel"))
                   {               
                      RequestDispatcher view =  request.getRequestDispatcher("admindashboard.jsp");
                      view.forward(request,response);
                     }
                  
                   else if(Button.equals("ForwardQuery"))
                   {  
                       stmt.executeUpdate("update user_query set department = '"+Department+"',status = 'New' where token_id = '"+Token+"'");
                       RequestDispatcher view =  request.getRequestDispatcher("adminquery.jsp");
                      view.forward(request,response);
                     }
                  
                  else if(Button.equals("ViewQuery"))
                   {               
                      rs = stmt.executeQuery("select *from user_query where token_id = '"+Token+"'");
                      sess.setAttribute("rs",rs);                          
                      RequestDispatcher view =  request.getRequestDispatcher("adminquery.jsp");
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
          
                