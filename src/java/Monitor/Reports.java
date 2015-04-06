/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Monitor;

import static Common.DatabaseConnect.DatabaseConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
public class Reports extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            HttpSession s=request.getSession(false);
            String loginname=(String)s.getAttribute("uname");
            
            if(loginname==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");

                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }

	    String role = (String) s.getAttribute("rl");
	    if (!role.equals("monitor"))
	    {
		    request.setAttribute("msg", "<i>Role unauthorized.</i>");
		    RequestDispatcher disp;

		    if (role.equals("expert"))
		    {
			disp = getServletContext().getRequestDispatcher("/ExpertHome.jsp");
		    }
		    else if (role.equals("consumer"))
		    {
			disp = getServletContext().getRequestDispatcher("/ConsumerHome.jsp");
		    }
		    else
		    {
			s.invalidate();
			s = null;
			disp = getServletContext().getRequestDispatcher("/Login.jsp");
		    }

		    disp.forward(request, response);
	}

            Connection con = DatabaseConnect();
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("Select * from bugs");
                
               int tot=0,solv=0,ass=0;
            while(rs.next())
            {
                tot=tot+1;
                
                if(rs.getString("status").equals("Solved"))
                    solv=solv+1;
                if(!(rs.getString("status").equals("Pending")))
                    ass=ass+1;
                                   
            }
            
          
            
            double suc=(solv/(tot*1.0))*100.0;
            
            request.setAttribute("total", tot);
            request.setAttribute("assigned", ass);
            request.setAttribute("solved", solv);
            request.setAttribute("success_rate", suc);
         
       
            RequestDispatcher disp=null;
            disp=getServletContext().getRequestDispatcher("/Reports.jsp");
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
