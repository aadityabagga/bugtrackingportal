/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Consumer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author aaditya
 */
public class EnterIntoConsumerDB extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            
            String n=request.getParameter("usernm");
            String pw=request.getParameter("passwd");
            String e=request.getParameter("email");
            String c=request.getParameter("cno");
            String a=request.getParameter("addrs");
            String ct=request.getParameter("city");
            String s=request.getParameter("sex");
            String d=request.getParameter("dob");
            
                    Date dt=new Date();

            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugportal","root","password");
            PreparedStatement pst=con.prepareStatement("insert into consumers(username,password,email,phone,address,city,gender,dob,joined_on) values(?,?,?,?,?,?,?,?,?)");
            
            RequestDispatcher disp=null;
            
            pst.setString(1, n);
            pst.setString(2, pw);
            pst.setString(3, e);
            pst.setString(4, c);
            pst.setString(5, a);
            pst.setString(6, ct);
            pst.setString(7, s);
            pst.setString(8, d);
             pst.setObject(9,dt);

            
            int status=pst.executeUpdate();
            
            if(status>0)
            {
                request.setAttribute("msgs","Sign Up Successful! Login to continue..");
                
                disp=getServletContext().getRequestDispatcher("/Login.jsp");
            }
            else
            {
                out.println("Database couldnt be accessed");
            }
            
            disp.forward(request, response);
            
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
