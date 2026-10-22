<%@page import="java.sql.*"%>
<%@ include file="dbConnection.jsp" %>
<%
    // Get updated data from edit.jsp
    int id = Integer.parseInt(request.getParameter("id"));
    String vehicleNo = request.getParameter("vehicle_no");
    String vehicleType = request.getParameter("vehicle_type");

    try {
        // SQL UPDATE statement
        String sql = "UPDATE parking_record "
                + "SET vehicle_no=?, "
                + "vehicle_type=? "
                + "WHERE id=?";

        // Prepare SQL statement
        PreparedStatement ps = conn.prepareStatement(sql);

        // Set updated values
        ps.setString(1, vehicleNo);
        ps.setString(2, vehicleType);
        ps.setInt(3, id);

        // Execute UPDATE
        int result = ps.executeUpdate();

        // Check if update is successful
        if (result > 0) {
            // Return to parking records
            response.sendRedirect("view_records.jsp");
        }
    } catch (Exception e) {
        out.println("Update Error: "+ e.getMessage());
    }
%>