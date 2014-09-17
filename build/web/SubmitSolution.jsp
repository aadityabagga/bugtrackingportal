<%-- 
    Document   : SubmitSolution
    Created on : Jul 27, 2013, 6:36:10 AM
    Author     : aaditya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="static Common.DatabaseConnect.DatabaseConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
            
            
             String name=(String)session.getAttribute("uname");
            if(name==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
            
%>


<%@include file="ExpertMenu.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit Solution</title>
        
        <script>
            function validate(form)
            {
                var f1=form.t1.value;
                
                if(f1==="")
                {
                    alert("Solution cannot be blank");
                    return false;
                }
                if(f1.length<10)
                {
                    alert("Submit more detailed solution please");
                    return false;
                }
                return true;
            }
            </script>
        
    </head>
        
    <body>
        
        
            <center><h3><i><u>Submit Solution:</u></i></h3></center>
            <br>
            <center>
                <form  method="post" action="SubmitSolutionServlet" onsubmit="return validate(this);">
                
            
            <%
            
            
            int bugid=Integer.parseInt(request.getParameter("bugid"));
            
            Connection con = DatabaseConnect();
                        
            PreparedStatement pst=con.prepareStatement("select * from bugs where bug_id=?");
            pst.setInt(1,bugid);
            
            out.println("<input type=hidden name=bugid value="+bugid+">");
            
                       
            ResultSet rs=pst.executeQuery();
            rs.next();
            
            out.println("<table width=450 align=center border=1>");
                    
                    out.println("<tr>");
                    out.println("<td>Bug ID :</td><td>"+bugid+"</td>");
                    out.println("</tr>");
                    
            out.println("<tr>");
                out.println("<td>Product name: </td><td>"+rs.getString("domain")+"</td>");
            out.println("</tr>");
            
            out.println("<tr>");
                out.println("<td>Posted By: </td><td>"+rs.getString("posted_by")+"</td>");
            out.println("</tr>");
            
            out.println("<tr>");
           out.println("<td>Assign date and time :</td><td>"+rs.getString("assign_on")+"</td>");
           out.println("</tr>");
           
           out.println("<tr>");
           out.println("<td>Problem: </td><td>'"+rs.getString("description")+"'</td>");
           out.println("</tr>");
           
           out.println("<tr>");
           out.println("<td>Submit solution:</td>");
           out.println("<td><textarea name=t1 rows=5 cols=50 ></textarea></td>");
              out.println("</tr>");
              
                  
              out.println("<tr>");
              out.println("<td colspan=2 align=center><input type=submit value='submit'></td>");
              out.println("</tr>");
                      
              out.println("</table>");
                      
    %>
                      
                      
        </form>
        </center>
        
    </body>
</html>
