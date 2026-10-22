<%-- 
    Document   : updateOrder
    Created on : Oct 1, 2026, 10:07:06 AM
    Author     : MOHE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="db.jsp"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Ordering System</title>
    </head>
    <body>
        <h2>Update Order</h2>
        <%
            String id = request.getParameter("id");
            String currentName = "";
            String currentPrice = "";
            String currentQuantity = "";
            String currentCategory = "";
            String currentAvailable = "";
            
            try {
                String selectSql = "SELECT * FROM products WHERE id = ?";
                PreparedStatement psFetch = conn.prepareStatement(selectSql);
                psFetch.setString(1, id);
                ResultSet rs = psFetch.executeQuery();

                if (rs.next()) {
                    currentName = rs.getString("name");
                    currentPrice = rs.getString("price");
                    currentQuantity = rs.getString("quantity");
                    currentCategory = rs.getString("category");
                    currentAvailable = rs.getString("available");
                    }
                } catch (Exception e) {
                    out.println("Fetch error: " + e);
                }
            
            if (request.getParameter("updateBtn") != null) {
                String proName = request.getParameter("proName");
                String price = request.getParameter("price");
                String quantity = request.getParameter("quantity");
                String category = request.getParameter("category");
                String available = request.getParameter("available");
                String sql = "UPDATE products SET name = ?, price = ?, quantity = ?, category = ?, available = ? WHERE id = ?";
                
                try {
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setString(1, proName);
                    ps.setString(2, price);
                    ps.setString(3, quantity);
                    ps.setString(4, category);
                    ps.setString(5, available);
                    ps.setString(6, id);

                    int result = ps.executeUpdate();
                    if (result > 0) {
                        response.sendRedirect("index.jsp?msg=Item+Updated+Successfully!");
                    }
                } catch (Exception e) {
                    out.println("Update failed: " + e);
                }
            }
        %>
        <form action="updateOrder.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            Product Name: <input type="text" name="proName" value="<%= currentName %>" required><br><br>
            Price: RM <input type="text" name="price" value="<%= currentPrice %>" required><br><br>
            Quantity: <input type="text" name="quantity" value="<%= currentQuantity %>" required><br><br>
            <label for="category">Category:</label>
            <select id="category" name="category">
                <option value=""> Choose category </option>
                <option value="Toilet" <%= "Toilet".equals(currentCategory) ? "selected" : "" %>> Toiletries </option>
                <option value="Living Room" <%= "Living Room".equals(currentCategory) ? "selected" : "" %>> Living Room </option>
                <option value="Kitchen" <%= "Kitchen".equals(currentCategory) ? "selected" : "" %>> Kitchen </option>
            </select><br><br>

            Availability: <input type="checkbox" id="yes" name="available" value="Yes" <%= "Yes".equals(currentAvailable) ? "checked" : "" %>> Yes
            <br><br>
            <input type="submit" name="updateBtn" value="Update">
        </form
    </body>
</html>
