<%-- 
    Document   : ViewAllConsumers
    Created on : Oct 25, 2013, 7:07:13 PM
    Author     : aaditya
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Consumers</title>
    </head>
    <body>
        
           <center>

<%@include file="MonitorMenu.jsp"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page errorPage="ErrorPage.jsp" contentType="text/html" pageEncoding="UTF-8"%>
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
       
        out.println("<table align=center border=1 >");
         out.println("<tr>");
      out.println("<th>ID</th><th> Name</th><th> email</th><th>Phone</th><th>Address</th><th>City</th><th>Gender</th><th>Dob</th><th>joined</th>");
      
      out.println("</tr>");
   
      try
      {
        
        out.print("<tr>");
            ResultSet rs=(ResultSet)request.getAttribute("consumers");
            
        while(rs.next())
      {
          out.print("<td>"+rs.getString("consumer_id")+"</td>");
          out.print("<td>"+rs.getString("username")+"</td>");
          out.print("<td>"+rs.getString("email")+"</td>");
          out.print("<td>"+rs.getString("phone")+"</td>");
          out.print("<td>"+rs.getString("address")+"</td>");
          out.print("<td>"+rs.getString("city")+"</td>");
          out.print("<td>"+rs.getString("gender")+"</td>");
          out.print("<td>"+rs.getString("dob")+"</td>");
          out.print("<td>"+rs.getString("joined_on")+"</td>");
          out.println("</tr>");                
        
}
  out.println("</table><br><center><a href=#>Back to Top</a></center><br>");

}
catch(Exception e)
{
    out.println(e);
}


%>
    </center>
      
    </body>
</html>
