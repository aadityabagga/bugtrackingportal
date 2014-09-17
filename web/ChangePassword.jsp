<%-- 
    Document   : ChangePassword
    Created on : Jul 22, 2013, 3:27:27 AM
    Author     : aaditya
--%>

<!DOCTYPE html>

<html>

<%
            
            
             String name=(String)session.getAttribute("uname");
            if(name==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
            
            %>



<%@page errorPage="ErrorPage.jsp" contentType="text/html" pageEncoding="UTF-8"%>

<%!String menu=null;%>
<%
    String rol=(String)session.getAttribute("rl");
    
    if(rol.equals("consumer"))
        menu="ConsumerMenu.jsp";
    else if(rol.equals("monitor"))
        menu="MonitorMenu.jsp";
    else if(rol.equals("expert"))
        menu="ExpertMenu.jsp";
    
%>
<jsp:include page="<%=menu%>"/>


    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <script>
            function validate(form)
            {
                var f1=form.pwd.value;
                var f2=form.new_pwd.value;
                var f3=form.new_cp_pwd.value;
                if(f2!==f3)
                {
                    alert("New password and Confirm password dont match");
                    return false;
                }
                return true;
            }
            </script>
    </head>
    <body>
        <center><h3>Change Password</h3>
        <br>
        <%
            
            String role=(String)session.getAttribute("rl");
            
        %>
        <form name="changepw" method="post" action="ChangePassword" onsubmit="return validate(this);">
            <table align="center" border="0">
                <tr>
                    <td>Enter current password:</td>
                    <td><input type="password" name="pwd"></td>
                </tr>
                <tr>
                    <td>Enter new password:</td>
                    <td><input type="password" name="new_pwd"></td>
                </tr>
                <tr>
                    <td>Confirm new password:</td>
                    <td><input type="password" name="new_cp_pwd"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input type="submit" value="Change Password"></td>
                </tr>
            </table>
          </form>
        <br>
      <!--Error message-->
            <font color="red">
            
        <%
            String msg=(String)request.getAttribute("msg");
            if(msg!=null)
                out.println(msg);
        
        %>
            
            </font>
      
            <!--Success message-->
            <font color="green">
            
        <%
            String msgs=(String)request.getAttribute("msgs");
            if(msgs!=null)
                out.println(msgs);
        
        %>
            
            </font>
            <br>
            <br>
            <%
            if(role.equals("consumer"))
                 out.println("<a href='ConsumerHome.jsp'>Back to Home</a>");
            else if (role.equals("monitor"))
                out.println("<a href='MonitorHome.jsp'>Back to Home</a>");
            else if (role.equals("expert"))
                out.println("<a href='ExpertHome.jsp'>Back to Home</a>");
        
        
        %>
        </center>
    </body>
</html>
