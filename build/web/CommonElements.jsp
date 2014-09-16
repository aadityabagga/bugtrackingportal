<%-- 
    Document   : CommonElements
    Created on : Jul 14, 2013, 6:16:39 PM
    Author     : aaditya
--%>

<%@page errorPage="ErrorPage.jsp" import="java.util.Date" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <title></title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    </head>
    <body>
    <center>
        
        <!-- Header -->
        <div id="header">
            <div class="shell">

                <div id="head">
                    <h1>BUG TRACKING PORTAL</h1>
                    <div class="right">
                        <p>
                            <%
                                Date obj = new Date();
                                out.println(obj);
                            %>

                    </div>
                </div>


            </div>
        </div>
        <!-- End Header -->
        
    </center>
    </body>
</html>
