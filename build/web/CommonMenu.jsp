<%-- 
    Document   : Home
    Created on : Aug 6, 2013, 6:33:21 PM
    Author     : aaditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
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

                    </div>
                </div>

                            <!-- Navigation -->
			<div id="navigation">
				<ul>
				    <li><a href="index.jsp"><span>Home</span></a></li>
                                    <li><a href="FAQ.jsp"><span>FAQ</span></a></li>
                                    <li><a href="Login.jsp"><span>Login</span></a></li>
                                    <li><a href="Register.jsp"><span>Sign Up</span></a></li>
				    
				</ul>
			</div>
			<!-- End Navigation -->

            </div>
        </div>
        <!-- End Header -->

        
        <nav>
            <ul>
             
                <li>
                    <a href="#">About</a>
                    <ul>
                        <li><a href="AboutUs.jsp">About Us</a></li>
                        <li><a href="FAQ.jsp">FAQ</a></li>
                        <li><a href="ContactUs.jsp">Contact Us</a></li>
                    </ul>
                </li>
                <li>    
                    <a href="#">Consumer</a>
                    <ul>
                        
                        <li><a href="Login2.jsp?role=consumer">Consumer Login</a></li>
                        <li><a href="Register.jsp">Sign Up</a></li>

                    </ul>
                </li>

                <li><a href="#">Expert</a>
                    <ul>
                        <li><a href="Login2.jsp?role=expert">Expert Login</a></li>
                    </ul>
                </li>

                <li><a href="#">Monitor</a>
                    <ul>
                        <li><a href="Login2.jsp?role=monitor">Monitor Login</a>
                    </ul>
                </li>

            </ul>

        </nav>

        <br>


    </center>
</body>
</html>
