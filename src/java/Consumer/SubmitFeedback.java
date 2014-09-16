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
import java.sql.ResultSet;
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
public class SubmitFeedback extends HttpServlet {

    
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
            
            int bugid=Integer.parseInt((String)request.getParameter("bid"));
            String fback=request.getParameter("fb");
        
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugportal","root","password");
        
            String query="update bugs set feedback=? where bug_id=?";
            PreparedStatement pst=con.prepareStatement(query);
            pst.setString(1,fback);
            pst.setInt(2,bugid);
            
            int status=pst.executeUpdate();
            
            
                  
            
            if(status>0)
            {
                request.setAttribute("msg","Feedback submitted Successfully!");
                
                //Use Cookies
                  
                  boolean cookieFound=false;
                  boolean cookieFound2=false;
                  
            Cookie cookieSet[]=request.getCookies();
            
            Cookie myCookie=null;
            Cookie myCookie2=null;
            
            //For monitors
            
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
       
            if(cookieFound!=false)      //cookie for that monitors found
            {
                int temp=Integer.parseInt(myCookie.getValue());
                temp=temp+1;
               
                myCookie.setValue(String.valueOf(temp));
                response.addCookie(myCookie);
             }
            
            //For consumers
            
            String cname=(String)ses.getAttribute("uname");
            
            if(cookieSet!=null) //cookies found
            {
                for(int i=0;i<cookieSet.length;i++) //check cookies to find one with the name of consumer
                {
                    if(cookieSet[i].getName().equals(cname))    //cookie with name of that consumer
                    {
                        cookieFound2=true;
                        myCookie2=cookieSet[i];
                        break;
                    }
                }
            }
            
            if(cookieFound2!=false)              //cookie for that consumer found
            {
                int temp2=Integer.parseInt(myCookie2.getValue());
                temp2=temp2-1;
               
                myCookie2.setValue(String.valueOf(temp2));
                response.addCookie(myCookie2);
             }
            
            //**End Cookie part 
                
            }
            else
                request.setAttribute("msg","Feedback not submitted");
            
            
            RequestDispatcher disp=getServletContext().getRequestDispatcher("/ViewAllBugs?state=All");
            disp.forward(request,response);
            
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
