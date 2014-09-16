<%-- 
    Document   : MonitorMenu.jsp
    Created on : 21 Jul, 2013, 10:29:36 AM
    Author     : aaditya
--%>


<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />

        <script>
            function validate()
            {
                if (!confirm("Are you sure you want to Sign Out?"))
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
                        <li><a href="MonitorHome.jsp"><span>Home</span></a></li>
                        <li><a href="ViewBugsMon?state=Unsolved"><span>Pending Bugs</span></a></li>
                        <li><a href="ViewBugsMon?state=All"><span>All Bugs</span></a></li>
                        <li><a href="Reports"><span>Reports</span></a></li>
                    </ul>
                </div>
                <!-- End Navigation -->

            </div>
        </div>
        <!-- End Header -->


        <nav>
            <ul>

                <li>
                    <a href="#">Bugs</a>
                    <ul>
                        <li><a href="ViewBugsMon?state=Pending">Unassigned Bugs</a></li>
                        <li><a href="ViewBugsMon?state=Assigned">Assigned Bugs</a></li>
                        
                        <li><a href="ViewBugsMon?state=Unsolved">Unsolved Bugs</a></li>
                        <li><a href="ViewBugsMon?state=Solved">Solved Bugs</a></li>
                       
                        <li><a href="ViewBugsMon?state=All">All Bugs</a></li>
                    </ul>
                </li>


                <li><a href="#">Experts</a>
                    <ul>
                        <li><a href="AddExpert.jsp">Add Expert</a></li>
                        <li><a href="DeleteExpert.jsp">Delete Expert</a></li>
                        <li><a href="ViewAllExperts.jsp">View All Experts</a></li>
                    </ul>
                </li>

                <li><a href="#">Products</a>
                    <ul>
                        <li><a href="AddProduct.jsp">Add Product</a></li>
                        <li><a href="DeleteProduct.jsp">Delete Product</a></li>
                        <li><a href="ViewAllProducts.jsp">View All Products</a></li>
                    </ul>
                </li>

                <li><a href="#">Miscellaneous</a>
                    <ul>
                        <li><a href="AddNewMonitor.jsp">Add New Monitor</a></li>
                        <li><a href="ChangePassword.jsp">Change Password</a></li>
                        <li><a href="ViewAllConsumers">View All Consumers</a></li>
                        <li><a href="SignOut.jsp" onclick="return validate();">Log Out</a></li>
                   </ul>
                </li>


            </ul>

        </nav>

        <br>


    </center>
</body>
</html>
