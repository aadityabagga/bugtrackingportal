<%-- 
    Document   : Login
    Created on : Jul 25, 2013, 7:54:39 PM
    Author     : aaditya
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>

        <script>
            function validateLogin(form)
            {
                var f1 = form.nm.value;
                var f2 = form.pw.value;

                if (f1 === "")
                {
                    alert("Please enter Username");
                    return false;
                }
                if (f2 === "")
                {
                    alert("Please enter Password");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
    <center>

        <%@include file="CommonMenu.jsp"%>

        <br>
        
        <%
            String str=request.getParameter("msg");
            String msg=(String)request.getAttribute("msg");
            
            if(msg!=null)
            {
                  out.println("<div class='message error-message'><p><strong>");
                  out.println(msg);
                  out.println("</strong></p></div>");
            }     
            
            if(str!=null)
            {
                  out.println("<div class='message error-message'><p><strong>");
                  out.println(str);
                  out.println("</strong></p></div>");
            }     

        %>

        
        <br>
        <fieldset id="login">
            <form name="loginForm" method="post" action="ValidateLogin" onsubmit="return validateLogin(this);">

                <h4>Members login</h4>

                <p class="clearfix"><label for="username">Username</label>   
                    <input id="username" type="text" name="nm"/></p>

                <p class="clearfix"><label for="password">Password</label>
                    <input id='password' type="password" name="pw"/></p>

                <p class="clearfix"><label>
                        Select Role
                        <select name="rl" style="width: 1.12in; height: 0.3in">
                            <option value="consumer" selected>
                                Consumer
                            </option>
                            <option  value="monitor">
                                Monitor
                            </option>
                            <option  value="expert">
                                Expert
                            </option>
                        </select>
                    </label>
                </p>

                <input id="submit" type="submit" value="">
            </form>

        </fieldset>

 
    </center>
</body>
</html>