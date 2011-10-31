
package ignou.aciil.ips;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.disk.*;
import javax.naming.*;
import javax.sql.*;

public class Upload  {

     private Hashtable h=null;
     private String Token=null,path=null,filename=null,type=null,conttype=null,mpname=null;
     private InputStream is=null;
     private int size=0;
     

    public  Hashtable setRequest(HttpServletRequest request)
    throws ServletException, IOException {
        path=request.getRealPath("temp");
        h=new Hashtable();
           try{


                  Random rm = new Random();
                 int randnum = rm.nextInt(999999999);
                 Token = Integer.toString(randnum);
                 


                  if(ServletFileUpload.isMultipartContent(request))
                  {

                    FileItemFactory factory=new DiskFileItemFactory();
                    ServletFileUpload upload=new ServletFileUpload(factory);
                    List fileItem=upload.parseRequest(request);
                    Iterator itr= fileItem.iterator();

                      while(itr.hasNext())
                      {
                          FileItem fi=(FileItem)itr.next();
                          if(fi.isFormField())
                          {
                              h.put(fi.getFieldName(), fi.getString());

                              if( fi.getFieldName().equals("department"))
                                {
                                     Token=fi.getString()+Token;
                                     Token=Token.trim();
                                      
                                }
                          }
                          else
                          {

                              if(!fi.getName().equals(""))
                              {
                                                              
                                    this.fileField(fi);
                                   
                              }
                              else
                              {
                                  this.storeBlank();
                              }
                          }

                      }
                    h.put("Token", Token);
                    
                    
                  }
              }
              catch(Exception me)
              {

              }

    return (h);
    }


    private void fileField(FileItem fi)throws IOException
    {
        filename=fi.getName();
       StringTokenizer st=new StringTokenizer(filename,".");
        Vector v=new Vector();
        
           while (st.hasMoreTokens())
            {
                v.addElement(st.nextToken());
            }
        type=(String)v.lastElement();


        is=fi.getInputStream();
        size=is.available();
        conttype=fi.getContentType();
        
        try {
            mpname=Token+"."+type;
            File file = new File(this.path+"/"+mpname);
            FileOutputStream fos =new FileOutputStream(file);
            for (int i = 0; i <size; i++) {

                fos.write(is.read());
                
               }

            fos.close();
            this.storeDB();

        } catch (Exception e) {
        }

    }

    private void storeDB()
    {
        DataSource ds = null;
              try {
               ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
              }
              catch(NamingException e)
              { }
Connection con=null;
        try {

            
             con=ds.getConnection();
            PreparedStatement ps=con.prepareStatement("insert into uploads (UPLOADID,FILENAME,BINARYFILE,FILETYPE,FILESIZE,MAPEDNAME) values (?,?,?,?,?,?)");
            ps.setString(1, Token);
            ps.setString(2, filename);
            ps.setBinaryStream(3,is,size);
            ps.setString(4, conttype);
            ps.setInt(5, size);
            ps.setString(6, mpname);
            ps.executeUpdate();



        } catch (Exception e) {
        } finally { try {

                   con.close();

                  } catch (Exception e) {
                  }
                }
    }

    private void storeBlank()
    {
        Connection con=null;
        try {
            
            is=new FileInputStream(path+"/"+"abc.txt");
            size=is.available();
            mpname=Token+"."+"txt";
            File file = new File(this.path+"/"+mpname);
            FileOutputStream fos =new FileOutputStream(file);
            for (int i = 0; i <size; i++) {

                fos.write(is.read());

               }

            fos.close();

            
            DataSource ds = null;
              try {
               ds = (DataSource)new InitialContext().lookup("jdbc/ipsDB");
              }
              catch(NamingException e)
              { }
          
            con=ds.getConnection();
            PreparedStatement ps=con.prepareStatement("insert into uploads (UPLOADID,FILENAME,BINARYFILE,FILETYPE,FILESIZE,MAPEDNAME) values (?,?,?,?,?,?)");
            ps.setString(1, Token);
            ps.setString(2, "default.txt");
            ps.setBinaryStream(3,is,size);
            ps.setString(4, "N/F");
            ps.setInt(5, size);
            ps.setString(6, "default.txt");
            ps.executeUpdate();



        } catch (Exception e) {
        } finally { try {

                   con.close();

                  } catch (Exception e) {
                  }
                }

    }


}
