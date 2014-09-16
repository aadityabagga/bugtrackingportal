<%-- 
    Document   : DeleteExpert
    Created on : 15 Jul, 2013, 2:22:57 PM
    Author     : aaditya
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Delete Expert</title>
    </head>
<%@include file="MonitorMenu.jsp"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<body>
<center>
<%
try
{
    
    
               
            
             String uname=(String)session.getAttribute("uname");
            if(uname==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
            
    
    
      String name=null;
      Class.forName("com.mysql.jdbc.Driver");
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugportal","root","password");
      Statement st=con.createStatement();
      ResultSet rs=st.executeQuery("Select * from experts");
      out.println("<table align=center height=50 width=600 border=1 >");
      out.println("<center><h3><u>Delete Expert</u></h3><br></center>");
      out.println("<tr>");
      out.println("<th> Name of expert</th><th> Domain</th><th> Delete Expert</th>");
      
      out.println("</tr>");
      while(rs.next())
      {
          
          out.print("<tr>");
          out.print("<td>"+rs.getString("username")+"</td>");
          out.print("<td>"+rs.getString("domain")+"</td>");
          out.print("<td align=center><a href=DeleteExpertLogic?expid="+rs.getString("expert_id")+"><img height=35 width=40 src='images/delete.jpg'></a></td>");
          out.print("</tr>");
                  
                  
      }
      out.println("</table>");
      
      
         
            if(request.getAttribute("NAME")!=null)
        {
            String nam=(String)request.getAttribute("NAME");
            out.println("<br><br><center><font size=2 color=red>Expert with name '"+nam+"' deleted Successfully</font></center>");
        
        }
      
           
}
catch(Exception e)
{
    out.println(e);
}
%>
</center>
</body>
</html>