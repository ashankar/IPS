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

public class NewQueryRC extends HttpServlet
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
                            
                        stmt.executeUpdate("update user_query set status = 'Deleted' where token_id ='"+Token+"'");
                        stmt.executeUpdate("update query_info set Query_Status = 'Deleted' where Token_id ='"+Token+"'");
                        RequestDispatcher view =  request.getRequestDispatcher("NewQueryRC.jsp");
                        view.forward(request,response);
                      }                                             
                    
                   else if(Button.equals("Cancel"))
                     {               
                      RequestDispatcher view =  request.getRequestDispatcher("regional_dashboard.jsp");
                      view.forward(request,response);
                       }
                  
                     else if(Button.equals("ForwardQuery"))
                      {  
                       if(Expert.equals("admin"))
                         {
                          stmt.executeUpdate("update user_query set department = 'admin',status = 'Forwarded' where token_id = '"+Token+"'");
                          }
                        else 
                         {
                           stmt.executeUpdate("update query_info set Query_Fwd_date = str_to_date('"+Date+"','%d/%m/%Y'),dept_name = '"+RC+"',Query_Status = 'RC_Expert_Forwarded',Query_Fwd_To = '"+Expert+"',Time = '"+Time+"' where Token_id = '"+Token+"'");
                          stmt.executeUpdate("update user_query set department = '"+RC+"',status = 'RC_Expert_Forwarded' where token_id = '"+Token+"'");
                          }
                         RequestDispatcher view =  request.getRequestDispatcher("NewQueryRC.jsp");
                         view.forward(request,response);
                     }
                  
                  
                  else if(Button.equals("ViewQuery"))
                   {             
                      String sql2 = "select *from user_query where token_id = '"+Token+"'";
                      rs = stmt.executeQuery(sql2);
                      sess.setAttribute("rs",rs);                          
                      RequestDispatcher view =  request.getRequestDispatcher("NewQueryRC.jsp");
                      view.forward(request,response);
                     }
                  else if(Button.equals("Post_Reply"))
                   {   
                      
                     stmt.executeUpdate("update query_info set Query_Fwd_date = str_to_date('"+Date+"','%d/%m/%Y'),Query_Answer = '"+Query+"',Query_Reply_Date = str_to_date('"+Date+"','%d/%m/%Y'),Replied_By = '"+User22+"',dept_name = '"+RC+"',Query_Status = 'Replied',Emp_Id = '"+Emp_Id+"',FAQ = 'Unchecked',Query_Fwd_To = 'Self',Time = '"+Time+"' where Token_id = '"+Token+"'");
                     stmt.executeUpdate("update user_query set status = 'Forwarded' where token_id = '"+Token+"'");    
                     RequestDispatcher view =  request.getRequestDispatcher("NewQueryRC.jsp");
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
          
                