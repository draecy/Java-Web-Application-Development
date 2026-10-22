<%-- 
    Document   : db
    Created on : Oct 1, 2026, 9:10:31 AM
    Author     : MOHE
--%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Ordering System</title>
    </head>
    <body>
        <%
            String url = "jdbc:mysql://localhost:3307/shopdb";
            String user = "root";
            String password = "";
            Connection conn = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
            } catch (Exception e) {
                out.println("Database Connection Eror: " + e.getMessage());
            }
        %>
    </body>
</html>