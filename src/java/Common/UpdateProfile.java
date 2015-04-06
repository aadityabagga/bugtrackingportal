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

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Aaditya
 */
public class UpdateProfile extends HttpServlet
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter out = response.getWriter();
	RequestDispatcher disp = null;
	try
	{
	    HttpSession ses = request.getSession(false);
	    String rol = (String) ses.getAttribute("rl");
	    String nam = (String) ses.getAttribute("uname");

	    if (nam == null)
	    {
		request.setAttribute("msg", "<i>You are not logged in. Please Login</i>");

		RequestDispatcher disp2 = getServletContext().getRequestDispatcher("/Login.jsp");
		disp2.forward(request, response);
	    }

	    String gender = request.getParameter("t2");
	    String dateofbirth = request.getParameter("t3");
	    String address = request.getParameter("t4");
	    String contact = request.getParameter("t5");
	    String email = request.getParameter("t6");

	    String city = request.getParameter("t7");

	    Connection con = DatabaseConnect();

	    PreparedStatement pst = null;

	    if (rol.equals("expert"))
	    {
		pst = con.prepareStatement("update experts set gender=?,dob=?,address=?,phone=?,email=?,city=?  where username=?");

	    }
	    else if (rol.equals("consumer"))
	    {
		pst = con.prepareStatement("update consumers set gender=?,dob=?,address=?,phone=?,email=?,city=?  where username=?");
	    }

	    else
	    {
		request.setAttribute("msg", "Role could not be fetched");
		disp = getServletContext().getRequestDispatcher("/Login.jsp");
		disp.forward(request, response);
	    }

	    pst.setString(1, gender);
	    pst.setString(2, dateofbirth);
	    pst.setString(3, address);
	    pst.setString(4, contact);
	    pst.setString(5, email);
	    pst.setString(6, city);

	    pst.setString(7, nam);

	    int status = pst.executeUpdate();

	    if (status > 0)
	    {
		request.setAttribute("msgs", "Profile Edited Successfully!");
	    }
	    else
	    {
		request.setAttribute("msg", "Profile not updated ");
	    }

	    disp = getServletContext().getRequestDispatcher("/EditProfile.jsp");
	    disp.forward(request, response);

	}
	catch (Exception e)
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
