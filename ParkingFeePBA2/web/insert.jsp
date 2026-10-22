<%@page import="java.sql.*"%>
<%@ include file="dbConnection.jsp" %>
<%
    // Get data from payment.jsp
    String vehicleNo = request.getParameter("vehicle_no");
    String vehicleType = request.getParameter("vehicle_type");
    String entryDate = request.getParameter("entry_date");
    String entryTime = request.getParameter("entry_time");
    String exitDate = request.getParameter("exit_date");
    String exitTime = request.getParameter("exit_time");
    String overnight = request.getParameter("overnight");
    String discountPass = request.getParameter("discount_pass");
    String parkingZone = request.getParameter("parking_zone");

    int totalHours = Integer.parseInt(request.getParameter("total_hours"));
    double hourlyRate = Double.parseDouble(request.getParameter("hourly_rate"));
    double totalFee = Double.parseDouble(request.getParameter("total_fee"));
    String paymentMethod = request.getParameter("payment_method");
    // Payment is successful
    String paymentStatus = "Paid";

    try {
        // SQL INSERT statement
        String sql = "INSERT INTO parking_record "
                + "(vehicle_no, vehicle_type, "
                + "entry_date, entry_time, "
                + "exit_date, exit_time, "
                + "overnight, discount_pass, "
                + "parking_zone, total_hours, "
                + "hourly_rate, total_fee, "
                + "payment_method, payment_status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // Prepare SQL statement
        PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        // Set values
        ps.setString(1, vehicleNo);
        ps.setString(2, vehicleType);
        ps.setString(3, entryDate);
        ps.setString(4, entryTime);
        ps.setString(5, exitDate);
        ps.setString(6, exitTime);
        ps.setString(7, overnight);
        ps.setString(8, discountPass);
        ps.setString(9, parkingZone);
        ps.setInt(10, totalHours);
        ps.setDouble(11, hourlyRate);
        ps.setDouble(12, totalFee);
        ps.setString(13, paymentMethod);
        ps.setString(14, paymentStatus);

        // Execute INSERT
        int result = ps.executeUpdate();

        // Check if record is successfully inserted
        if (result > 0) {
            // Get generated record ID
            ResultSet rs = ps.getGeneratedKeys();

            if (rs.next()) {
                int id = rs.getInt(1);
                // Go to receipt page
                response.sendRedirect("receipt.jsp?id=" + id);
            }
        }
    } catch (Exception e) {
        out.println("Insert Error: " + e.getMessage());
    }
%>
