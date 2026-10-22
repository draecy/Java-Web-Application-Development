<%-- 
    Document   : deleteOrder
    Created on : Sep 29, 2026, 5:04:18 PM
    Author     : Hanis
--%>

<%@ page import="java.sql.*" %>
<%@ include file="dbConnection.jsp" %>
<%
    // Module 3e: Delete order information
    String orderId = request.getParameter("id");
    if (orderId != null) {
        try {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM orders WHERE order_id = ?");
            ps.setInt(1, Integer.parseInt(orderId));
            ps.executeUpdate();
            
            response.sendRedirect("displayOrders.jsp");
        } catch (Exception e) {
            out.println("Delete failed: " + e);
        }
    }
%>
