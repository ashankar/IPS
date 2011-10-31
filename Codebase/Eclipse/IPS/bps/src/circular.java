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



public class circular extends HttpServlet {
    
    
     public void doPost(HttpServletRequest request,HttpServletResponse response)
                    throws IOException,ServletException
     {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            HttpSession sess = request.getSession();
            CentralControl cc = new CentralControl();
            Hashtable hs=cc.processRequest(request, response);
            String Token,name,circular,email_id,subject,department,department1,query,attach;
            String date,issued_by;
            issued_by=(String)hs.get("issued_by");
            String s=(String)hs.get("moption");
            subject=(String)hs.get("subject");
            Token=(String)hs.get("Token");
            circular=(String)hs.get("circular");
            attach=(String)hs.get("file");
            Calendar cal = Calendar.getInstance();                
            int day=cal.get(Calendar.DATE);
            int month =cal.get(Calendar.MONTH) + 1;
            int year = cal.get(Calendar.YEAR);
            int hour24 = cal.get(Calendar.HOUR_OF_DAY);      
            int min = cal.get(Calendar.MINUTE);            
            double millisec = cal.getTimeInMillis();
            date =year+"-"+month+"-"+day;              
            int result = 0;
            int result1 = 0;
            sess.setAttribute("subject",subject);
            sess.setAttribute("date",date);
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
                        stmt=conn.createStatement();
                        result= stmt.executeUpdate("insert INTO circular (c_id,c_subject,c_description,c_date,issued_to,issued_by)values('"+Token+"','"+subject+"','"+circular+"',str_to_date('"+date+"','%d/%m/%Y'),'"+s+"','"+issued_by+"')");
                          
                        if(result>0 ||result1>0)
                        {
                             response.sendRedirect("Ack_circular.jsp");
                        } 
                        else
                        {
                            out.println("gogoggo");
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

   
   
