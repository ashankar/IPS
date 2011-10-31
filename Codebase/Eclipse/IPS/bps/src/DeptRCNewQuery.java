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


public class DeptRCNewQuery extends HttpServlet
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
              String sql = "delete from dept_query where Token_id ='"+Token+"'";            
              stmt.executeUpdate(sql);
              RequestDispatcher view =  request.getRequestDispatcher("DeptRCNewQuery.jsp");
              view.forward(request,response);
              }                                             
                    
              else if(Button.equals("Cancel"))
              {               
              RequestDispatcher view =  request.getRequestDispatcher("DeptRCDashboard.jsp");
              view.forward(request,response);
              }
                  
              else if(Button.equals("ForwardQuery"))
              {  
              if(Expert.equals("admin"))
              {
              stmt.executeUpdate("update dept_query set Dept_To = 'admin',status = 'Forwarded' where Token_id = '"+Token+"'");
              }
              else
              {
              stmt.executeUpdate("insert into deptqueryinfo(TokenId,QueryFwdDate,DeptName,QueryStatus,QueryFwdTo,Time)values('"+Token+"',str_to_date('"+Date+"','%d/%m/%Y'),'"+Department+"','RC_Expert_Forwarded','"+Expert+"','"+Time+"')");
              stmt.executeUpdate("update dept_query set status = 'Forwarded' where Token_id = '"+Token+"' "); 
              }
              RequestDispatcher view =  request.getRequestDispatcher("DeptRCNewQuery.jsp");
              view.forward(request,response);
              }
                  
              else if(Button.equals("ViewQuery"))
              {             
              String sql2 = "select *from dept_query where Token_id = '"+Token+"'";
              rs = stmt.executeQuery(sql2);
              sess.setAttribute("rs",rs);                          
              RequestDispatcher view =  request.getRequestDispatcher("DeptRCNewQuery.jsp");
              view.forward(request,response);
              }
              else if(Button.equals("Post_Reply"))
              {   
              stmt.executeUpdate("insert into deptqueryinfo(TokenId,QueryFwdDate,QueryAnswer,QueryReplyDate,RepliedBy,DeptName,QueryStatus,EmpId,Time)values('"+Token+"',str_to_date('"+Date+"','%d/%m/%Y'),'"+Query+"',str_to_date('"+Date+"','%d/%m/%Y'),'"+User22+"','"+Department+"','Replied','"+Emp_Id+"','"+Time+"')");
              stmt.executeUpdate("update dept_query set status = 'Forwarded' where Token_id = '"+Token+"'");                    
              RequestDispatcher view =  request.getRequestDispatcher("DeptRCNewQuery.jsp");
              view.forward(request,response);    
              }      
              }
               catch (SQLException e) {
               e.printStackTrace();
               }  finally { try {

                   conn.close();

                  } catch (Exception e) {
                  }
  }
       }
}
          
                