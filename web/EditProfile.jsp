<%-- 
    Document   : EditProfile
    Created on : Jul 27, 2013, 12:12:37 AM
    Author     : aaditya
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page errorPage="ErrorPage.jsp" contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        
        <script>
        function validateEdit(form)
            {
                var f1=form.t1.value;
                var f2=form.t6.value;
                
                if(f1==="")
                {
                    alert("Please enter username");
                    return false;
                }
                if(f2==="")
                {
                    alert("Please enter valid email");
                    return false;
                }
                return true;
            }
        </script>
        
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
        try 
        {  
            
                        
            
             String name=(String)session.getAttribute("uname");
            if(name==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
            
            
            
            HttpSession s=request.getSession(false);
            String loginname=(String)s.getAttribute("uname");
            
            if(loginname==null)
            {
                out.println("<i>You are not logged in</i>");
            }

            
            String role=(String)s.getAttribute("rl");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugportal","root","password");
            PreparedStatement pst=null;
            
            if(role.equals("expert"))
                  pst=con.prepareStatement("select * from experts where username=?");
            else if(role.equals("consumer"))
                pst=con.prepareStatement("select * from consumers where username=?");
            else
                out.println("Role couldnt be fetched from database");
            
              pst.setString(1,loginname);
              
              
              ResultSet rs=pst.executeQuery();
              
              if(rs.next())
              {
                  String sex=rs.getString("gender");
                    String dateofbirth=rs.getString("dob");
                    String address=rs.getString("address");
                    String city=rs.getString("city");
                    String contactno=rs.getString("phone");
                    String email=rs.getString("email");
                    out.println("<center>");
                    out.println("<h3>Edit Profile</h3>");
                    out.println("<br>");
                    
                    String msg=(String)request.getAttribute("msg");
                    if(msg!=null)
                        out.println("<font color=red>"+msg+"</font><br><br>");
                    
                    out.println("<font color=blue><u>Current Details:</u></font>");
                    out.println("<br><br>");
                    out.println("<form method=post action=UpdateProfileServlet onsubmit='return validateEdit(this);'>");
                    out.println("<table align=center border=0>");
                    
                    out.println("<tr>");
                    out.println("<td>User name:</td>");
                    out.println("<td>"+loginname+"</td>");
                    out.println("</tr>");
                    
                    out.println("<tr>");
                    out.println("<td>Gender:</td>");
                    out.println("<td><input type=text name=t2 value='"+sex+"'></td>");
                    out.println("</tr>");
                    
                    out.println("<tr>");
                    out.println("<td>Date of birth:</td>");
                    out.println("<td><input type=text name=t3 value='"+dateofbirth+"'></td>");
                    out.println("</tr>");
                    
                    out.println("<tr>");
                    out.println("<td>Address:</td>");
                    out.println("<td><input type=text name=t4 value='"+address+"'></td>");
                    out.println("</tr>");
                    
                     out.println("<tr>");
                    out.println("<td>City:</td>");
                    out.println("<td><input type=text name=t7 value='"+city+"'></td>");
                    out.println("</tr>");
                    
                    out.println("<tr>");
                    out.println("<td>Contactno.:</td>");
                    out.println("<td><input type=text name=t5 value='"+contactno+"'></td>");
                    out.println("</tr>");
                    
                    out.println("<tr>");
                    out.println("<td>Email-id:</td>");
                    out.println("<td><input type=text name=t6 value='"+email+"'></td>");
                    out.println("</tr>");
                    
                    out.println("<tr>");
                    out.println("<td align=center colspan=2><input type=submit value='Update'></td>");
                    out.println("</tr>");
                    
                    out.println("</table>");
                    out.println("</form>");
                    
                    
                    
                    out.println("<br><font color=blue><u>Edit profile and click update to view the updated changes!</u></font>");
                    out.println("<br><br>");
                    
                                        
                    if(role.equals("consumer"))
                 out.println("<a href='ConsumerHome.jsp'>Back to Home</a>");
                    
                  else if (role.equals("expert"))
                out.println("<a href='ExpertHome.jsp'>Back to Home</a>");
                    
        out.println("</center>");
                  
              }
              else
              {
                  out.println("Database couldnt be accessed");
              }
              
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
ct