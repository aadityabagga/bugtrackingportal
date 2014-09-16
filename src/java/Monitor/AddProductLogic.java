/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Monitor;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
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
public class AddProductLogic extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
        {
                   
             
            String pro_name = request.getParameter("pro_name");
            String pro_desc = request.getParameter("pro_desc");
            HttpSession ses=request.getSession(true);
            
               
           RequestDispatcher dis=null;
   
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugportal","root","password");
            java.sql.PreparedStatement pst=con.prepareStatement("insert into products(pro_name,pro_desc) values(?,?)");
           
            pst.setString(1, pro_name);
            pst.setString(2, pro_desc);
         

            int status=pst.executeUpdate();
            if(status==1)
            {
                dis=getServletContext().getRequestDispatcher("/ViewAllProducts.jsp");
                request.setAttribute("msg","Product Added Successfully!");
     
            }
            else
            {
                out.println("There is some error in adding product");
            }
     
            dis.forward(request, response);
             
        } 
       
        
        catch (Exception e) 
        {
         out.println("Some exception occurs"+e);
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
