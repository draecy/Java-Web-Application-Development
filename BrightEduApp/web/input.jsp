<%-- 
    Document   : input
    Created on : Sep 17, 2026, 8:35:48 AM
    Author     : Hanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BrightEdu</title>
    </head>
    <body>
        <link rel="stylesheet" href="style.css">  
        <CENTER>  
            <h2>Student Registration Form</h2>  
                <form action="insert.jsp" method="post">  
                    Name: <input type="text" name="name" required><br>  
                    Email: <input type="text" name="email" required><br>  
                    Course: <input type="text" name="course" required><br><br>  
                    <input type="submit" value="Register">  
            </form>  
            <br>  
            <a href="main.jsp">Back to Home</a>  
        </CENTER> 
    </body>
</html>
