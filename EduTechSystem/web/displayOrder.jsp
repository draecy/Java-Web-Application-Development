<%-- 
    Document   : displayOrder
    Created on : Sep 29, 2026, 5:02:28 PM
    Author     : Hanis
--%>

<%@ page import="java.sql.*" %>
<%@ include file="dbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Display Orders</title>
</head>
<body>
    <h2>Online Food Ordering System - Order Details</h2>
    <a href="insertOrder.jsp">Add New Order</a> | <a href="login.jsp">Logout</a>
    <br><br>

    <table border="1">
        <tr>
            <th>Order ID</th>
            <th>Customer Name</th>
            <th>Food Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Actions</th>
        </tr>

        <%
            try {
                PreparedStatement ps = conn.prepareStatement(
                    "SELECT orders.order_id, customer.customer_name, food.food_name, food.price, orders.quantity, " +
                    "(food.price * orders.quantity) AS total_price " +
                    "FROM orders " +
                    "INNER JOIN customer ON orders.customer_id = customer.customer_id " +
                    "INNER JOIN food ON orders.food_id = food.food_id"
                );

                ResultSet rs = ps.executeQuery();
                while(rs.next()){
        %>
            <tr>
                <td><%= rs.getInt("order_id") %></td>
                <td><%= rs.getString("customer_name") %></td>
                <td><%= rs.getString("food_name") %></td>
                <td><%= rs.getDouble("price") %></td>
                <td><%= rs.getInt("quantity") %></td>
                <td><%= rs.getDouble("total_price") %></td>
                <td>
                    <a href="updateOrder.jsp?id=<%= rs.getInt("order_id") %>">Update</a> | 
                    <a href="deleteOrder.jsp?id=<%= rs.getInt("order_id") %>" onclick="return confirm('Delete this order?')">Delete</a>
                </td>
            </tr>
        <%
                }
            } catch(Exception e) {
                out.println(e);
            }
        %>
    </table>
</body>
</html>
