<%-- 
    Document   : ViewProfile
    Created on : Jul 27, 2013, 5:54:36 AM
    Author     : aaditya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page errorPage="ErrorPage.jsp" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Profile</title>
    </head>
    <body>
            
        
<%!String menu=null;%>
<%
    String rol=(String)session.getAttribute("rl");
    
    if(rol.equals("consumer"))
        menu="ConsumerMenu.jsp";
    else if(rol.equals("expert"))
        menu="ExpertMenu.jsp";
    
%>
<jsp:include page="<%=menu%>"/>
        
        
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
                String loginname=(String)session.getAttribute("uname");
                
            
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugportal","root","password");
            
             
             PreparedStatement pst=con.prepareStatement("select * from "+rol+"s where username=?");
                 pst.setString(1,loginname);
                 ResultSet rs=pst.executeQuery();
                 
            out.println("<center>");
            
            out.println("<h3><b>View profile</b></h3><br>");
             out.println("<table height=100 align=center border=1>");
             out.println("<tr>");
              out.println("<th width=80>user id</th>");
              out.println("<th width=120>user name</th>");
              out.println("<th width=120>Email-id</th>");
              out.println("<th width=80>Sex</th>");
              out.println("<th width=120>Date of birth</th>");
              out.println("<th width=200>Address</th>");
              out.println("<th width=80>City</th>");
              out.println("<th width=120>Contact No.</th>");
              
              out.println("</tr>");
              
           while(rs.next())
           {  
               out.println("<tr>");
              out.println("<td>"+rs.getString(rol+"_id")+"</td>"); 
              out.println("<td>"+rs.getString("username")+"</td>");
              out.println("<td>"+rs.getString("email")+"</td>");
              out.println("<td>"+rs.getString("gender")+"</td>");
              out.println("<td>"+rs.getString("dob")+"</td>");
              out.println("<td>"+rs.getString("address")+"</td>");
              out.println("<td>"+rs.getString("city")+"</td>");
              out.println("<td>"+rs.getString("phone")+"</td>");
                            
              out.println("</tr>");           
           }
   
           out.println("</table>");
           
           out.println("<br><a href=EditProfile.jsp>Edit profile</a>");
           
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
        
    </body>
</html>
