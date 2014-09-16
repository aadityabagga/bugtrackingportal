<%-- 
    Document   : Reports
    Created on : Aug 24, 2013, 12:36:43 AM
    Author     : aaditya
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reports</title>
    </head>
    
    <%@include  file="MonitorMenu.jsp" %>
    
    <body>
    <center>
           <%
                    
               
                   
                    int t=(Integer)request.getAttribute("total");
                    int a=(Integer)request.getAttribute("assigned");
                     int s=(Integer)request.getAttribute("solved");
                      Double sc=(Double)request.getAttribute("success_rate");
                      
                      out.println("<br>");
                out.println("<table align=center border=1>");

                out.println("<tr>");
                out.println("<th colspan=2>Bugs</th>");
                out.print("</tr>");
                
                out.println("<tr>");
                out.println("<th>Total Bugs</th>");
                out.print("<td align=center>"+t+"</td>");
                out.print("</tr>");
                
                out.println("<tr>");
                out.println("<th> Bugs Assigned</th>");
                out.print("<td align=center>"+a+"</td>");
                out.print("</tr>");
                
                out.println("<tr>");
                out.println("<th> Bugs Solved</th>");
                out.print("<td align=center>"+s+"</td>");
                out.print("</tr>");
                
                out.print("<tr>");
                out.println("<th>Success Rate</th>");
                 out.print("<td><font color=red>"+sc+"</font></td>");
                out.print("</tr>");
                   
               
                out.println("</table>");
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugportal","root","password");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("Select * from experts");
                
                out.println("<br><br><table align=center border=1 >");
     
                out.println("<tr>");
                out.println("<th colspan=5>Bugs by Experts</th>");
                out.println("</tr>");
                
                out.println("<tr>");
                out.println("<th> Expert Name</th><th> Domain</th><th> Assigned</th><th> Solved</th><th> Success Rate</th>");
                out.println("</tr>");
                while(rs.next())
                {
                        String ename=rs.getString("username");
                        
                        PreparedStatement pst2=con.prepareStatement("select * from bugs where assign_to=?");
             
                        pst2.setString(1,ename);
            
                        ResultSet rs2=pst2.executeQuery();
            int tot=0,solv=0;
            while(rs2.next())
            {
                tot=tot+1;
                if(rs2.getString("status").equals("Solved"))
                    solv=solv+1;
                                   
            }
            
            double suc=(solv/(tot*1.0))*100.0;
         
                        out.print("<tr>");
                        out.print("<td>"+ename+"</td>");
                        out.print("<td>"+rs.getString("domain")+"</td>");
                        out.print("<td>"+tot+"</td>");
                        out.print("<td>"+solv+"</td>");
                        out.print("<td>"+suc+"</td>");
                        out.print("</tr>");
                                   
                 }
                out.println("</table>");
                
        %>
        </center>
        
    </body>
</html>
