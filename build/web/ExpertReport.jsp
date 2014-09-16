<%-- 
    Document   : ExpertReport
    Created on : Sep 7, 2013, 10:43:00 PM
    Author     : aaditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Expert Report</title>
    </head>
    <body>
        <%@include file="ExpertMenu.jsp" %>
        
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
            
%>
        
        <center>
            <u><h2>Report</h2></u>
            <%
                    int t=(Integer)request.getAttribute("tot");
                     int s=(Integer)request.getAttribute("solv");
                      Double sc=(Double)request.getAttribute("suc");
                
                out.println("<br>");
                out.println("<table align=center border=1>");

                out.println("<tr>");
                out.println("<th> Bugs Assigned</th>");
                out.print("<td align=center>"+t+"</td>");
                out.print("</tr>");
                
                out.println("<tr>");
                out.println("<th> Bugs Solved</th>");
                out.print("<td align=center>"+s+"</td>");
                out.print("</tr>");
                
                out.print("<tr>");
                out.println("<th>Success Rate</th>");
                 out.print("<td><font color=red>"+sc+"</font></td>");
                out.print("</tr>");
                   
               
                out.println("</table>");
                
        %>
        </center>
        
    </body>
</html>
