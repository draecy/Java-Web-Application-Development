<%-- 
    Document   : insert
    Created on : Sep 17, 2026, 8:38:18 AM
    Author     : Hanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="dbConnection.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BrightEdu</title>
    </head>
    <body>
        <link rel="stylesheet" href="style.css">  
        <CENTER>  
        <%  
        String name = request.getParameter("name");  
        String email = request.getParameter("email");  
        String course = request.getParameter("course");  
        try {  
        String sql = "INSERT INTO registration (name, email, course) VALUES (?, ?, ?)";  
                PreparedStatement ps = conn.prepareStatement(sql);  

                ps.setString(1, name);  
                ps.setString(2, email);  
                ps.setString(3, course);  

             int result = ps.executeUpdate();  

             if(result > 0){  
                    out.println("<h3>✅ Registration Successful!</h3>");  
             } else {  
                    out.println("<h3>❌ Failed!</h3>");  
             }  

                conn.close();  

         } catch(Exception e) {  
            out.println("Error: " + e.getMessage());  
         }  
        %>  

        <br>  
        <a href="input.jsp">Insert Again</a><br>  
        <a href="view.jsp">View Students</a>  
        </CENTER>  
    </body>
</html>
