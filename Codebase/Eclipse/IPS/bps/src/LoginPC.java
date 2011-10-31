/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
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
/**
 *
 * @author Anand Shankar
 */
public class LoginPC extends HttpServlet {
   
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
      {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        PrintWriter out=response.getWriter();
        String password = request.getParameter("password");
        String usertype = request.getParameter("usertype");
        HttpSession session = request.getSession();
        Statement stmt = null;
              PreparedStatement pstmt = null;
              ResultSet rs = null;
              Connection conn = null;
              DataSource ds = null;
              try {
              ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
              }
              catch(NamingException e)
              { out.print(e); }
              try
              {
              conn = ds.getConnection();
            String sql = "select * from login where Username = ? && Password = binary(?) && User_Type = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,username);
            pstmt.setString(2,password);
            pstmt.setString(3,usertype);
            rs = pstmt.executeQuery();

            if(rs.next())
                 {
                     String User_type = rs.getString(3);
                     session.setAttribute("Emp_Id",(String)rs.getString(1));
                     session.setAttribute("User",(String)rs.getString(4));
                     session.setAttribute("Department",(String)rs.getString(2));

                     if(User_type.equals("ssc"))
                          {
                            RequestDispatcher view =  request.getRequestDispatcher("sscdashboard.jsp");
                            view.forward(request,response);
                          }

                     if(User_type.equals("pqa"))
                          {
                            RequestDispatcher view =  request.getRequestDispatcher("qadashboard.jsp");
                            view.forward(request,response);
                          }
                     if(User_type.equals("pc"))
                          {
                            RequestDispatcher view =  request.getRequestDispatcher("pcdashboard.jsp");
                            view.forward(request,response);
                          }

                     else if(User_type.equals("cc"))
                          {
                           RequestDispatcher view =  request.getRequestDispatcher("ccdashboard.jsp");
                           view.forward(request,response);
                          }
                     else if(User_type.equals("coun"))
                          {
                           RequestDispatcher view =  request.getRequestDispatcher("coundashboard.jsp");
                           view.forward(request,response);
                          }

                     else if(User_type.equals("ws"))
                          {
                           RequestDispatcher view =  request.getRequestDispatcher("cdhome.jsp");
                           view.forward(request,response);
                          }

                       }
                    else
                       {
                 String Fail = "Sorry ! Wrong UserName or Password,Retry !!!";
                 session.setAttribute("Fail",Fail);
                 RequestDispatcher view =  request.getRequestDispatcher("LoginPC.jsp");
                 view.forward(request,response);
               }
            }


              catch (SQLException e) {
               out.print(e);
               } finally { try {

                   conn.close();

                  } catch (Exception e) {
                  }
  }
   }
}
