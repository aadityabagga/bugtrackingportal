<%-- 
    Document   : AddNewMonitor
    Created on : Jul 28, 2013, 2:53:57 AM
    Author     : aaditya
--%>

<!DOCTYPE html>
<html>

<%@page errorPage="ErrorPage.jsp" contentType="text/html" pageEncoding="UTF-8"%>

<%@include  file="MonitorMenu.jsp" %>



<%
            
            
             String name=(String)session.getAttribute("uname");
            if(name==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
            
            %>



    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Monitor</title>
        
        <script>
        function validate(form)
            {
                var f1=form.nm.value;
                var f2=form.pwd.value;
                var f3=form.cp_pwd.value;
                
                if(f1==="")
                {
                    alert("Please enter username");
                    return false;
                }
                if(f2==="")
                {
                    alert("Please enter password");
                    return false;
                }
                
                if(f2!==f3)
                {
                    alert("Password and Confirm password dont match");
                    return false;
                }
                return true;
            }
   </script>
        
    </head>
    <body>
        
        <center>
              
        <form method="post" action="AddMonitor" onsubmit="return validate(this);">
            
            <h3><u>Add New Monitor:</u></h3>
            <br>
            <table align="center">
  <tr>
    <td >Enter Monitor Name </td>
    <td align="center" ><input type="text" name="nm"></td>
  </tr>
  <tr>
    <td> Enter Password </td>
    <td><input type="password" name="pwd"></td>
  </tr>
  <tr>
   
                    <td>Confirm password:</td>
                    <td><input type="password" name="cp_pwd"></td>
                
                
  </tr>
  <tr>
      <td colspan="2"><div align="center">
        <input type="submit" value="Add Monitor">
      </div></td>
  </tr>
</table>

            
            
            
            <%
                
                String msg=(String)request.getAttribute("msg");
                
                       
            if(msg!=null)
                out.println("<br><br><font color=red>"+msg+"</font>");
            
            %>
             
          </form>
            
            <br>
            <br>
            <a href="MonitorHome.jsp">Back to Home</a>
        
    </center>
        
        
    </body>
</html>
