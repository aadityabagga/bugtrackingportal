<%-- 
    Document   : DeleteProduct
    Created on : 15 Jul, 2013, 2:22:57 PM
    Author     : aaditya
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<%@include file="MonitorMenu.jsp"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="static Common.DatabaseConnect.DatabaseConnect"%>
<%@page import="java.sql.Connection"%>


    <head>
        
        <title>Delete Product</title>
    </head>
    <body>
    <center>
    
<%

    try {


      
            
             String uname=(String)session.getAttribute("uname");
            if(uname==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
            
        


        String name = null;
        int id;
        
        Connection con = DatabaseConnect();
        
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from products");
        
        out.println("<center><h3><u>Delete Product</u></h3><br></center>");
        
        out.println("<table align=center height=50 width=600 border=1 >");
        out.println("<tr>");
        out.println("<th> Product id</th> <th>Product name</th> <th> Delete Product</th>");


        out.println("</tr>");

        while (rs.next()) {
            id = rs.getInt("pro_id");
            name = rs.getString("pro_name");
            out.print("<tr>");
            out.print("<td>" + id + "</td>");
            out.print("<td>" + name + "</td>");
            out.print("<td align=center><a href=DeleteProductLogic?delete=" + id + "><img height=35 width=40 src='images/delete.jpg'></a></td>");
            out.print("</tr>");


        }
        out.println("</table>");

        if (request.getAttribute("NAME") != null) {
            Integer prod_id = (Integer)request.getAttribute("NAME");
            out.println("<br><center><font color=red>Product with id " + prod_id + " deleted Successfully</font></center>");

        }
    } catch (Exception e) {
        out.println(e);
    }

%>

    </center>
</body>
</html>