<%-- 
    Document   : SignOut
    Created on : Jul 21, 2013, 10:09:15 PM
    Author     : aaditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="CommonMenu.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bug Tracking Portal</title>
    </head>
    <body>
    <center>
        <%
        HttpSession s1=request.getSession(false);
            if(s1!=null)
            {
                s1.invalidate();
                s1=null;
                out.println("<br><h3>Logout Successful!</h3><br><a href=Login.jsp>Re Login</a>");
                
            }
            else
                out.println("<br><h3>Your time has expired or you were not logged in..</h3><br><a href=Login.jsp>Re Login</a>");
            
         %>
    </center>
    </body>
</html>
