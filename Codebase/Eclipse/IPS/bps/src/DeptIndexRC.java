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
import ignou.aciil.ips.*;

public class DeptIndexRC extends HttpServlet
   {
       public void doPost(HttpServletRequest request,HttpServletResponse response)
                    throws IOException,ServletException
             {
              response.setContentType("text/html");
              PrintWriter out = response.getWriter();
              HttpSession sess = request.getSession();
              CentralControl cc = new CentralControl();
              Hashtable hs=cc.processRequest(request, response);
              String name,Emp_id,deptFrom,deptTo,Subject,query,date,region;
              String sql = null;
            
           name=(String)hs.get("name");
           region=(String)hs.get("region"); 
           Emp_id=(String)hs.get("emp_id");
           deptFrom=(String)hs.get("deptFrom");
           String ip_address = request.getRemoteAddr();
           deptTo=(String)hs.get("deptTo");
           Subject = (String)hs.get("Subject");
           query=(String)hs.get("query");
           date = (String)hs.get("CDate");
           Calendar cal = Calendar.getInstance(); 
           double millisec = cal.getTimeInMillis();
           String Token = (String)hs.get("Token");
           int result = 0;
                                        
       sess.setAttribute("Token",Token);

   if(name.equals("") || Emp_id.equals("") || deptFrom.equals("") || Subject.equals("") || date.equals("") || query.equals(""))
      {
      RequestDispatcher view =  request.getRequestDispatcher("DeptIndex.jsp");
      view.forward(request,response); 
      }
         else
             {  
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
             if(region.equals(""))
              {
               sql = "insert into dept_query values('"+Token+"','"+name+"','"+deptFrom+"','"+deptTo+"','"+Subject+"','"+query+"',str_to_date('"+date+"','%d/%m/%Y'),'"+Emp_id+"','"+ip_address+"','New','"+millisec+"')";
               }
             else
              {
               sql = "insert into dept_query values('"+Token+"','"+name+"','"+deptFrom+"','"+region+"','"+Subject+"','"+query+"',str_to_date('"+date+"','%d/%m/%Y'),'"+Emp_id+"','"+ip_address+"','New','"+millisec+"')";
                }
            result = stmt.executeUpdate(sql);
            if(result>0)
              {
                  response.sendRedirect("DeptRCAckQuery.jsp");
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
    }
   