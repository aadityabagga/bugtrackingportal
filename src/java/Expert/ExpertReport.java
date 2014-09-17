/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Expert;

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
public class ExpertReport extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
                HttpSession s=request.getSession(false);
            String loginname=(String)s.getAttribute("uname");
            String role=(String)s.getAttribute("rl");
            
            Integer expid=Integer.parseInt(request.getParameter("eno"));
            String temp=null;   //want to store expert name
            
            Connection con = DatabaseConnect();
            
            PreparedStatement pst2=con.prepareStatement("select * from experts where expert_id=?");
            pst2.setInt(1,expid);
            
            
            ResultSet rs2=pst2.executeQuery();
            if(rs2.next())
                temp=rs2.getString("username");
            
            if(temp!=null)
                loginname=temp;
            
            if(loginname==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }            
            
            
              
            PreparedStatement pst=con.prepareStatement("select * from bugs where assign_to=?");
             
            pst.setString(1,loginname);
            
            ResultSet rs=pst.executeQuery();
            int tot=0,solv=0;
            while(rs.next())
            {
                tot=tot+1;
                if(rs.getString("status").equals("Solved"))
                    solv=solv+1;
                                   
            }
            
            double suc=(solv/(tot*1.0))*100.0;
            
            request.setAttribute("tot", tot);
            request.setAttribute("solv", solv);
            request.setAttribute("suc", suc);
          
            RequestDispatcher disp=null;
            out.println("Hello");
            
            if(role.equals("expert"))
                disp=getServletContext().getRequestDispatcher("/ExpertReport.jsp");
            else if(role.equals("monitor"))
                disp=getServletContext().getRequestDispatcher("/Reports.jsp");
            else
                disp=getServletContext().getRequestDispatcher("/Login.jsp");
            
            disp.forward(request,response);
            
        }
        catch(Exception e)
        {
                out.println(e);
        }
        
finally {            
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
