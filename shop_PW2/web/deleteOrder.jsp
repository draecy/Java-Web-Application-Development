<%-- 
    Document   : deleteOrder
    Created on : Oct 1, 2026, 10:09:32 AM
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
            String id = request.getParameter("id");
            
            if (id != null) {
                try {
                    PreparedStatement ps = conn.prepareStatement("DELETE FROM products WHERE id = ?");
                    ps.setInt(1, Integer.parseInt(id));
                    ps.executeUpdate();
                    
                    response.sendRedirect("index.jsp");
                } catch (Exception e) {
                    out.println("Delete failed: " + e);
                }
            }
        %>
    </body>
</html>
