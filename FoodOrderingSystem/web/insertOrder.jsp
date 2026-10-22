<%-- 
    Document   : insertOrder
    Created on : Sep 29, 2026, 5:01:10 PM
    Author     : Hanis
--%>

<%@ page import="java.sql.*" %>
<%@ include file="dbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head><title>Insert Order</title></head>
<body>
    <h2>Add New Food Order</h2>
    <form action="displayOrder.jsp" method="post">
        Customer Name: <input type="text" name="customer_name" required/><br><br>
        Food Selection: 
        <select name="food_id" required>
            <%
                try {
                    PreparedStatement psFood = conn.prepareStatement("SELECT * FROM food");
                    ResultSet rsFood = psFood.executeQuery();
                    while(rsFood.next()){
            %>
                        <option value="<%= rsFood.getInt("food_id") %>"><%= rsFood.getString("food_name") %></option>
            <%
                    }
                } catch(Exception e) {
                    out.println(e);
                }
            %>
        </select><br><br>
        Quantity: <input type="number" name="quantity" min="1" required/><br><br>
        Order Date: <input type="date" name="order_date" required/><br><br>
        <input type="submit" name="submitBtn" value="Submit Order"/>
    </form>

    <%
        if (request.getParameter("submitBtn") != null) {
            String customerName = request.getParameter("customer_name");
            int foodId = Integer.parseInt(request.getParameter("food_id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String orderDate = request.getParameter("order_date");

            try {
                conn.setAutoCommit(false); 
                PreparedStatement ps1 = conn.prepareStatement("INSERT INTO customer (customer_name) VALUES (?)", Statement.RETURN_GENERATED_KEYS);
                ps1.setString(1, customerName);
                ps1.executeUpdate();

                ResultSet rsCust = ps1.getGeneratedKeys();
                int customerId = 0;
                if (rsCust.next()) {
                    customerId = rsCust.getInt(1);
                }

                PreparedStatement ps2 = conn.prepareStatement("INSERT INTO orders (customer_id, food_id, quantity, order_date) VALUES (?, ?, ?, ?)");
                ps2.setInt(1, customerId);
                ps2.setInt(2, foodId);
                ps2.setInt(3, quantity);
                ps2.setString(4, orderDate);
                ps2.executeUpdate();

                conn.commit(); 
                out.println("<p style='color:green;'>Transaction Successful! Order Added.</p>");
            } catch (Exception e) {
                conn.rollback();
                out.println("<p style='color:red;'>Transaction Failed! " + e + "</p>");
            }
        }
    %>
    <br><a href="displayOrder.jsp">View All Orders</a>
</body>
</html>
