<%-- 
    Document   : process
    Created on : Oct 16, 2026, 3:17:37 PM
    Author     : Hanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="dbConnection.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>REVISION</title>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
            String id = request.getParameter("id");
            String category = request.getParameter("category");
            String quantity = request.getParameter("quantity");
            String type = request.getParameter("type");
            String urgent = request.getParameter("urgent");
            String remarks = request.getParameter("remarks");

            PreparedStatement ps = null;
            try {
                String sql = "INSERT INTO registration (student_name, student_id, category, quantity, type, urgent, remarks) VALUES (?, ?, ?, ?, ?, ?, ?)";
                ps = conn.prepareStatement(sql);

                ps.setString(1, name);
                ps.setString(2, id);
                ps.setString(3, category);
                ps.setString(4, quantity);
                ps.setString(5, type);
                ps.setString(6, urgent);
                ps.setString(7, remarks);
                ps.executeUpdate();
  
                out.println("<p style='color: green;'>Registration Successful!</p>");
            } catch (Exception e) {
                out.println("<p style='color: red;'>Process Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                } catch (Exception ex) {
                    out.println("<p style='color: red;'>Close Error: " + ex.getMessage() + "</p>");
                }
            }
        %>
            <br>
        <a href="display.jsp">View Submitted Records</a>
    </body>
</html>