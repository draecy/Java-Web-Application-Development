<%-- 
    Document   : process
    Created on : Oct 19, 2026, 4:04:38 PM
    Author     : Hanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="dbConnection.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REVISION</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String quantity = request.getParameter("quanity");
            String type = request.getParameter("type");
            String price = request.getParameter("price");
            String urgent = request.getParameter("urgent");
            String remarks = request.getParameter("remarks");
            
            PreparedStatement ps = null;
            try {
                String sql = "INSERT INTO registration (student_id, student_name, category, quantity, type, urgent, remarks, price) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                ps = conn.prepareStatement(sql);
                
                if (urgent == null) {
                    urgent = "NO";
                }
                
                ps.setString(1, "id");
                ps.setString(2, "name");
                ps.setString(3, "category");
                ps.setString(4, "quantity");
                ps.setString(5, "type");
                ps.setString(6, "urgent");
                ps.setString(7, "remarks");
                ps.setString(8, "price");
                ps.executeUpdate();
                
                out.println("<p style='color: green; text-align: center'>SUCCESSFUL!</p>");
            } catch (Exception e) {
                out.println("<p style='color: red; text-align: center'>ERROR OCCUR: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                } catch (Exception ex) {
                    out.println("<p style='color: red; text-align: center'>EXCEPTION OCCUR: " + ex.getMessage() + "</p>");
                }
            }
        %>
        <a href="display.jsp">VIEW RECORDS</a>
    </body>
</html>
