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
import java.sql.ResultSet;
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
public class ShowToConsumer extends HttpServlet {

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
            int bugid=Integer.parseInt(request.getParameter("bugno"));
            
            Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugportal","root","password");
              
              PreparedStatement pst = con.prepareStatement("update bugs set filter='Allow', status='Solved', solved_on=? where bug_id=?");
              
               Date obj=new Date();
              pst.setObject(1,obj);
              pst.setInt(2, bugid);
              
               int status=pst.executeUpdate();
               
               RequestDispatcher disp=null;
               
               PreparedStatement pst2=con.prepareStatement("select * from bugs  where bug_id=?");
                 pst2.setInt(1,bugid);
                 
                 ResultSet rs=pst2.executeQuery();
                 rs.next();
                 
                  String cname=rs.getString("posted_by");
                  String ename=rs.getString("assign_to");

                
                 if(status>0)
                 {
                     
                      //Use Cookies
                  
                     boolean cookieFound=false;     //monitors  
                     boolean cookieFound1=false;        //expert
                 boolean cookieFound2=false;        //consumer
                 
            Cookie cookieSet2[]=request.getCookies();
            
            Cookie myCookie=null;       //monitors  
            Cookie myCookie1=null;      //expert
            Cookie myCookie2=null;      //consumer
            
            //consumer
            
            if(cookieSet2!=null) //cookies found
            {
                for(int i=0;i<cookieSet2.length;i++) //check cookies to find one with the name of consumer
                {
                    if(cookieSet2[i].getName().equals(cname))    //cookie with name of that consumer
                    {
                        cookieFound2=true;
                        myCookie2=cookieSet2[i];
                        break;
                    }
                }
            }
            
            
            if(cookieFound2!=false)   //cookie for that consumer found
            {
                int temp2=Integer.parseInt(myCookie2.getValue());
                temp2=temp2+1;      //bug has been solved
               
                myCookie2.setValue(String.valueOf(temp2));
                response.addCookie(myCookie2);
             }
            
        //Use Cookies for Monitor
                  
                 
            if(cookieSet2!=null) //cookies found
            {
                for(int i=0;i<cookieSet2.length;i++) //check cookies to find one with name 'monitors'
                {
                    if(cookieSet2[i].getName().equals("monitors"))    //cookie with name 'monitors'
                    {
                        cookieFound=true;
                        myCookie=cookieSet2[i];
                        break;
                    }
                }
            }
            
             if(cookieFound!=false)    //cookie for monitors found
            {
                int temp=Integer.parseInt(myCookie.getValue());
                temp=temp-1;        //bug has been solved
               
                myCookie.setValue(String.valueOf(temp));
                response.addCookie(myCookie);
             }
            
              //Use Cookies for Expert
             
               if(cookieSet2!=null) //cookies found
            {
                for(int i=0;i<cookieSet2.length;i++) //check cookies to find that one with name of expert
                {
                    if(cookieSet2[i].getName().equals(ename))    //cookie with name of that expert
                    {
                        cookieFound1=true;
                        myCookie1=cookieSet2[i];
                        break;
                    }
                }
            }
       
            if(cookieFound1!=false)      //cookie for that expert found
            {
                int temp1=Integer.parseInt(myCookie1.getValue());
                temp1=temp1 - 1;        //expert solved bug
               
                myCookie1.setValue(String.valueOf(temp1));
                response.addCookie(myCookie1);
             }
            
            
            
            //**End Cookie part
                     
                   disp=getServletContext().getRequestDispatcher("/ViewBugsMon?state=Solved");
                   request.setAttribute("msg","Consumer can now view the solution!");
            
                 }
                 else
                     out.println(" consumer cant view solution");
              
              
              disp.forward(request, response);
              
            }
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
