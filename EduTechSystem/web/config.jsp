<%-- 
    Document   : config
    Created on : Sep 17, 2026, 9:33:54 AM
    Author     : Hanis
--%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>School Event Registration System</title>
    </head>
    <body>
        <%  
            String url = "jdbc:mysql://localhost:3307/edutech";  
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
