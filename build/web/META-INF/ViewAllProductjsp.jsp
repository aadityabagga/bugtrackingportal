<%-- 
    Document   : ViewExpert
    Created on : 15 Jul, 2013, 2:22:57 PM
    Author     : honey
--%>

<%@include file="MonitorMenu.jsp"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

try
{
  Class.forName("com.mysql.jdbc.Driver");
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugpro","root","password");
      Statement st=con.createStatement();
      ResultSet rs=st.executeQuery("Select * from product");
      out.println("<table align=center height=300 width=600 border=5 >");
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