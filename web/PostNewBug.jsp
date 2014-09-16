<%-- 
    Document   : PostNewBug
    Created on : Jul 21, 2013, 4:11:42 PM
    Author     : aaditya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page errorPage="ErrorPage.jsp" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post New Bug</title>
        
    </head>
    <body>
    <center>
        <%@include file="ConsumerMenu.jsp" %>
        <%
            
            
             String name=(String)session.getAttribute("uname");
            if(name==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
            
        %>
        
        <center><h3><u>Post Bug</u></h3></center>
        <br>
        <form action="PostNewBug" method="post">
            <table border="0" align="center">
                <tr>
                    <td >Choose Category</td>
                    <td>
                        <select name="cat">
                            <option value="Laptop" selected>
                                Laptop
                            </option>
                            <option value="Desktop">
                                Desktop
                            </option>
                            <option value="Mobile">
                                Mobile
                            </option>
                            <option value="Tab">
                                Tablet
                            </option>
                            
                            <%
                                    
                                    
                                Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugportal","root","password");
            
            String query="Select * from products";
            Statement st=con.createStatement();
            
            ResultSet rs=st.executeQuery(query);
            
            while(rs.next())
                         
                  out.println("<option value="+rs.getString("pro_name")+">"+rs.getString("pro_name")+"</option>");
                                      
                  
              %>
                            
                            
                            
                            
                            
                        </select>
                    </td>
                    
                </tr>
                <tr>
                    <td>Overview </td>
                    <td><textarea rows="1" cols="50" name="ov"></textarea>
                </tr>
                <tr>
                    <td>Bug Description </td>
                    <td><textarea rows="10" cols="50" name="desc"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2"><div align="center">
                            <input type="submit" value="Post new Bug">
                        </div></td>
                </tr>
            </table>
        </form>
    </center>
    </body>
</html>
