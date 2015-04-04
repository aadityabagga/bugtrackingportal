<%-- 
    Document   : AddExpert
    Created on : Jul 15, 2013, 12:05:08 AM
    Author     : aaditya
--%>

<!DOCTYPE html>
<html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="MonitorMenu.jsp"%>


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Product</title>
    </head>

<%
            
            
             String name=(String)session.getAttribute("uname");
            if(name==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
            
            %>



    
    <body>
        <center>
        
        
            <h2>Add product</h2><br>
            <form method="post" action="AddProductLogic">
                <table>
                    
                    <tr>
                        <td>Product Name</td>
                        <td>
                                <input type="text" name="pro_name">
                            </td>
                    </tr>
                    <tr>
                        <td>Product Description</td>
                        <td>
                                <input type="text" name="pro_desc">
                            </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                                <input type="submit"  value="Add Product">
                            </td>
                    </tr>
                </table>
                
            </form>
    
        </center>
    </body>
</html>
