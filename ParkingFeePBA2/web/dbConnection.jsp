<%@page import="java.sql.*"%>
<%
    // Declare database connection
    Connection conn = null;
    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to parking_fee_db database
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/parking_fee_db", "root", "");
    } catch (Exception e) {
        // Display error if database connection fails
        out.println("Database Connection Error: " + e.getMessage());
    }
%>
