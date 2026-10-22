<%@page import="java.sql.*"%>
<%@ include file="dbConnection.jsp" %>
<%
    // Get parking record ID
    int id = Integer.parseInt(request.getParameter("id"));

    try {
        // SQL DELETE statement
        String sql = "DELETE FROM parking_record " + "WHERE id=?";
        // Prepare SQL statement
        PreparedStatement ps = conn.prepareStatement(sql);
        // Set record ID
        ps.setInt(1, id);

        // Execute DELETE
        int result = ps.executeUpdate();
        // Check if delete is successful
        if (result > 0) {
            // Return to parking records
            response.sendRedirect("view_records.jsp");
        }
    } catch (Exception e) {
        out.println("Delete Error: " + e.getMessage());
    }
%>