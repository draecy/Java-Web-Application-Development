<%-- 
    Document   : display
    Created on : Oct 19, 2026, 4:04:52 PM
    Author     : Hanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="dbConnection.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REVISION</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1>SUBMITTED RECORDS</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>BOOK CATEGORY</th>
                <th>QUANTITY</th>
                <th>PRICE (RM)</th>
                <th>REQUEST TYPE</th>
                <th>URGENT REQUEST</th>
                <th>REMARKS</th>
            </tr>
            <%
                boolean hasRecords = false;
                try {
                    String sql = "SELECT * FROM registration ORDER BY id DESC";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                        hasRecords = true;
                        %>
                        <tr>
                            <td><%= rs.getString("student_id") %></td>
                            <td><%= rs.getString("student_name") %></td>
                            <td><%= rs.getString("category") %></td>
                            <td><%= rs.getString("quantity") %></td>
                            <td><%= rs.getString("price") %></td>
                            <td><%= rs.getString("type") %></td>
                            <td><%= rs.getString("urgent") %></td>
                            <td><%= rs.getString("remarks") %></td>
                        </tr>
                        <%
                    }
                    if (!hasRecords) {
                        %>
                        <tr>
                            <td colspan="8" style="text-align: center">No data available</td>
                        </tr>
                        <%
                    }
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                } catch (Exception e) {
                    %>
                    <tr>
                        <td colspan="8" style="text-align: center">Data Error: <%= e.getMessage() %></td>
                    </tr>
                    <%
                }
            %>
        </table> <br>
        <a href="index.jsp">Add More Data</a>
    </body>
</html>