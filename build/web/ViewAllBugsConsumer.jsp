<%-- 
    Document   : ViewAllBugs
    Created on : Jul 21, 2013, 9:33:59 PM
    Author     : aaditya
--%>

<%@page import="java.sql.ResultSet" %>
<%@page errorPage="ErrorPage.jsp" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Bugs</title>
    </head>
    <body>
    <center>
        
        <%@include file="ConsumerMenu.jsp" %>
        
         <%
             
             response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
             
             String name=(String)session.getAttribute("uname");
            
             if(name==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
            
            
             String msg=(String)request.getAttribute("msg");
           out.println("<center>");
           if(msg!=null)
           {
                out.println("<div class='message thank-message'><p><strong>");
                  out.println(msg);
                  out.println("</strong></p></div><br>");
           }
           out.println("</center>");
             
             
        %>
        
        
        
        <%
            ResultSet rs=(ResultSet)request.getAttribute("bugs");
            
            String state=(String)request.getAttribute("path");
            
            int count=1;
            
            out.println("<center><h3><font color=blue><u><i>View "+state+" Bugs</i></u></font></h3></center><br>");
           
            
           out.println("<table align=center border=1>");
           out.println("<tr>");
           out.println("<th>Bug No</th> <th>Category</th> <th>Overview</th> <th>Posted On</th> <th>Description</th> <th>Bug Status</th> <th>Solution</th><th>Solved On</th><th>Submit Feedback</th>");
           out.println("</tr>");
           
           
           if(state.equals("Unsolved"))
                {
           while(rs.next())
           {
               
               if(rs.getString("status").equals("Assigned")||rs.getString("status").equals("Re-Assigned")||rs.getString("status").equals("Pending"))
                    {
               out.println("<tr>");
               out.println("<td>"+(count++)+"</td>");
               out.println("<td>"+rs.getString("domain")+"</td>");
               out.println("<td>"+rs.getString("overview")+"</td>");
               out.println("<td>"+rs.getString("posted_on")+"</td>");
               
               out.println("<td>"+rs.getString("description")+"</td>");
               out.println("<td><font color=orange>"+rs.getString("status")+"</font></td>");
               
               if(rs.getString("filter").equals("Block"))
                    out.println("<td>Not Solved yet</td>");
                else          
               out.println("<td><font color=red>"+rs.getString("solution")+"</font></td>");
               out.println("<td>"+rs.getString("solved_on")+"</td>");
               out.println("<td><a href=SubmitFeedback.jsp?bugid="+rs.getString("bug_id")+">"+rs.getString("feedback")+"</a></td>");
               out.println("</tr>");
           }
           }
                }
           else if(state.equals("Solved"))
           {
                while(rs.next())
           {
               
               if(rs.getString("filter").equals("Allow"))
                    {
               out.println("<tr>");
               out.println("<td>"+(count++)+"</td>");
               out.println("<td>"+rs.getString("domain")+"</td>");
               out.println("<td>"+rs.getString("overview")+"</td>");
               out.println("<td>"+rs.getString("posted_on")+"</td>");
               
               out.println("<td>"+rs.getString("description")+"</td>");
               out.println("<td><font color=orange>"+rs.getString("status")+"</font></td>");
               
                            
               out.println("<td><font color=red>"+rs.getString("solution")+"</font></td>");
               out.println("<td>"+rs.getString("solved_on")+"</td>");
               out.println("<td><a href=SubmitFeedback.jsp?bugid="+rs.getString("bug_id")+">"+rs.getString("feedback")+"</a></td>");
               out.println("</tr>");
           }
           }
               
           }
           else
           {
               while(rs.next())
           {
               
               
                    
               
            out.println("<tr>");
               out.println("<td>"+(count++)+"</td>");
               out.println("<td>"+rs.getString("domain")+"</td>");
               out.println("<td>"+rs.getString("overview")+"</td>");
               out.println("<td>"+rs.getString("posted_on")+"</td>");
               
               out.println("<td>"+rs.getString("description")+"</td>");
               out.println("<td><font color=orange>"+rs.getString("status")+"</font></td>");
               
                if(rs.getString("filter").equals("Block"))
                    out.println("<td>Not Solved yet</td>");
                else
               out.println("<td><font color=red>"+rs.getString("solution")+"</font></td>");
                
               out.println("<td>"+rs.getString("solved_on")+"</td>");
               out.println("<td><a href=SubmitFeedback.jsp?bugid="+rs.getString("bug_id")+">"+rs.getString("feedback")+"</a></td>");
               out.println("</tr>");
           
           }
           }
           out.println("</table>");
        
           out.println("<br><center><a href=#>Back to Top</a></center><br>");
           %>
    </center>
    </body>
</html>
