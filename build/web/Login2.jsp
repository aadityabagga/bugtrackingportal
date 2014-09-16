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

  
        
        <%@include file="CommonMenu.jsp"%>

        
          <center>
        <br>
        
        <form name="loginForm" method="post" action="ValidateLogin" onsubmit="return validateLogin(this);">

            <%String rol = request.getParameter("role");%>

            

            <h3><u>Login-<%=rol%></u></h3>
            <br>
            
            
            
            <table border="0" align="center">
                <tr>
                    <td >Enter Login Name </td>
                    <td align="center" ><input type="text" name="nm"></td>
                </tr>
                <tr>
                    <td> Enter Password </td>
                    <td><input type="password" name="pw"></td>
                </tr>
                
                            <%

                                    out.println("<input type=hidden name=rl value='"+rol+"'>");
                                
                            %>
                            <tr></tr>
                <tr>
                    <td colspan="2"><div align="center">
                            <input id='submit' type="submit" value="Login">
                        </div></td>
                </tr>
            </table>

            
            <br>

            <%
                String str = request.getParameter("msg");
                String msg = (String) request.getAttribute("msg");

                if (str != null) {
                    out.println("<br><br><font color=red>" + str + "</font>");
                }

                if (msg != null) {
                    out.println("<br><br><font color=red>" + msg + "</font>");
                }

            %>

            
        </form>
    
            
      
    </center>


</body>
</html>