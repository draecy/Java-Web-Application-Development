<%-- 
    Document   : updateOrder
    Created on : Sep 29, 2026, 5:03:23 PM
    Author     : Hanis
--%>

<%@ page import="java.sql.*" %>
<%@ include file="dbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head><title>Update Order</title></head>
<body>
    <h2>Update Order Quantity</h2>
    <%
        String orderId = request.getParameter("id");
    %>
    <form action="displayOrder.jsp" method="post">
        <input type="hidden" name="order_id" value="<%= orderId %>"/>
        New Quantity: <input type="number" name="quantity" min="1" required/>
        <input type="submit" name="updateBtn" value="Update Order"/>
    </form>

    <%
        if (request.getParameter("updateBtn") != null) {
            int id = Integer.parseInt(request.getParameter("order_id"));
            int newQty = Integer.parseInt(request.getParameter("quantity"));

            try {
                PreparedStatement ps = conn.prepareStatement("UPDATE orders SET quantity = ? WHERE order_id = ?");
                ps.setInt(1, newQty);
                ps.setInt(2, id);

                int result = ps.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("displayOrders.jsp");
                }
            } catch (Exception e) {
                out.println("Update failed: " + e);
            }
        }
    %>
</body>
</html>
