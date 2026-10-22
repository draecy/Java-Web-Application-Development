<%-- 
    Document   : view
    Created on : Sep 17, 2026, 8:39:38 AM
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
        <h2>Registered Students</h2>  

        <table>  
            <tr>  
                <th>ID</th>  
                <th>Name</th>  
                <th>Email</th>  
                <th>Course</th>  
            </tr>  

        <%  
            try {  
                Statement stmt = conn.createStatement();  
                ResultSet rs = stmt.executeQuery("SELECT * FROM registration");  

                while(rs.next()) {
        %>
                    <tr>  
                        <td><%= rs.getInt("id") %></td>  
                        <td><%= rs.getString("name") %></td>  
                        <td><%= rs.getString("email") %></td>  
                        <td><%= rs.getString("course") %></td>  
                    </tr>  
        <%  
                }  
                conn.close();  
            } catch(Exception e) {  
                out.println("Error: " + e.getMessage());  
            }  
        %>
        </table>  
        <br>  
        <a href="input.jsp">Add New Student</a><br>  
        <a href="main.jsp">Home</a>  
    </CENTER>  
    </body>
</html>
