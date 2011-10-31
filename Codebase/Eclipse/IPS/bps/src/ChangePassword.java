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

public class ChangePassword extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sess = request.getSession();
        String CPassword = request.getParameter("CPassword");
        String NPassword = request.getParameter("NPassword");
        String CFPassword = request.getParameter("CFPassword");
        String Department = (String)sess.getAttribute("Department");
        String Emp_Id = (String)sess.getAttribute("Emp_Id");
       
        if(CPassword.equals("")||NPassword.equals("")||CFPassword.equals(""))
          {
         RequestDispatcher view =  request.getRequestDispatcher("ChangePassword.jsp");
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
              int result = stmt.executeUpdate("update login set Password = '"+NPassword+"' where Password = '"+CPassword+"' and Emp_id = '"+Emp_Id+"' and Department = '"+Department+"'");
           if(result>0)
            {
              sess.setAttribute("NPassword",NPassword);
              RequestDispatcher view =  request.getRequestDispatcher("AckPassword.jsp");
              view.forward(request,response); 
            } 
            else
             {
               String message = "You Have Entered Wrong Credentials";
               sess.setAttribute("message",message);
               RequestDispatcher view =  request.getRequestDispatcher("ChangePassword.jsp");
              view.forward(request,response); 
            }                         
             
           }
           
         catch(SQLException e)
             {
             e.printStackTrace();
             } finally { try {

                   conn.close();

                  } catch (Exception e) {
                  }
  }
        }        
    } 
}

