<%-- 
    Document   : display
    Created on : Sep 17, 2026, 9:31:43 AM
    Author     : Hanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="config.jsp" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>School Event Registration System</title>
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
                    <th>Phone Number</th>  
                    <th>Event Name</th> 
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
                            <td><%= rs.getString("phone_no") %></td>  
                            <td><%= rs.getString("event_name") %></td> 
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
            <a href="form.jsp">Add New Student</a><br><br>
            <a href="homepage.jsp">Home</a>  
        </CENTER>  
    </body>
</html>
