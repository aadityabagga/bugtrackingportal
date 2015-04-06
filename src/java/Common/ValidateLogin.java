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
public class ValidateLogin extends HttpServlet
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException
    {
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter out = response.getWriter();
	try
	{
	    String n = request.getParameter("nm");
	    String p = request.getParameter("pw");
	    String r = request.getParameter("rl");

	    /* Get hash value of password */
	    String pw = DigestUtils.sha1Hex(p);

	    Connection con = DatabaseConnect();

	    PreparedStatement pst = null;
	    ResultSet rs = null;
	    RequestDispatcher disp = null;
	    HttpSession ses = request.getSession(true);
	    boolean status = false;

	    if (r.equals("consumer"))
	    {
		pst = con.prepareStatement("Select * from consumers where username='" + n + "'");
		rs = pst.executeQuery();
		rs.next();
		if (rs.getString("password").equals(pw))
		{
		    status = true;
		    disp = getServletContext().getRequestDispatcher("/ConsumerHome.jsp");
		}

	    }
	    else if (r.equals("monitor"))
	    {
		pst = con.prepareStatement("Select * from monitors where username='" + n + "'");
		rs = pst.executeQuery();
		rs.next();
		if (rs.getString("password").equals(pw))
		{
		    status = true;
		    disp = getServletContext().getRequestDispatcher("/MonitorHome.jsp");
		}
	    }
	    else
	    {
		pst = con.prepareStatement("Select * from experts where username='" + n + "'");
		rs = pst.executeQuery();
		rs.next();
		if (rs.getString("password").equals(pw))
		{
		    status = true;
		    disp = getServletContext().getRequestDispatcher("/ExpertHome.jsp");
		}
	    }

	    if (status == true)
	    {
		request.setAttribute("msg", "Authentication Success!");
		ses.setAttribute("uname", n);
		ses.setAttribute("rl", r);
		disp.forward(request, response);
	    }
	    else
	    {
                // unfiy the interface by redirecting to individual login pages instead of the old all-in-one 
		//response.sendRedirect("Login.jsp?msg=Login Authentication Failed");

		if (r.equals("consumer"))
		{
		    response.sendRedirect("Login2.jsp?role=consumer&msg=Login Authentication Failed");
		}
		else if (r.equals("monitor"))
		{
		    response.sendRedirect("Login2.jsp?role=monitor&msg=Login Authentication Failed");
		}
		else
		{
		    response.sendRedirect("Login2.jsp?role=expert&msg=Login Authentication Failed");
		}
	    }

	}
	catch (Exception e)
	{
	    response.sendRedirect("Login.jsp?msg=Login Authentication Failed: " + "Could not connect to database");
	}
	finally
	{
	    out.close();
	}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException
    {
	processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException
    {
	processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
	return "Short description";
    }// </editor-fold>
}
