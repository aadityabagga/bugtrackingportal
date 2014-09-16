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
 * @author honey
 */
public class AddExpertLogic extends HttpServlet {

    
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
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
            else
            {
            String n=request.getParameter("usernm");
            String pw=request.getParameter("passwd");
            String e=request.getParameter("email");
            String c=request.getParameter("cno");
            String a=request.getParameter("addrs");
            String ct=request.getParameter("city");
            String d=request.getParameter("dom");
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugportal","root","password");
            PreparedStatement pst=con.prepareStatement("insert into experts(username,password,email,phone,address,city,domain) values(?,?,?,?,?,?,?)");
            
            RequestDispatcher disp=null;
            
            pst.setString(1, n);
            pst.setString(2, pw);
            pst.setString(3, e);
            pst.setString(4, c);
            pst.setString(5, a);
            pst.setString(6, ct);
            pst.setString(7, d);
            
            int status=pst.executeUpdate();
            
            if(status>0)
            {
                request.setAttribute("msg","Expert added Successfully!");
                
                disp=getServletContext().getRequestDispatcher("/ViewAllExperts.jsp");
            }
            else
            {
                out.println("Database couldnt be accessed");
            }
            
            disp.forward(request, response);
            
            
            
            }
        } 
        
        
        
        catch (Exception e) 
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
