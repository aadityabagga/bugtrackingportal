/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Common;

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
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author aaditya
 */
public class ChangePassword extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            HttpSession ses=request.getSession(false);
            String lID=(String)ses.getAttribute("uname");
            String role=(String)ses.getAttribute("rl");
           
            if(lID==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
            
            
            
            String query=null;
            String query2=null;
            
            String np=request.getParameter("new_pwd");
            String p=request.getParameter("pwd");
            
            /* Hash passwords */
            String pw = DigestUtils.sha1Hex(p);
            String npw = DigestUtils.sha1Hex(np);


            if(role.equals("consumer"))
                query="select password from consumers where username=?";
            else if(role.equals("monitor"))
                query="select password from monitors where username=?";
            else
                query="select password from experts where username=?";
            
           Connection con=DatabaseConnect();
           PreparedStatement pst=con.prepareStatement(query);
           pst.setString(1, lID);
        ResultSet rs=pst.executeQuery();
        
        if(rs.next())
        {
        if(!(pw.equals(rs.getString("password"))))
        {
            request.setAttribute("msg", "Entered password doesnt match the password in database");
        }
        else
        {
            if(role.equals("consumer"))
                query2="update consumers set password=? where username=?";
            else if(role.equals("monitor"))
                query2="update monitors set password=? where username=?";
            else if(role.equals("expert"))
                query2="update experts set password=? where username=?";
            
            PreparedStatement pst1=con.prepareStatement(query2);
           pst1.setString(1, npw);
           pst1.setString(2, lID);
            int status=pst1.executeUpdate();
            if(status>0)
                request.setAttribute("msgs", "Password Changed Successfully");
            else
                request.setAttribute("msg", "Password not Changed");
        }
        }
        else
            request.setAttribute("msg", "Database couldnt be accessed");
        
        RequestDispatcher disp=getServletContext().getRequestDispatcher("/ChangePassword.jsp");
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
