<%-- 
    Document   : CommonMenu2
    Created on : Jul 26, 2013, 9:43:32 PM
    Author     : aaditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    <script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
    <link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        
        <table align="center"><tr><td>
                    
    <ul id="MenuBar1" class="MenuBarHorizontal">
        <li><a href="index.jsp">HOME</a>
         <li><a class="MenuBarItemSubmenu" href="#">ABOUT</a>
        <ul>
          <li><a href="AboutUs.jsp">About Us</a></li>
          <li><a href="FAQ.jsp">FAQ</a></li>
          <li><a href="ContactUs.jsp">Contact Us</a></li>
        </ul>
      </li>
      <li><a class="MenuBarItemSubmenu" href="#">CONSUMER</a>
        <ul>
          
          <li><a href="Login2.jsp?role=consumer">Login</a></li>
          <li><a href="Register.jsp">Sign Up</a></li>
          
        </ul>
      </li>

      <li><a class="MenuBarItemSubmenu" href="#">EXPERT</a>
          <ul>
      <li><a href="Login2.jsp?role=expert">Expert Login</a></li>
       </ul>
      </li>
      
      <li><a class="MenuBarItemSubmenu" href="#">MONITOR</a>
          <ul>
     <li><a href="Login2.jsp?role=monitor">Monitor Login</a>
          </ul>
      </li>
        
  </ul>
                </td></tr></table>
    
    <script type="text/javascript">
<!--
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
//-->
    </script>
   
    <hr>
    </body>
</html>
