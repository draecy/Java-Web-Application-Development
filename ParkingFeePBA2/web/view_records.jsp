<%@page import="java.sql.*"%>
<%@ include file="dbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Parking Records</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container-large">
    <h1>Parking Records</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Vehicle No</th>
            <th>Vehicle Type</th>
            <th>Entry Date & Time</th>
            <th>Exit Date & Time</th>
            <th>Hours</th>
            <th>Total Fee</th>
            <th>Payment Method</th>
            <th>Action</th>
        </tr>
        <%
            try {
                // SQL SELECT statement
                String sql = "SELECT * FROM parking_record ORDER BY id DESC";

                // Prepare SQL statement
                PreparedStatement ps = conn.prepareStatement(sql);

                // Execute SELECT
                ResultSet rs = ps.executeQuery();

                // Display all parking records
                while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getInt("id")%></td>
            <td><%=rs.getString("vehicle_no")%></td>
            <td><%=rs.getString("vehicle_type")%></td>
            <td><%=rs.getDate("entry_date")%><%=rs.getTime("entry_time")%></td>
            <td><%=rs.getDate("exit_date")%><%=rs.getTime("exit_time")%></td>
            <td><%=rs.getInt("total_hours")%></td>
            <td>RM <%=String.format("%.2f", rs.getDouble("total_fee"))%></td>
            <td><%=rs.getString("payment_method")%></td>
            <td><a class="action-link" href="receipt.jsp?id=<%=rs.getInt("id")%>">View</a>
                |
                <a class="action-link" href="edit.jsp?id=<%=rs.getInt("id")%>">Edit</a>
                |
                <a class="action-link" href="delete.jsp?id=<%=rs.getInt("id")%>"
                   onclick="return confirm('Are you sure you want to delete this record?');">Delete</a>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println("Display Error: " + e.getMessage());
            }
        %>
    </table>
    <div class="button-group">
        <a href="index.jsp" class="btn btn-primary">New Parking</a>
    </div>
</div>
</body>
</html>