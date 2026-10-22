<%-- 
    Document   : login
    Created on : Sep 29, 2026, 4:56:08 PM
    Author     : Hanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="dbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head><title>Staff Login</title></head>
<body>
    <h2>Staff Login</h2>
    <form action="insertOrder.jsp" method="post">
        Username: <input type="text" name="username" required/><br><br>
        Password: <input type="password" name="password" required/><br><br>
        <input type="submit" name="loginBtn" value="Login"/>
    </form>

    <%
        if (request.getParameter("loginBtn") != null) {
            String u = request.getParameter("username");
            String p = request.getParameter("password");

            try {
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
                ps.setString(1, u);
                ps.setString(2, p);

                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    session.setAttribute("username", u);
                    response.sendRedirect("displayOrders.jsp");
                } else {
                    out.println("<p style='color:red;'>Invalid Username or Password!</p>");
                }
            } catch (Exception e) {
                out.println("Error: " + e);
            }
        }
    %>
</body>
</html>
