<%-- 
    Document   : ConsumerMenu
    Created on : Jul 25, 2013, 7:54:39 PM
    Author     : aaditya
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        
         <script>
            function validate()
            {
                if(!confirm("Are you sure you want to Sign Out?"))
                    return false;
               
                return true;
            }
            </script>

    </head>
    <body>


    <center>

        <!-- Header -->
        <div id="header">
            <div class="shell">

                <div id="head">
                    <h1>BUG TRACKING PORTAL</h1>
                    <div class="right">
                        <p>
                            <%
                                Date obj = new Date();
                                out.println(obj);
                            %>
                            <br>
                            <%
                                String lname = (String) session.getAttribute("uname");
                                String lrole = (String) session.getAttribute("rl");

                                if (lname == null) {
                                    out.println("<center><h3>You are not logged in..</h3></center>");
                                } else {
                                    out.println("Logged in as <strong>"
                                            + lname + "</strong> [" + lrole + "] |  ");
                                }

                            %>  
                            <a href=SignOut.jsp onclick='return validate();'> <span><strong>Sign Out</strong></span></a>
                        </p>
                    </div>
                </div>

                <!-- Navigation -->
                <div id="navigation">
                    <ul>
                        <li><a href="ConsumerHome.jsp"><span>Home</span></a></li>
                        <li><a href="PostNewBug.jsp"><span>Post Bug</span></a></li>
                        <li><a href="ViewAllBugs?state=Unsolved"><span>Unsolved Bugs</span></a></li>
                        <li><a href="Help.jsp"><span>Help!</span></a></li>
                    </ul>
                </div>
                <!-- End Navigation -->

            </div>
        </div>
        <!-- End Header -->


        <nav>
            <ul>
                <li><a href="ViewAllBugs?state=All">View All Bugs</a></li>
                <li>
                    <a href="#">Bugs</a>
                    <ul>
                        <li><a href="PostNewBug.jsp">Post Bug</a></li>
                        <li><a href="ViewAllBugs?state=Solved">Solved Bugs</a></li>
                        <li><a href="ViewAllBugs?state=Unsolved">Unsolved Bugs</a></li>
                        <li><a href="ViewAllBugs?state=All">All Bugs</a></li>
                    </ul>
                </li>


                <li><a href="#">Profile</a>
                    <ul>
                        <li><a href="ViewProfile.jsp">View profile</a></li>
                        <li><a href="EditProfile.jsp">Edit Profile</a></li>
                        <li><a href="ChangePassword.jsp">Change Password</a></li>
                    </ul>
                </li>
                <li><a href="SignOut.jsp" onclick="return validate();">Sign Out</a></li>
                
                

            </ul>

        </nav>

        <br>


    </center>
</body>
</html>
