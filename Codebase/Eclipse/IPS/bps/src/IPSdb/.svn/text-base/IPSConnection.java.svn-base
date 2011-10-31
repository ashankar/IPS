package IPSdb;
import java.sql.Connection;
import java.sql.DriverManager;


public class IPSConnection
{

   public Connection getConnection()
    {
        Connection conn = null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/qmsdb", "ipsuser", "all4ips2execute");
        }
        catch(Exception e) { }
        return conn;
    }
}
