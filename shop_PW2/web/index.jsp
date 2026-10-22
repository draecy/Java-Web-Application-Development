<%-- 
    Document   : index
    Created on : Oct 1, 2026, 9:15:38 AM
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
        <h2>Insert Item</h2>
        
        <form action="addProduct.jsp" method="post">
            Product Name: <input type="text" name="proName" required><br><br>
            Price: RM <input type="text" name="price" required><br><br>
            Quantity: <input type="text" name="quantity" required><br><br>
            <label for="category">Category:</label>
            <select id="category" name="category" required>
                <option value=""> Choose category </option>
                <option value="Toilet"> Toiletries </option>
                <option value="Living Room"> Living Room </option>
                <option value="Kitchen"> Kitchen </option>
            </select><br><br>
            Availability: <input type="checkbox" id="yes" name="available" value="yes"> Yes<br><br>
            <input type="submit" name="submitBtn" value="SUBMIT">
        </form>
        <br>
        
        <% if (request.getParameter("msg") != null) { %>
            <p style="color: green;"><%= request.getParameter("msg") %></p>
        <% } %>
        
        <h3>Product List</h3>
        <table border="1">
            <tr>
                <th>No</th>
                <th>Product Name</th>
                <th>Price (RM)</th>
                <th>Quantity</th>
                <th>Category</th>
                <th>Availability</th>
                <th>Action</th>
            </tr>
            <%
                try {
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM products");
                    
                    while(rs.next()) { 
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("price") %></td>
                <td><%= rs.getString("quantity") %></td>
                <td><%= rs.getString("category") %></td>
                <td><%= rs.getString("available") != null ? "yes" : "no" %></td>
                <td>
                    <a href="updateOrder.jsp?id=<%= rs.getInt("id") %>">Update</a>
                    <a href="deleteOrder.jsp?id=<%= rs.getInt("id") %>" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
        </table>
    </body>
</html>
