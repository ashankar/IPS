
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


public class LoginIans extends HttpServlet {

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

                     if(User_type.equals("ians"))
                          {
                            RequestDispatcher view =  request.getRequestDispatcher("ianshome.jsp");
                            view.forward(request,response);
                          }

                      }
                    else
                       {
                 String Fail = "Sorry ! Wrong UserName or Password,Retry !!!";
                 session.setAttribute("Fail",Fail);
                 RequestDispatcher view =  request.getRequestDispatcher("loginians.jsp");
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
