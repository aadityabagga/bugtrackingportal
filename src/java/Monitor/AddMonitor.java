/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Monitor;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
public class AddMonitor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            HttpSession ses=request.getSession(false);
            String name=(String)ses.getAttribute("uname");
            if(name==null)
            {
                request.setAttribute("msg","<i>You are not currently logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
            else
            {
            String un=request.getParameter("nm");
            String p=request.getParameter("pwd");
            
            Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugportal","root","password");
           PreparedStatement pst=con.prepareStatement("insert into monitors(username,password) values(?,?)");
           pst.setString(1, un);
           pst.setString(2, p);
           int status=pst.executeUpdate();
           if(status>0)
               request.setAttribute("msg","Monitor Added Successfully!");
           else
               request.setAttribute("msg","Monitor Couldnt be added");
           
           RequestDispatcher disp=getServletContext().getRequestDispatcher("/AddNewMonitor.jsp");
           disp.forward(request, response);
            
            }
        }
        catch(Exception e)
        {
            out.println(e);
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
