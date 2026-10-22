<%-- 
    Document   : dbConnection
    Created on : Oct 16, 2026, 2:51:15 PM
    Author     : Hanis
--%>

<%@page import="java.sql.*"%>
<%
    Connection conn = null;
    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect database
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/revision", "root", "");
    } catch (Exception e) {
        // Display error if database connection fails
        out.println("Database Connection Error: " + e.getMessage());
    }
%>