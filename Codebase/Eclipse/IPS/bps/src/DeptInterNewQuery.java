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

public class DeptInterNewQuery extends HttpServlet
   {
       public void doPost(HttpServletRequest request,HttpServletResponse response)
                    throws IOException,ServletException
             {
              response.setContentType("text/html");
              PrintWriter out = response.getWriter();
              HttpSession sess = request.getSession();
              String Token = request.getParameter("r1");
              String Dept = request.getParameter("Dept");
              String Button = request.getParameter("button");
              String User = (String)sess.getAttribute("User");
              String Emp_Id = (String)sess.getAttribute("Emp_Id");
              Calendar cal = Calendar.getInstance();                
              int day=cal.get(Calendar.DATE);
              int month = cal.get(Calendar.MONTH) + 1;
              int year = cal.get(Calendar.YEAR);    
              String Date = year+"/"+month+"/"+day;
              Statement stmt = null;
              ResultSet rs = null;
              Connection conn = null;
              DataSource ds = null;
              try 
              {
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
                        stmt.executeUpdate("delete from dept_query where Token_id = '"+Token+"' " );
                        RequestDispatcher view =  request.getRequestDispatcher("DeptInterNewQuery.jsp");
                        view.forward(request,response);
                      }                                             
                    
                 else if(Button.equals("Cancel"))
                   {               
                      RequestDispatcher view =  request.getRequestDispatcher("deptdashboard.jsp");
                      view.forward(request,response);
                     }
                  
                   else if(Button.equals("ForwardQuery"))
                   {  
                       stmt.executeUpdate("update dept_query set Dept_To = '"+Dept+"',status = 'New' where Token_id = '"+Token+"'");
                       RequestDispatcher view =  request.getRequestDispatcher("DeptInterNewQuery.jsp");
                      view.forward(request,response);
                     }
                  
                  else if(Button.equals("ViewQuery"))
                   {               
                      rs = stmt.executeQuery("select *from dept_query where Token_id = '"+Token+"'");
                      sess.setAttribute("rs",rs);                          
                      RequestDispatcher view =  request.getRequestDispatcher("DeptInterNewQuery.jsp");
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
          
                