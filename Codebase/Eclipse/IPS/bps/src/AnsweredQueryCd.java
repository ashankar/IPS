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


/**
 *
 * @author anand
 */




public class AnsweredQueryCd extends HttpServlet
   {
       public void doPost(HttpServletRequest request,HttpServletResponse response)
                    throws IOException,ServletException
             {
              response.setContentType("text/html");
              HttpSession sess = request.getSession();
               PrintWriter out = response.getWriter();
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
                        String sql = "update query_info set Query_Status = 'Deleted' where Token_id = '"+Value+"'";
                        String sql2 = "update user_query set status = 'Deleted' where token_id = '"+Value+"'";
                        stmt.executeUpdate(sql);
                        stmt.executeUpdate(sql2);
                        RequestDispatcher view =  request.getRequestDispatcher("AnsweredQueryCd.jsp");
                        view.forward(request,response);
                      }

                 else if(Button.equals("Cancel"))
                   {
                      RequestDispatcher view =  request.getRequestDispatcher("cdhome.jsp");
                      view.forward(request,response);
                     }
                  else if(Button.equals("Add to FAQ"))
                   {
                      stmt.executeUpdate("update query_info set FAQ ='checked' where Token_id = '"+Value+"'");
                      RequestDispatcher view =  request.getRequestDispatcher("AnsweredQueryCd.jsp");
                      view.forward(request,response);

                     }

                  else if(Button.equals("ViewQuery"))
                   {
                      rs = stmt.executeQuery("select *from query_info where Token_id = '"+Value+"'");
                      sess.setAttribute("rs",rs);
                      RequestDispatcher view =  request.getRequestDispatcher("AnsweredQueryCd.jsp");
                      view.forward(request,response);
                     }
               }
               catch (SQLException e) {

               // out.print(e);
               } finally { try {

                   conn.close();

                  } catch (Exception e) {
                  }
                }
       }
}
