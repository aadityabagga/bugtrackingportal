<%-- 
    Document   : ExpertHome
    Created on : Jul 15, 2013, 3:46:11 AM
    Author     : aaditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import=" javax.servlet.http.Cookie"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        
    </head>
    <body>
        
        <%@include file="ExpertMenu.jsp" %>
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
        
        %>
        
        
        <%

            if(name==null)
                out.println("<center><h3>You are not logged in</h3></center>");
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
                for(int i=0;i<cookieSet.length;i++) //check cookies to find that one with name of expert
                {
                    if(cookieSet[i].getName().equals(name))    //cookie with name of that expert
                    {
                        cookieFound=true;
                        myCookie=cookieSet[i];
                        break;
                    }
                }
            }
                        
            
            if(cookieFound==false)  //cookie of that expert not found
            {
                //out.println("Welcome");
            }
            else    //cookie for that expert found
            {
                int temp=Integer.parseInt(myCookie.getValue());
                out.println("You have "+temp+" new notifications");
             }
        
      %>
        
    </center>
        
    </body>
</html>
