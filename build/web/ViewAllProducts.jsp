

<%-- 
    Document   : ViewAllProducts
    Created on : 15 Jul, 2013, 2:22:57 PM
    Author     : aaditya
--%>

<!DOCTYPE html>
<html>

<%@include file="MonitorMenu.jsp"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


    <head>
        
        <title>View All Products</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            

try
{
  Class.forName("com.mysql.jdbc.Driver");
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugportal","root","password");
      Statement st=con.createStatement();
      
      ResultSet rs=st.executeQuery("Select * from products");
      
      out.println("<center><h3><u>View All Products</u></h3><br></center>");
      
      out.println("<table height=50 width=600 border=1>");
      out.println("<tr>");
      out.println("<th> Product id</th><th> Product name</th><th> Product Description</th>");
      out.println("</tr>");
      while(rs.next())
      {
          
          out.print("<tr>");
          out.print("<td>"+rs.getString("pro_id")+"</td>");
          out.print("<td>"+rs.getString("pro_name")+"</td>");
          out.print("<td>"+rs.getString("pro_desc")+"</td>");
          out.print("</tr>");
                  
                  
      }
      out.println("</table>");

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