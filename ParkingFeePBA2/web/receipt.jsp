<%@page import="java.sql.*"%>
<%@ include file="dbConnection.jsp" %>
<%
    // Get parking record ID
    int id = Integer.parseInt(request.getParameter("id"));

    // SQL SELECT statement
    String sql = "SELECT * FROM parking_record " + "WHERE id=?";
    PreparedStatement ps = conn.prepareStatement(sql);
    // Set ID
    ps.setInt(1, id);
    // Execute SELECT
    ResultSet rs = ps.executeQuery();

    // Display record
    if (rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Parking Receipt</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <div class="success-box">
        <h2>Payment Successful!</h2>
        <p>Your parking fee has been paid.</p>
    </div>

    <h1>Parking Receipt</h1>

    <div class="result-box">
        <div class="result-row">
            <strong>Receipt ID: </strong>
            <span><%=rs.getInt("id")%></span>
        </div>

        <div class="result-row">
            <strong>Vehicle No: </strong>
            <span><%=rs.getString("vehicle_no")%></span>
        </div>

        <div class="result-row">
            <strong>Vehicle Type: </strong>
            <span><%=rs.getString("vehicle_type")%></span>
        </div>

        <div class="result-row">
            <strong>Entry Date & Time: </strong>
            <span><%=rs.getDate("entry_date")%> <%=rs.getTime("entry_time")%></span>
        </div>

        <div class="result-row">
            <strong>Exit Date & Time: </strong>
            <span><%=rs.getDate("exit_date")%> <%=rs.getTime("exit_time")%></span>
        </div>

        <div class="result-row">
            <strong>Hours Parked: </strong>
            <span><%=rs.getInt("total_hours")%>hour(s)</span>
        </div>

        <div class="result-row">
            <strong>Overnight Stay: </strong>
            <span><%=rs.getString("overnight")%></span>
        </div>

        <div class="result-row">
            <strong>Discount Pass: </strong>
            <span><%=rs.getString("discount_pass")%></span>
        </div>

        <div class="result-row">
            <strong>Parking Zone: </strong>
            <span><%=rs.getString("parking_zone")%></span>
        </div>

        <div class="result-row">
            <strong>Payment Method: </strong>
            <span><%=rs.getString("payment_method")%></span>
        </div>

        <div class="result-row">
            <strong>Payment Status: </strong>
            <span><%=rs.getString("payment_status")%></span>
        </div>
    </div>

    <div class="total-box">
        <p>Total Paid: </p>
        <h2>RM <%=String.format("%.2f", rs.getDouble("total_fee"))%></h2>
    </div>

    <div class="button-group">
        <button type="button" onclick="window.print()" class="btn btn-primary">Print Receipt</button>
        <a href="index.jsp" class="btn btn-secondary">New Calculation</a>
        <a href="view_records.jsp" class="btn btn-success">View Records</a>
    </div>
</div>
</body>
</html>
<%
    }
%>