<%-- 
    Document   : ViewAllBugs
    Created on : 22 Jul, 2013, 11:03:42 PM
    Author     : aaditya
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Bugs</title>
        
        <script>
            function validateShow()
            {
                if(!confirm("Are you sure you want the consumer to see this solution?"))
                    return false;
               
                return true;
            }
            </script>
            
            <script>
            function validateDel()
            {
                if(!confirm("Are you sure you want to delete this bug?"))
                    return false;
               
                return true;
            }
            </script>
                 
    </head>
    <body>
    <center>

<%@include file="MonitorMenu.jsp"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page errorPage="ErrorPage.jsp" contentType="text/html" pageEncoding="UTF-8"%>
<%
   
    response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
      
             String name=(String)session.getAttribute("uname");
            if(name==null)
            {
                request.setAttribute("msg","<i>You are not logged in. Please Login</i>");
                
                RequestDispatcher disp=getServletContext().getRequestDispatcher("/Login.jsp");
                disp.forward(request, response);
            }
       
        
        
       
            ResultSet rs=(ResultSet)request.getAttribute("bugs");
            String state=(String)request.getAttribute("path");
            
                    
            out.println("<center><h3><font color=blue><u><i>View "+state+" Bugs</i></u></font></h3></center>");
           
      
      
      out.println("<br><center>");
      String msg=(String)request.getAttribute("msg");
      if(msg!=null)
      {
          out.println("<div class='message thank-message'><p><strong>");
                  out.println(msg);
                  out.println("</strong></p></div>");
      }
      out.println("</center>");
      
      
      
      
      out.println("<table align=center border=1 >");
         out.println("<tr>");
      out.println("<th> Bug ID</th><th> Posted By</th><th> Posted on</th><th> Domain</th><th> Status</th><th> Assigned to</th><th> Overview</th><th> Description</th><th>Assigned On</th><th>Solved On</th><th> Solution</th><th>Filter</th><th>Feedback</th><th>Delete</th>");
      
      out.println("</tr>");
   
      try
      {
      
      if(state.equals("Unsolved"))
                {
      
      while(rs.next())
      {
          if(rs.getString("status").equals("Assigned")||rs.getString("status").equals("Re-Assigned")||rs.getString("status").equals("Pending"))
          {
          
          out.print("<tr>");
          int bug_no=rs.getInt("bug_id");
          String filter=rs.getString("filter");
          
          out.print("<td>"+bug_no+"</td>");
          
          out.print("<td>"+rs.getString("posted_by")+"</td>");
          out.print("<td>"+rs.getString("posted_on")+"</td>");
          out.print("<td>"+rs.getString("domain")+"</td>");
          
          out.print("<td><a href=AssignExpert.jsp?bugno="+bug_no +">"+rs.getString("status")+"</a></td>");
          out.print("<td><font color=red>"+rs.getString("assign_to")+"</font></td>");
          out.print("<td>"+rs.getString("overview")+"</td>");
          out.print("<td>"+rs.getString("description")+"</td>");
          out.print("<td>"+rs.getString("assign_on")+"</td>");
          out.print("<td>"+rs.getString("solved_on")+"</td>");
          out.print("<td><font color=orange>"+rs.getString("solution")+"</font></td>");
          if(filter.equals("Block") && (rs.getString("status").equals("Assigned")||rs.getString("status").equals("Re-Assigned")))
             out.println("<td><a href=ShowToConsumer?bugno="+bug_no+ " title='Allow consumer to view solution' onclick='return validateShow();'>"+filter+"</a></td>");
          else
            out.print("<td>"+rs.getString("filter")+"</td>");
          out.print("<td>"+rs.getString("feedback")+"</td>");
          out.print("<td><a href=DeleteBug?bugno="+bug_no+" title='Delete bug' onclick='return validateDel();'>Delete</a></td>");
          out.print("</tr>");
                  
          }       
      }
                }
      
      else if(state.equals("Solved") || state.equals("Pending"))
      {
           while(rs.next())
      {
          if(rs.getString("status").equals(state))
          {
          
          out.print("<tr>");
          int bug_no=rs.getInt("bug_id");
          
          out.print("<td>"+bug_no+"</td>");
          
          out.print("<td>"+rs.getString("posted_by")+"</td>");
          out.print("<td>"+rs.getString("posted_on")+"</td>");
          out.print("<td>"+rs.getString("domain")+"</td>");
          
          out.print("<td><a href=AssignExpert.jsp?bugno="+bug_no +">"+rs.getString("status")+"</a></td>");
         
          out.print("<td><font color=red>"+rs.getString("assign_to")+"</font></td>");
          out.print("<td>"+rs.getString("overview")+"</td>");
          out.print("<td>"+rs.getString("description")+"</td>");
          out.print("<td>"+rs.getString("assign_on")+"</td>");
          out.print("<td>"+rs.getString("solved_on")+"</td>");
          
          out.print("<td><font color=orange>"+rs.getString("solution")+"</font></td>");
          out.print("<td>"+rs.getString("filter")+"</td>");
                     
          out.print("<td>"+rs.getString("feedback")+"</td>");
          out.print("<td>Delete</td>");
          out.print("</tr>");
                  
          }     
          
      }
      }
      else if(state.equals("Assigned"))
      {
           while(rs.next())
      {
          if(rs.getString("status").equals("Assigned")||rs.getString("status").equals("Re-Assigned"))
          {
          
          out.print("<tr>");
          int bug_no=rs.getInt("bug_id");
          String filter=rs.getString("filter");
          
          out.print("<td>"+bug_no+"</td>");
          
          out.print("<td>"+rs.getString("posted_by")+"</td>");
          out.print("<td>"+rs.getString("posted_on")+"</td>");
          out.print("<td>"+rs.getString("domain")+"</td>");
          
          out.print("<td><a href=AssignExpert.jsp?bugno="+bug_no +">"+rs.getString("status")+"</a></td>");
         
          out.print("<td><font color=red>"+rs.getString("assign_to")+"</font></td>");
          out.print("<td>"+rs.getString("overview")+"</td>");
          out.print("<td>"+rs.getString("description")+"</td>");
          out.print("<td>"+rs.getString("assign_on")+"</td>");
          out.print("<td>"+rs.getString("solved_on")+"</td>");
          
          out.print("<td><font color=orange>"+rs.getString("solution")+"</font></td>");
          if(filter.equals("Block"))
             out.println("<td><a href=ShowToConsumer?bugno="+bug_no+ " title='Allow consumer to view solution' onclick='return validate();'>"+filter+"</a></td>");
          else
          out.print("<td>"+rs.getString("filter")+"</td>");
                     
          out.print("<td>"+rs.getString("feedback")+"</td>");
          out.print("<td>Delete</td>");
          out.print("</tr>");
                  
          }     
          
      }
      }
      else
      {
          while(rs.next())
      {
          
       out.print("<tr>");
          int bug_no=rs.getInt("bug_id");
          String filter=rs.getString("filter");
          
          out.print("<td>"+bug_no+"</td>");
          
          out.print("<td>"+rs.getString("posted_by")+"</td>");
          out.print("<td>"+rs.getString("posted_on")+"</td>");
          out.print("<td>"+rs.getString("domain")+"</td>");
          
          out.print("<td><a href=AssignExpert.jsp?bugno="+bug_no +">"+rs.getString("status")+"</a></td>");
         
          out.print("<td><font color=red>"+rs.getString("assign_to")+"</font></td>");
          out.print("<td>"+rs.getString("overview")+"</td>");
          out.print("<td>"+rs.getString("description")+"</td>");
          out.print("<td>"+rs.getString("assign_on")+"</td>");
          out.print("<td>"+rs.getString("solved_on")+"</td>");
          out.print("<td><font color=orange>"+rs.getString("solution")+"</font></td>");
          if(filter.equals("Block"))
             out.println("<td><a href=ShowToConsumer?bugno="+bug_no+ " title='Allow consumer to view solution' onclick='return validate();'>"+filter+"</a></td>");
          else
            out.print("<td>"+rs.getString("filter")+"</td>");
          out.print("<td><font color=green>"+rs.getString("feedback")+"</font></td>");
          out.print("<td><a href=DeleteBug?bugno="+bug_no+" title='Delete bug' onclick='return validateDel();'>Delete</a></td>");
          out.print("</tr>");
                  
          }     
          
}
      

      out.println("</table><br><center><a href=#>Back to Top</a></center><br>");
                 
        
}
catch(Exception e)
{
    out.println(e);
}


%>
    </center>
</body>
</html>