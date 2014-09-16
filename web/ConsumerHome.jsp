<%-- 
    Document   : ConsumerHome
    Created on : Jul 15, 2013, 3:46:11 AM
    Author     : aaditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        
        <%@include file="ConsumerMenu.jsp" %>
    <center>
        
        <%
            String msg=(String)request.getAttribute("msg");
        %>
        <br>
        <%
            if(msg!=null)
            {
                  out.println("<div class='message thank-message'><p><strong>");
                  out.println(msg);
                  out.println("</strong></p></div>");
             }     
        %>
        <br>
        <%
            
            String name=(String)session.getAttribute("uname");
        String role=(String)session.getAttribute("rl");
       
            
            if(name==null)
                out.println("<center><h3>You are not logged in.</h3></center>");
            else
            {
                out.println("<h3>Hello <u>"+name+ "</u> !</h3><br>");
            }
         %>
        
        
        <%
            
            //Cookies
            
         boolean cookieFound=false;
            Cookie cookieSet[]=request.getCookies();
            Cookie myCookie=null;
            
            if(cookieSet!=null) //cookies found
            {
                for(int i=0;i<cookieSet.length;i++) //check cookies to find one with the name of econsumer
                {
                    if(cookieSet[i].getName().equals(name))    //cookie with name of the consumer
                    {
                        cookieFound=true;
                        myCookie=cookieSet[i];
                        break;
                    }
                }
            }
                        
            
            if(cookieFound==false)  //cookie not found
            {
               // out.println("");
            }
            else    //cookie found
            {
                int temp=Integer.parseInt(myCookie.getValue());
                out.println("<br> You have "+temp+" new notifications<br>");
             }
        
      %>
      <br>
      If you are here for the first time, please visit our <a href='Help.jsp'><b>Help</b></a> page for further information.<br>
      Additionally you can view it any time by clicking on the 'Help!' button on the menu any time.<br>
      
        
        
    </center>
        
    </body>
</html>
