 
package Monitor;

import static Common.DatabaseConnect.DatabaseConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aaditya
 */
public class AssignToExpert extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
                
              int expid = Integer.parseInt(request.getParameter("expert_id"));  //get expert id
              int bugno = Integer.parseInt(request.getParameter("bug_no"));     //get bug id
                 
              Connection con = DatabaseConnect();
              
              PreparedStatement pst1 = con.prepareStatement("Select * from experts where expert_id=?");
              pst1.setInt(1, expid);
              ResultSet rs=pst1.executeQuery();     //extract expert name from expert id
              rs.next();
              String ename=rs.getString("username");
              
              RequestDispatcher disp=null;
              
              if(ename!=null)   //expert is valid
              { 
                  //Use Cookies
                  
                  boolean cookieFound=false;
            Cookie cookieSet[]=request.getCookies();
            Cookie myCookie=null;
            if(cookieSet!=null) //cookies found
            {
                for(int i=0;i<cookieSet.length;i++) //check cookies to find that one with name of expert
                {
                    if(cookieSet[i].getName().equals(ename))    //cookie with name of that expert
                    {
                        cookieFound=true;
                        myCookie=cookieSet[i];
                        break;
                    }
                }
            }
       
            if(cookieFound==false)  //cookie of that expert not found
            {
                //create cookie for that expert
                myCookie=new Cookie(ename,"1");
                
                myCookie.setMaxAge(24*60*60*24);
                response.addCookie(myCookie);
            }
            else    //cookie for that expert found
            {
                int temp=Integer.parseInt(myCookie.getValue());
                temp=temp+1;
               
                myCookie.setValue(String.valueOf(temp));
                response.addCookie(myCookie);
             }
            
            //**End Cookie part
                  
                  PreparedStatement pst2 = con.prepareStatement("Select * from bugs where bug_id=?");
              pst2.setInt(1, bugno);        //extrct bug info from bug id
              ResultSet rs2=pst2.executeQuery();
              rs2.next();
              
               //Use Cookies for consumer
               /*   
                String cname=rs2.getString("posted_by");
                  boolean cookieFound2=false;
                        Cookie myCookie2=null;
                                               
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
            
            
            if(cookieFound2==false)  //cookie of that consumer not found
            {
                //create cookie for that consumer
                myCookie2=new Cookie(cname,"1");
                
                myCookie2.setMaxAge(24*60*60*24);
                response.addCookie(myCookie2);
            }
            else             //cookie for that consumer found
            {
                int temp2=Integer.parseInt(myCookie2.getValue());
                temp2=temp2+1;
               
                myCookie2.setValue(String.valueOf(temp2));
                response.addCookie(myCookie2);
             }
            */
            
            //Cookies for monitor
            
             Cookie monitorCookie=null;
            if(cookieSet!=null) //cookies found
            {
                for(int i=0;i<cookieSet.length;i++) //check cookies to find one with the name 'monitors'
                {
                    if(cookieSet[i].getName().equals("monitors"))    //cookie with name 'monitors' found
                    {
                        monitorCookie=cookieSet[i];
                        
                        int temp2=Integer.parseInt(monitorCookie.getValue());
                         temp2=temp2-1;     // monitor has assigned the bug
               
                monitorCookie.setValue(String.valueOf(temp2));
                response.addCookie(monitorCookie);
                        
                        break;
                    }
                }
            }
            
       
            
            //**End Cookie part
                  
              
              PreparedStatement pst =null;
              
              if(rs2.getString("solution").equals("Not Solved"))
                       pst = con.prepareStatement("Update bugs set status='Assigned' , assign_to=? , assign_on=? where bug_id=?");
              else
                       pst = con.prepareStatement("Update bugs set status='Re-Assigned', solution='Not Solved', solved_on=null, assign_to=? , assign_on=? where bug_id=?");
                  
                Date dt=new Date();
              
               pst.setString(1,ename);
               pst.setObject(2,dt);
               pst.setInt(3,bugno); 
              
              
               int status=pst.executeUpdate();

                
                 if(status>0)
                 {
                   disp=getServletContext().getRequestDispatcher("/ViewBugsMon?state=Assigned");
                   request.setAttribute("msg","Bug Assigned Successfully!");
            
                 }
                 else
                     out.println(" not assigned");
              }
              else
                  out.println("Expert name couldnt be fetched from database");
              disp.forward(request, response);
        }
      
        catch(Exception e)
        {
        out.println("Some exception occurs in update status: "+e);
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
