/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Consumer;

import static Common.DatabaseConnect.DatabaseConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author aaditya
 */
public class ViewAllBugs extends HttpServlet
{

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher disp=null;
        try
        {
            HttpSession ses=request.getSession(false);
            String pb=(String)ses.getAttribute("uname");
        
            String message=(String)request.getAttribute("msg");
            request.setAttribute("msg", message);
            
            
            Connection con = DatabaseConnect();
        
            String query="Select * from bugs where posted_by=?";
        
            PreparedStatement pst=con.prepareStatement(query);
            pst.setString(1,pb);
            ResultSet rs=pst.executeQuery();
            request.setAttribute("bugs",rs);
            disp=getServletContext().getRequestDispatcher("/ViewAllBugsConsumer.jsp");
            
            String path=request.getParameter("state");
            request.setAttribute("path", path);
            
            disp.forward(request,response);
         }
         catch(Exception e)
         {
             response.sendRedirect("Login.jsp?msg=Login Authentication Failed");
             
         }
        finally
        {
            out.close();
            
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
