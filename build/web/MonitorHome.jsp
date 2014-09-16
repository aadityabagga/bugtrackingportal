<%-- 
    Document   : MonitorHome
    Created on : Jul 25, 2013, 12:27:51 AM
    Author     : aaditya
--%>

<!DOCTYPE html>
<html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include  file="MonitorMenu.jsp" %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
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
        
        <%
            String name=(String)session.getAttribute("uname");
            if(name==null)
                out.println("<br><center><h3>You are not logged in</h3></center>");
            else
                out.println("<br><center><h3>Hello <u>"+name+"</u> !</h3></center>");
         %>
        <br>
   <%
        //Cookies
            
         boolean cookieFound=false;
            Cookie cookieSet[]=request.getCookies();
            Cookie myCookie=null;
            
            if(cookieSet!=null) //cookies found
            {
                for(int i=0;i<cookieSet.length;i++) //check cookies to find the monitors cookies
                {
                    if(cookieSet[i].getName().equals("monitors"))    //cookie with name 'monitors'
                    {
                        cookieFound=true;
                        myCookie=cookieSet[i];
                        break;
                    }
                }
            }
                        
            
            if(cookieFound==false)  //cookie not found
            {
                //out.println("<u>Welcome</u><br>");
            }
            else    //cookie found
            {
                int temp=Integer.parseInt(myCookie.getValue());
                out.println("<br> You have "+temp+" new notifications<br>");
             }
        
%>        
    </center>
    
    
    
    </body>
</html>
