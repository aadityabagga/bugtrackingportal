<%-- 
    Document   : ViewAssignedBugs
    Created on : Jul 27, 2013, 4:27:15 AM
    Author     : aaditya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page errorPage="ErrorPage.jsp" contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="ExpertMenu.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Bugs</title>
    </head>
    <body>
    <center>
        
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
            
            
            String msg2=(String)request.getParameter("messg");
        
    out.println("<center>");
            
            if(msg2!=null)
            {
                out.println("<div class='message error-message'><p><strong>");
                  out.println(msg2);
                  out.println("</strong></p></div>");
            }
        out.println("</center>");
            
            try
            {
            
                ResultSet rs=(ResultSet)request.getAttribute("bugs");
                
                String state=(String)request.getAttribute("path");
                
                
            
                out.println("<center>");
                out.println("<b><h3><u>"+state+" bugs</u></h3></b><br>");
                
                out.println("<center>");
                String msg=(String)request.getAttribute("msg");
                String note=(String)request.getAttribute("note");
                
                if(msg!=null)
                {
                    out.println("<div class='message thank-message'><p><strong>");
                  out.println(msg);
                  out.println("</strong></p></div>");
                  
                  out.println("<font color=red>"+note+"</font><br>");
                  
                }
                out.println("</center>");
                
                out.println("<table align=center border=1>");
                out.println("<tr>");
                out.println("<th>Bug id</th>");
                out.println("<th>Domain</th>");
                 
                out.println("<th>Status</th>");
                   out.println("<th>Assign date</th>");
                out.println("<th>Overview</th>");
                out.println("<th>Problem</th>");
             
                out.println("<th>Complete date</th>");
                out.println("<th>Solution</th>");
                 
                out.println("<th>Feedback</th>");
                 
                out.println("</tr>");
                
                if(state.equals("Assigned")||state.equals("Solved"))
                {
                while(rs.next())
                {
                    
                    if(rs.getString("posted_by").equals(null))
                    response.sendRedirect("ViewBugsExpert.jsp?messg='No Bugs..'");
                    
                    if(rs.getString("status").equals(state) || rs.getString("status").equals("Re-Assigned"))
                    {
                    out.println("<tr>");
                out.println("<td>"+rs.getString("bug_id")+"</td>"); 
                out.println("<td>"+rs.getString("domain")+"</td>");
                
                 if(state.equals("Assigned"))
                    out.println("<td><a href=SubmitSolution.jsp?bugid="+rs.getInt("bug_id")+">"+rs.getString("status")+"</a></td>");
                else
                    out.println("<td>"+rs.getString("status")+"</td>");
                 
                 out.println("<td>"+rs.getString("assign_on")+"</td>");
                out.println("<td><font color=red>"+rs.getString("overview")+"</font></td>");
                out.println("<td>"+rs.getString("description")+"</td>");
                
                out.println("<td>"+rs.getString("solved_on")+"</td>");
                out.println("<td><font color=blue>"+rs.getString("solution")+"</font></td>");
                
                out.println("<td><font color=green>"+rs.getString("feedback")+"</font></td>");
                
               
                
                out.println("</tr>");
                }
                }
 
                out.println("</table>");
                }
                else
                    
                    {
                while(rs.next())
                {
                    if(rs==null)
                    response.sendRedirect("ViewBugsExpert.jsp?messg='No Bugs..'");
                    
                    out.println("<tr>");
                out.println("<td>"+rs.getString("bug_id")+"</td>"); 
                out.println("<td>"+rs.getString("domain")+"</td>");
                 
                  if(rs.getString("status").equals("Assigned"))
                    out.println("<td><a href=SubmitSolution.jsp?bugid="+rs.getInt("bug_id")+">"+rs.getString("status")+"</a></td>");
                else
                    out.println("<td>"+rs.getString("status")+"</td>");
                
                  out.println("<td>"+rs.getString("assign_on")+"</td>");
                out.println("<td><font color=red>"+rs.getString("overview")+"</font></td>");
                out.println("<td>"+rs.getString("description")+"</td>");
                
                out.println("<td>"+rs.getString("solved_on")+"</td>");
                out.println("<td><font color=blue>"+rs.getString("solution")+"</font></td>");
                
                out.println("<td><font color=green>"+rs.getString("feedback")+"</font></td>");
                
                
                out.println("</tr>");
                }
 
                out.println("</table>");
                }
                
                out.println("<br><center><a href=#>Back to Top</a></center><br>");
                
                
                }
        catch(Exception e)
        {
            out.println(e);
        
        }
        finally 
        {            
            out.close();
        }
                
            %>
                
       
    </center>        
    </body>
</html>
