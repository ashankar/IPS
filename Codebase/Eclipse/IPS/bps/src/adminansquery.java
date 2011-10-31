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

public class adminansquery extends HttpServlet
   {
       public void doPost(HttpServletRequest request,HttpServletResponse response)
                    throws IOException,ServletException
             {
              response.setContentType("text/html");
              HttpSession sess = request.getSession();
              String Value = request.getParameter("r1");
              String Button = request.getParameter("button");
              String Department = (String)sess.getAttribute("Department");
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
                        stmt.executeUpdate("delete from query_info where Token_id = '"+Value+"' " );
                        RequestDispatcher view =  request.getRequestDispatcher("AdminAnsweredQuery.jsp");
                        view.forward(request,response);
                      }                                             
                    
                 else if(Button.equals("Cancel"))
                   {               
                      RequestDispatcher view =  request.getRequestDispatcher("admindashboard.jsp");
                      view.forward(request,response);
                     }
                  else if(Button.equals("Add To Faq"))
                   {    
                      stmt.executeUpdate("update query_info set FAQ = 'checked' where Token_id = '"+Value+"'");
                      RequestDispatcher view =  request.getRequestDispatcher("AdminAnsweredQuery.jsp");
                      view.forward(request,response);
                     }
                  
                  else if(Button.equals("ViewQuery"))
                   {               
                      rs = stmt.executeQuery("select query,Query_Fwd_date,Query_Answer,Emp_Id,Query_Reply_Date,Replied_By,dept_name from user_query ,query_info where user_query.token_id = query_info.Token_id");                
                      sess.setAttribute("rs",rs);
                      RequestDispatcher view =  request.getRequestDispatcher("AdminAnsweredQuery.jsp");
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
          
                