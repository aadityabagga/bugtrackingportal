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
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author aaditya
 */
public class PostNewBug extends HttpServlet {

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
                
                String pb = (String) ses.getAttribute("uname");
                String cat=request.getParameter("cat");
                String ov=request.getParameter("ov");
                String desc=request.getParameter("desc");
                Date dt = new Date();
                
                Connection con = DatabaseConnect();
                
                String query = "insert into bugs(posted_by,posted_on,domain,overview,description) values(?,?,?,?,?)";
                PreparedStatement pst = con.prepareStatement(query);
                pst.setString(1, pb);
                pst.setString(3, cat);
                pst.setObject(2, dt);
                pst.setString(4, ov);
                pst.setString(5, desc);
                int status = pst.executeUpdate();
                if (status > 0)
                {
                    request.setAttribute("msg", "Bug Posted Successfully! We will try to solve your bug as soon as possible.");
                    
                    //Use Cookies
                  
                  boolean cookieFound=false;
            Cookie cookieSet[]=request.getCookies();
            Cookie myCookie=null;
            if(cookieSet!=null) //cookies found
            {
                for(int i=0;i<cookieSet.length;i++) //check cookies to find one with name 'monitors'
                {
                    if(cookieSet[i].getName().equals("monitors"))    //cookie with name 'monitors'
                    {
                        cookieFound=true;
                        myCookie=cookieSet[i];
                        break;
                    }
                }
            }
       
            if(cookieFound==false)  //cookie not found with name 'monitors'
            {
                //create cookie for that expert
                myCookie=new Cookie("monitors","1");
                
                myCookie.setMaxAge(24*60*60*24);
                response.addCookie(myCookie);
            }
            else    //cookie for that monitors found
            {
                int temp=Integer.parseInt(myCookie.getValue());
                temp=temp+1;
               
                myCookie.setValue(String.valueOf(temp));
                response.addCookie(myCookie);
             }
            
            //**End Cookie part 
                    
                }
                else
                {
                    request.setAttribute("msg", "Bug Posting Failed");
                }
                RequestDispatcher disp=null;
                disp=getServletContext().getRequestDispatcher("/ViewAllBugs?state=Unsolved");
                disp.forward(request, response);
            
        }
        catch (Exception e)
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
