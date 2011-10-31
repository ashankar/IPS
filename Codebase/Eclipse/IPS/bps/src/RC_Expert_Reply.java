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

public class RC_Expert_Reply extends HttpServlet
   {
       public void doPost(HttpServletRequest request,HttpServletResponse response)
                    throws IOException,ServletException
             {
              response.setContentType("text/html");
              PrintWriter out = response.getWriter();
              HttpSession sess = request.getSession();
              String Token = request.getParameter("r1");
              String Query = request.getParameter("Query_Reply");
              String Button = request.getParameter("button");
              String User = (String)sess.getAttribute("User");
              String User22 = (String)sess.getAttribute("User22");
              String Emp_Id = (String)sess.getAttribute("Emp_Id");
              Calendar cal = Calendar.getInstance();                
              int day=cal.get(Calendar.DATE);
              int month = cal.get(Calendar.MONTH) + 1;
              int year = cal.get(Calendar.YEAR);
              String Date = day+"/"+month+"/"+year;
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
                      RequestDispatcher view =  request.getRequestDispatcher("RCExpertDashboard.jsp");
                      view.forward(request,response);
                     }
                  
                   else if(Button.equals("PostReply"))
                   {   
                      String sql = "update query_info set Query_Answer = '"+Query+"',Query_Reply_Date = str_to_date('"+Date+"','%d/%m/%Y'),Replied_By = '"+User22+"',Query_Status = 'Replied',Emp_id = '"+Emp_Id+"',FAQ = 'unchecked' where Token_id = '"+Token+"'";
                      stmt.executeUpdate(sql);
                      RequestDispatcher view =  request.getRequestDispatcher("RC_Expert_Reply.jsp");
                      view.forward(request,response);
                     }
                  
                  else if(Button.equals("ViewQuery"))
                   {               
                      rs = stmt.executeQuery("select *from user_query where token_id = '"+Token+"'");
                      sess.setAttribute("rs",rs);                          
                      RequestDispatcher view =  request.getRequestDispatcher("RC_Expert_Reply.jsp");
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
          
                