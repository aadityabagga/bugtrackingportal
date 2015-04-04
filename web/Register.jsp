<%-- 
    Document   : Register
    Created on : Jul 15, 2013, 12:05:08 AM
    Author     : aaditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        
        <script>
            function validate(form)
            {
                var f1=form.usernm.value;
                var f2=form.passwd.value;
                var f3=form.cpasswd.value;
                var f4=form.email.value;
                var x=form.email.value;
                
                if(f1==="")
                {
                    alert("Please enter username");
                    return false;
                }
                if(f2.length<5)
                {
                    alert("Enter password with 5 or more characters");
                    return false;
                }
                if(f3!==f2)
                {
                    alert("Passwords dont match");
                    return false;
                }
                if (f4==="")
                {
                    alert("Please enter email so that we can get in touch with you");
                    return false;
                }
                
                var atpos=x.indexOf("@");
                var dotpos=x.lastIndexOf(".");
                if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
                {
                    alert("Not a valid e-mail address");
                    return false;
                }
                               
               return true;
            }
            </script>
    </head>
    <body>
        
        <%@include file="CommonMenu.jsp"%>
        <center>
            <br><h1>Register Consumer!</h1>
        Please Enter Details:<br><br>
        <form method="post" action="EnterIntoConsumerDB" onsubmit="return validate(this);">
            <table width="500">
                <tr>
                    <td>User Name:</td>
                    <td><input type="text" name="usernm"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="passwd">
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password:</td>
                    <td><input type="password" name="cpasswd">
                    </td>
                </tr>
                 <tr>
                    <td>Gender:</td>
                    <td><input type="text" name="sex"></td>
                </tr>
                 <tr>
                    <td>Date of birth:</td>
                    <td><input type="text" name="dob"></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email"></td>
                </tr>
                <tr>
                    <td>Contact No.</td>
                    <td><input type="text" name="cno"></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><textarea rows="5" cols="29" name="addrs"></textarea></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td><input type="text" name="city"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Sign Up"></td>
                </tr>
            </table>
        </form>
        
        
        </center>
    </body>
</html>
