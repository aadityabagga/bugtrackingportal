<%-- 
    Document   : ErrorPage
    Created on : Jul 10, 2013, 5:15:04 PM
    Author     : aaditya
--%>

<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="CommonMenu.jsp"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body><center>
        <h1>Hello !</h1>
        <%
            out.println("Some error has occured at the server or you were not logged in properly. <br>Please try again later :)");
            %>
            <br>
            <br>
            <a href="Login.jsp">Click to Login..</a>
    </center>
    </body>
</html>
