<%-- 
    Document   : ViewAllExperts
    Created on : 15 Jul, 2013, 2:22:57 PM
    Author     : honey
--%>

<%@page errorPage="ErrorPage.jsp" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="MonitorMenu.jsp"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="static Common.DatabaseConnect.DatabaseConnect"%>
<%@page import="java.sql.Connection"%>


<html>
    <head>
        <title>View All Experts</title>
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
            
    
try
{
       
  Connection con = DatabaseConnect();
      
     Statement st=con.createStatement();
      ResultSet rs=st.executeQuery("Select * from experts");
      
      out.println("<center><h3><u>View All Experts</u></h3></center>");
      
      out.println("<br><table align=center border=1>");
       out.println("<tr>");
       out.println("<th> Name of Expert</th><th> Domain</th><th> Phone no.</th><th> Email</th><th> Address</th><th> City</th>");
        out.println("</tr>");     
      
      while(rs.next())
      {
          
          out.print("<tr>");
          out.print("<td>"+rs.getString("username")+"</td>");
          out.print("<td>"+rs.getString("domain")+"</td>");
          out.print("<td>"+rs.getString("phone")+"</td>");
          out.print("<td>"+rs.getString("email")+"</td>");
          out.print("<td>"+rs.getString("address")+"</td>");
          out.print("<td>"+rs.getString("city")+"</td>");
          out.print("</tr>");
                  
                  
      }
      
      out.println("</table><br>");

}
catch(Exception e)
{
    out.println(e);
}

%>
<br>
<%
            String msg=(String)request.getAttribute("msg");
        %>
    <font color="red">
        <%
            if(msg!=null)
                out.println(msg);
        %>
    </font>
    </center>
</body>
</html>