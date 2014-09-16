<%-- 
    Document   : SubmitFeedback
    Created on : Jul 28, 2013, 4:06:41 AM
    Author     : aaditya
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="ConsumerMenu.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit FeedBack</title>
    </head>
    <body>
    <center>
        <%
            
            
                        
             String name=(String)session.getAttribute("uname");
            if(name==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
            
            
            int bugid=Integer.parseInt(request.getParameter("bugid"));
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugportal","root","password");
            
            String query="Select description,solution from bugs where bug_id=?";
            PreparedStatement pst=con.prepareStatement(query);
            pst.setInt(1,bugid);
            ResultSet rs=pst.executeQuery();
            
            if(rs.next())
              {
                  
                   
                    out.println("<h3><u>Submit Feedback</u></h3>");
                    out.println("<br>");
                    
                    out.println("<form method=post action=SubmitFeedback>");
                    
                    out.println("<table  border=0 width=800>");
                    
                    out.println("<tr>");
                    out.println("<td><b>Problem:</b></td>");
                    out.println("<td>"+rs.getString("description")+"</td>");
                    out.println("</tr>");
                    
                    out.println("<tr>");
                    out.println("<td><b>Solution:</b></td>");
                    out.println("<td>"+rs.getString("solution")+"</td>");
                    out.println("</tr>");
                    
                    out.println("<tr>");
                    out.println("<td><b>Feedback:</b></td>");
                    out.println("<td align=center><textarea name=fb rows=5 cols=85> </textarea></td>");
                    out.println("</tr>");
                    
                    out.println("<input type=hidden name=bid value="+bugid+">");
                            
                    out.println("<tr>");
                    out.println("<td align=center colspan=2><input type=submit value='Submit'></td>");
                    out.println("</tr>");
                    
                    
                    
                    out.println("</table>");
                    out.println("</form><br>");
                    
                    String msg=(String)request.getAttribute("msg");
                    if(msg!=null)
                        out.println("<font color=red>"+msg+"</font>");
                    
                    
                    out.println("<br><br>");
                    
                    
                 out.println("<a href='ViewAllBugs?state=All'>Back to Bugs</a>");
                    
                    
                         
              }
              else
              {
                  out.println("Database couldnt be accessed");
              }          
            
                    
        %>
        
    </center>
    </body>
</html>
