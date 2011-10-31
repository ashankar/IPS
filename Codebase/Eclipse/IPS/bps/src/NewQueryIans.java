
/**
 *
 * @author Anand Shankar
 */

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

public class NewQueryIans extends HttpServlet
   {
       public void doPost(HttpServletRequest request,HttpServletResponse response)
                    throws IOException,ServletException
             {

              response.setContentType("text/html");
              PrintWriter out = response.getWriter();
              HttpSession sess = request.getSession();
              String Token = request.getParameter("r1");
              String RC = request.getParameter("Rc");
              String Expert = request.getParameter("Expert");
              String Query = request.getParameter("Query_Reply");
              String Button = request.getParameter("button");
              String Department = (String)sess.getAttribute("Department");
              String User = (String)sess.getAttribute("User");
              String User22 = (String)sess.getAttribute("User22");
              String Emp_Id = (String)sess.getAttribute("Emp_Id");
              String Time2 = (String)sess.getAttribute("time");
              String page = request.getQueryString();
              double Time = Double.parseDouble(Time2);
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
              if(Button.equals("DeleteQuery"))
              {
              String sql = "update user_query set status = 'Deleted' where token_id = '"+Token+"'";
              stmt.executeUpdate(sql);
              RequestDispatcher view =  request.getRequestDispatcher("NewQueryIans.jsp");
              view.forward(request,response);
              }
              else if(Button.equals("Cancel"))
              {
              RequestDispatcher view =  request.getRequestDispatcher("ianshome.jsp");
              view.forward(request,response);
              }
              else if(Button.equals("ForwardQuery"))
              {
              if(Expert.equals("admin"))
              {
              stmt.executeUpdate("update user_query set department = 'admin',status = 'Forwarded' where token_id = '"+Token+"'");
              }
              else if(Expert.equals("rc_coord"))
              {
              stmt.executeUpdate("insert into query_info(Token_id,Query_Fwd_date,dept_name,Query_Status,Query_Fwd_To,Time)values('"+Token+"',str_to_date('"+Date+"','%d/%m/%Y'),'"+RC+"','RC_Forwarded','"+RC+"','"+Time+"')");
              stmt.executeUpdate("update user_query set department = '"+RC+"',status = 'RC_Forwarded' where token_id = '"+Token+"'");
              }

               else if(Expert.equals("SSC"))
              {
              stmt.executeUpdate("insert into query_info(Token_id,Query_Fwd_date,dept_name,Query_Status,Query_Fwd_To,Time,querytype)values('"+Token+"',str_to_date('"+Date+"','%d/%m/%Y'),'"+Department+"','Forwarded to SSC','"+Expert+"','"+Time+"', 'Administrative')");
              stmt.executeUpdate("update user_query set status = 'Forwarded to SSC', querytype='Administrative' where token_id = '"+Token+"' ");
              }

              else if(Expert.equals("IANS"))
              {
              stmt.executeUpdate("insert into query_info(Token_id,Query_Fwd_date,dept_name,Query_Status,Query_Fwd_To,Time,querytype)values('"+Token+"',str_to_date('"+Date+"','%d/%m/%Y'),'"+Department+"','Forwarded to IANS','"+Expert+"','"+Time+"', 'Administrative')");
              stmt.executeUpdate("update user_query set status = 'Forwarded to IANS', querytype='Administrative' where token_id = '"+Token+"' ");
              }

              else
              {
              stmt.executeUpdate("insert into query_info(Token_id,Query_Fwd_date,dept_name,Query_Status,Query_Fwd_To,Time)values('"+Token+"',str_to_date('"+Date+"','%d/%m/%Y'),'"+Department+"','Expert_Forwarded','"+Expert+"','"+Time+"')");
              stmt.executeUpdate("update user_query set status = 'Expert_Forwarded' where token_id = '"+Token+"' ");
              }
              RequestDispatcher view =  request.getRequestDispatcher("NewQueryIans.jsp");
              view.forward(request,response);
              }

              else if(Button.equals("ViewQuery"))
              {
              String sql2 = "select *from user_query where token_id = '"+Token+"'";
              rs = stmt.executeQuery(sql2);
              sess.setAttribute("rs",rs);
              RequestDispatcher view =  request.getRequestDispatcher("NewQueryIans.jsp");
              view.forward(request,response);
              }
               
              else if(Button.equals("Post_Reply"))
              {
              stmt.executeUpdate("update query_info set Query_Answer='"+Query+"', Query_Reply_Date=str_to_date('"+Date+"','%d/%m/%Y'), Replied_By='"+User+"', dept_name='"+Department+"', Query_Status='Replied', Emp_Id='"+Emp_Id+"', Time='"+Time+"' where token_id = '"+Token+"'");
              stmt.executeUpdate("update user_query set status = 'Replied' where token_id = '"+Token+"'");
              RequestDispatcher view =  request.getRequestDispatcher("NewQueryIans.jsp");
              view.forward(request,response);
              }
              }
               catch (SQLException e) {
               //out.print(e);
               } finally { try {

                   conn.close();

                  } catch (Exception e) {
                      //out.print(e);
                  }
  }

       }
}

