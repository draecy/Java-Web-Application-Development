<%@page import="java.sql.*"%>
<%@ include file="dbConnection.jsp" %>
<%
    // Get parking record ID
    int id = Integer.parseInt(request.getParameter("id"));

    // SQL SELECT statement
    String sql = "SELECT * FROM parking_record " + "WHERE id=?";
    // Prepare SQL statement
    PreparedStatement ps = conn.prepareStatement(sql);
    // Set record ID
    ps.setInt(1, id);
    // Execute SELECT
    ResultSet rs = ps.executeQuery();

    // Display record in form
    if (rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Parking Record</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>Edit Record</h1>

    <form action="update.jsp" method="post">

        <!-- Hidden Record ID -->
        <input type="hidden" name="id" value="<%=rs.getInt("id")%>">

        <!-- Vehicle Number -->
        <div class="form-group">
            <label>Vehicle No: </label>
            <input type="text" name="vehicle_no" value="<%=rs.getString("vehicle_no")%>" class="colored-input" required>
        </div>

        <!-- Vehicle Type -->
        <div class="form-group">
            <label>Vehicle Type</label>
            <select name="vehicle_type" class="colored-input">
                <option value="Sedan"
                    <%=rs.getString("vehicle_type").equals("Sedan") ? "selected" : ""%>>
                    Sedan
                </option>
                <option value="SUV"
                    <%=rs.getString("vehicle_type").equals("SUV") ? "selected" : ""%>>
                    SUV
                </option>
                <option value="MPV"
                    <%=rs.getString("vehicle_type").equals("MPV") ? "selected" : ""%>>
                    MPV
                </option>
                <option value="Hatchback"
                    <%=rs.getString("vehicle_type").equals("Hatchback") ? "selected" : ""%>>
                    Hatchback
                </option>
                <option value="Motorcycle"
                    <%=rs.getString("vehicle_type").equals("Motorcycle") ? "selected" : ""%>>
                    Motorcycle
                </option>
            </select>
        </div>

        <!-- Information only -->
        <div class="result-box">
            <div class="result-row">
                <strong>Payment Method: </strong>
                <span><%=rs.getString("payment_method")%></span>
            </div>
            <div class="result-row">
                <strong>Parking Zone: </strong>
                <span><%=rs.getString("parking_zone")%></span>
            </div>
            <div class="result-row">
                <strong>Total Fee: </strong>
                <span>RM <%=String.format("%.2f", rs.getDouble("total_fee"))%>
                </span>
            </div>
        </div>

        <!-- Buttons -->
        <div class="button-group">
            <input type="submit" value="Update" class="btn btn-success">
            <a href="view_records.jsp" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>
<%
    }
%>
