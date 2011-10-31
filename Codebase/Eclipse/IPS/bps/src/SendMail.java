import java.util.Properties;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.*;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class SendMail extends HttpServlet
       {     
    public void doPost(HttpServletRequest request,HttpServletResponse response)
                    throws IOException,ServletException
         {
                response.setContentType("text/html");
                HttpSession sess = request.getSession();
                PrintWriter out = response.getWriter();
                String Token = (String)sess.getAttribute("Token"); 
                String name = null; 
                String To = null;               
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
                rs = stmt.executeQuery("select Name,email_id from user_query where token_id = '"+Token+"'");
                while(rs.next())
                 {
                  To = rs.getString(2);
                  name = "Dear"+"   "+ rs.getString(1);      
                  }
                }
               catch (SQLException e) {
               e.printStackTrace();
               }finally { try {

                   conn.close();

                  } catch (Exception e) {
                  }
  }
	        String From = "IPS@gmail.com";                
	        String subject = "IPS query confirmation";
	        String message = name + " Your query has been Sent to concerned Department. Your Token No is :" + "  " + Token + ". Please Keep this Token No for further correspondence. Thanks";			
                Properties props = new Properties();
		props.put("mail.smtp.host", "127.0.0.1");
		props.put("mail.smtp.port", "25");		
		Session mailSession = Session.getDefaultInstance(props);
		Message simpleMessage = new MimeMessage(mailSession);		
		InternetAddress fromAddress = null;
		InternetAddress toAddress = null;
		try {
			fromAddress = new InternetAddress(From);
			toAddress = new InternetAddress(To);
		    } 
                catch (AddressException e) 
                  {
			e.printStackTrace();
		  }
		
		try {
			simpleMessage.setFrom(fromAddress);
			simpleMessage.setRecipient(RecipientType.TO, toAddress);
			simpleMessage.setSubject(subject);
			simpleMessage.setText(message);
			Transport.send(simpleMessage);	
                        response.sendRedirect("Ack_Query.jsp"); 		
                      }
               catch (MessagingException e)
                    {
			e.printStackTrace();
		    }
	    }
      }

	


