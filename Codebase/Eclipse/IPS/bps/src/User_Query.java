import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.Connection;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import javax.naming.NamingException;
import ignou.aciil.ips.*;

public class User_Query extends HttpServlet
   {
       public void doPost(HttpServletRequest request,HttpServletResponse response)
                    throws IOException,ServletException
             {
              response.setContentType("text/html");
              PrintWriter out = response.getWriter();
              HttpSession sess = request.getSession();
              CentralControl cc = new CentralControl();
              Hashtable hs=cc.processRequest(request, response);
                 
            String name=null,email_id=null, mobile="", studycenter=null,region=null,ip_address=null,subject=null,department=null,query=null;
            String date=null, e_no=null, Program=null, querytype=null;

            
           
if(hs.containsKey("name"))
{
name=(String)hs.get("name");
}
else
{
    name="N/F";
}
            if(hs.containsKey("email_id"))
            {
           email_id=(String)hs.get("email_id");
            }
            else
            {
                email_id="N/F";
            }
            if(hs.containsKey("mobile"))
            {
           mobile=(String)hs.get("mobile");
            }
            else
            {
                mobile="N/A";
            }
            if(hs.containsKey("studycenter"))
            {
            studycenter= "SC"+" "+ (String)hs.get("studycenter");
            }
            else
            {
                studycenter="N/A";
            }

            if(hs.containsKey("region"))
            {
            region=(String)hs.get("region");
            }
            else
            {
                region="N/A";
            }
ip_address=request.getRemoteAddr();

if(hs.containsKey("subject"))
{
subject=(String)hs.get("subject");
}
else
{
    subject="N/F";
}

if(hs.containsKey("department"))
{
department=(String)hs.get("department");
}
else
{
    department="N/F";
}

if(hs.containsKey("query"))
{
query=(String)hs.get("query");
}
else
{
    query="N/F";
}

if(hs.containsKey("e_no"))
{
    e_no=(String)hs.get("e_no");
}
else
{
    e_no="N/A";
}

if(hs.containsKey("Program"))
{
    Program=(String)hs.get("Program");
}
else
{
    Program="N/F";
}

if(hs.containsKey("querytype"))
{
    querytype=(String)hs.get("querytype");
}
else
{
    querytype="N/F";
}

Calendar cal = Calendar.getInstance();                
int day=cal.get(Calendar.DATE);
int month = cal.get(Calendar.MONTH) + 1;
int year = cal.get(Calendar.YEAR);
int hour24 = cal.get(Calendar.HOUR_OF_DAY);      
int min = cal.get(Calendar.MINUTE);            
double millisec = cal.getTimeInMillis();
date = day+"/"+month+"/"+year;   
String Token=null;
if(hs.containsKey("Token"))
{
Token =(String)hs.get("Token");
}
else
{
    Token="N/F";
}
int result = 0;



sess.setAttribute("Token",Token);

if(name.equals("N/F")||email_id.equals("N/F")||subject.equals("N/F")||department.equals("N/F")||query.equals("N/F"))
      {
      RequestDispatcher view =  request.getRequestDispatcher("index.jsp");
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
              { //out.print(e);
              }
              try
              {
              conn = ds.getConnection();                                                  
              stmt = conn.createStatement();
              result = stmt.executeUpdate("insert into user_query (token_id, name, email_id, study_centre, region, ip_address, querytype, subject, department, query, date, time, status, e_no, program, mobile) values('"+Token+"','"+name+"','"+email_id+"','"+studycenter+"','"+region+"','"+ip_address+"','"+querytype+"','"+subject+"','"+department+"','"+query+"',str_to_date('"+date+"','%d/%m/%Y'),'"+millisec+"','New','"+e_no+"', '"+Program+"','"+mobile+"')");
              if(result>0)
              {
                  //RequestDispatcher rd = request.getRequestDispatcher("SendMail");
                  //rd.forward(request,response);
                  RequestDispatcher rd = request.getRequestDispatcher("Ack_Query.jsp");
                  rd.forward(request,response);

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
   }
