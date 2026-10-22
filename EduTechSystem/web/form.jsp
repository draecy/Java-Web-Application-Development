<%-- 
    Document   : register
    Created on : Sep 17, 2026, 9:31:28 AM
    Author     : Hanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>School Event Registration System</title>
    </head>
    <body>
        <link rel="stylesheet" href="style.css">  
        <CENTER>  
            <h2>Student Registration Form</h2>  
                <form action="process.jsp" method="post">  
                    Name: <input type="text" name="name" required><br>  
                    Email: <input type="text" name="email" required><br>  
                    Phone Number: <input type="text" name="phone" required><br>
                    Event Name: <input type="text" name="event" required><br><br>  
                    <input type="submit" value="Register">  
            </form>  
            <br>  
            <a href="homepage.jsp">Back to Home Page</a>  
        </CENTER> 
    </body>
</html>
