
<%-- 
    Document   : AssignExpert
    Created on : Jul 26, 2013, 5:12:08 AM
    Author     : aaditya
--%>

<%@page errorPage="ErrorPage.jsp" import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
            
            
             String name=(String)session.getAttribute("uname");
            if(name==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
            
            %>



<%@include file="MonitorMenu.jsp"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Expert</title>
        
        <script>
            function validate()
            {
                if (!confirm("Are you sure you want to assign bug to expert ?"))
                    return false;

                return true;
            }
        </script>
        
    </head>
    <body>
    <center>
        <%
            
            response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  
  HttpSession ses=request.getSession(false);
            String nam=(String)ses.getAttribute("uname");
            if(nam==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
            
        
            try
            {
                int bug_no=Integer.parseInt(request.getParameter("bugno"));
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugportal","root","password");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("Select * from experts");
                
                out.println("<center><h3><font color=blue><u>Assign bug to expert</u></font></h3></center><br>");
                out.println("<table align=center height=150 width=500 border=2 >");
     
                out.println("<tr>");
                out.println("<th> Expert Name</th><th> Domain</th><th>Workload</th><th>Success Rate</th>");
                out.println("</tr>");
                while(rs.next())
                {
                        String ename=rs.getString("username");
                        int eid=rs.getInt("expert_id");
                        out.print("<tr>");
         
                        out.print("<td><a href=AssignToExpert?expert_id="+eid+"&bug_no="+bug_no+" onclick='return validate();'>"+ename+"</td></a>");
                        
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
                     
                        out.print("<td>"+rs.getString("domain")+"</td>");
                        out.print("<td>"+tot+"</td>");
                        out.print("<td>"+suc+"</td>");
                        out.print("</tr>");
                                   
                 }
                out.println("</table>");
                

              } 
        
              catch(Exception e)
              {
                out.println("Some Exception occurs"+e);
              }
              finally
              {            
                out.close();
              }
    
        %>

    </center>
    </body>
</html>

