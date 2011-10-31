
package ignou.aciil.ips;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 *
 * @author Anand Shankar
 */
public class CentralControl extends HttpServlet {
   
     public Hashtable processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Hashtable hs=new Hashtable();
        
        try {
            //HttpSession sess = request.getSession();
            hs=new Upload().setRequest(request);
            //sess.setAttribute("hs", hs);


                 /* DownloadFile df = new DownloadFile();
                  df.setPath(request.getRealPath("temp"));
                  df.setToken((String)hs.get("Token"));
                  df.getConnection();*/

                   }catch(Exception e)
                   {

                   }finally {
            
        }
        return (hs);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
