<%-- 
    Document   : dbConnection
    Created on : Sep 17, 2026, 8:29:37 AM
    Author     : Hanis
--%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BrightEdu</title>
    </head>
    <body>
          
        <%  
            String url = "jdbc:mysql://localhost:3308/brightedu";  
            String user = "root";  
            String password = "";  
            Connection conn = null;  
            
            try {  
                Class.forName("com.mysql.cj.jdbc.Driver");  
                conn = DriverManager.getConnection(url, user, password);  
            } catch(Exception e) {  
                out.println("Database Connection Error: " + 
                e.getMessage());  
            }  
        %>  
    </body>
</html>
