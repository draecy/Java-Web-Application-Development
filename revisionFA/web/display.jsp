<%-- 
    Document   : display
    Created on : Oct 16, 2026, 3:28:38 PM
    Author     : Hanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="dbConnection.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>REVISION</title>
    </head>
    <body>
        <h1>Submitted Records</h1>
        <table>
            <tr>
                <th>Student Id</th>
                <th>Student Name</th>
                <th>Book Category</th>
                <th>Quantity</th>
                <th>Request Type</th>
                <th>Urgent Request</th>
                <th>Remarks (if any)</th>
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
                            <td><%= rs.getString("type") %></td>
                            <td><%= rs.getString("urgent") %></td>
                            <td><%= rs.getString("remarks") %></td>
                        </tr>
            <%
                    }
                    if (!hasRecords) {
            %>
                        <tr>
                            <td colspan="7" style="text-align: center">No records available</td>
                        </tr>
            <%
                    }

                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                } catch (Exception e) {
            %>
                    <tr>
                        <td colspan="7" style="text-align: center;">Display Error: <%= e.getMessage() %></td>
                    </tr>
            <%
                }
            %>
        </table><br><br>
        <a href="request.jsp">Add More</a>
    </body>
</html>
