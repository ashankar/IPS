package ignou.aciil.ips;
import java.sql.*;
import java.io.*;
import javax.sql.*;
import javax.naming.*;

public class DownloadFile {
    private String token=null, path=null;

    public DownloadFile()
    {

    }

    public DownloadFile(String token, String path)
    {
        this.token=token;
        this.path=path;
    }

    public void setToken(String token)
    {
        this.token=token;

    }

    public void setPath(String path)
    {
      
        this.path=path;
    }

    public void getConnection()
    {
        DataSource ds = null;
              try {
               ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
              }
              catch(NamingException e)
              { }

        try {

             Connection con=ds.getConnection();
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select BINARYFILE, FILENAME from uploads where UPLOADID='"+token+"'");
            byte[]bg=null;
            String filename=null;
            while(rs.next())
            {
                filename=rs.getString("FILENAME");
                bg=rs.getBytes("BINARYFILE");

            }

            File file = new File(path+"/"+filename);

            FileOutputStream fos =new FileOutputStream(file);
            for (int i = 0; i <bg.length; i++) {

                fos.write(bg[i]);
            }
            con.close();

        } catch (Exception e) {
        }
    }

}
