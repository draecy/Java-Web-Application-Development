<%-- 
    Document   : addProduct
    Created on : Oct 1, 2026, 9:53:36 AM
    Author     : MOHE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="db.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Ordering System</title>
    </head>
    <body>
        <%
            if (request.getParameter("submitBtn") != null) {
                String proName = request.getParameter("proName");
                String price = request.getParameter("price");
                String quantity = request.getParameter("quantity");
                String category = request.getParameter("category");
                String available = request.getParameter("available");
                
                try {
                    String sql = "INSERT INTO products (name, price, quantity, category, available) VALUES (?, ?, ?, ?, ?)";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setString(1, proName);
                    ps.setString(2, price);
                    ps.setString(3, quantity);
                    ps.setString(4, category);
                    ps.setString(5, available);
                    
                    ps.executeUpdate();
                    
                    response.sendRedirect("index.jsp?msg=Item+Added+Successfully!");
                } catch (Exception e) {
                    conn.rollback();
                    out.println("Error: " + e.getMessage());
                }
            }
        %>      
    </body>
</html>
