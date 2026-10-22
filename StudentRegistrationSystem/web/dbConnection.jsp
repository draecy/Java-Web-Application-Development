<%-- 
    Document   : dbConnection
    Created on : Oct 19, 2026, 4:04:04 PM
    Author     : Hanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REVISION</title>
    </head>
    <body>
        <%
            Connection conn = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/revision", "root", "");
                
                //out.println("DATABASE CONNECTION SUCCESSFUL");
            } catch (Exception e) {
                out.println("DATABASE CONNECTION ERROR: " + e.getMessage());
            }
        %>
    </body>
</html>
