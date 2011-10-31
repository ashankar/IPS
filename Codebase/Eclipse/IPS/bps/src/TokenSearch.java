import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;


public class TokenSearch extends HttpServlet
   {
    
       public void doPost(HttpServletRequest request,HttpServletResponse response)
                    throws IOException,ServletException
             {
              response.setContentType("text/html");
              PrintWriter out = response.getWriter();
              
              HttpSession sess = request.getSession();
             String Token = request.getParameter("T_No1");
             sess.setAttribute("Token",Token);
             String Name = request.getParameter("T_No2");
              sess.setAttribute("Name",Name);
             String abc="null";
              String tokennew="null";
              String Button1 = request.getParameter("Button1");
              if(Button1==null)
                  Button1="no";
              String Button2 = request.getParameter("Button2");
              if(Button2==null)
                  Button2="no";

            DataSource ds = null;
              try {
               ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
              }
              catch(NamingException e)
              { }
            Connection conn=null;
          try
               {
                 conn = ds.getConnection(); 
                  Statement stmt = conn.createStatement();
                  ResultSet rs1 = stmt.executeQuery("select * from user_query");
                               
                  if(Button1.equals("Submit Token")||Button2.equals("Submit Name"))
                   {
                      
                      while (rs1.next())
                      {
             
                       if(Token.equals(rs1.getString(1))||Name.equalsIgnoreCase(rs1.getString(2)))
                       {
                                if(rs1.getString(12).equals("New"))
                                {
                                   abc="new";   
                                   tokennew=rs1.getString(1);
                                }
                       }                       
                      }
                      sess.setAttribute("abc", abc);
                      sess.setAttribute("tokennew",tokennew);
                      
                      ResultSet rs = stmt.executeQuery("select user_query.token_id,user_query.name,user_query.query ,query_info.Query_Answer,query_info.Query_Reply_Date,query_info.Replied_By from user_query inner join query_info on user_query.token_id=query_info.Token_id");
                      sess.setAttribute("rs",rs);
                      RequestDispatcher view =  request.getRequestDispatcher("TokenSearch.jsp");
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

