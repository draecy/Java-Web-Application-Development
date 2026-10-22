<%-- 
    Document   : process
    Created on : Sep 17, 2026, 9:45:18 AM
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
        <%  
            String name = request.getParameter("name");  
            String email = request.getParameter("email");  
            String phone = request.getParameter("phone");  
            String event = request.getParameter("event");
            
            try {  
            String sql = "INSERT INTO registration (name, email, phone_no, event_name) VALUES (?, ?, ?, ?)";  
                    PreparedStatement ps = conn.prepareStatement(sql);  

                    ps.setString(1, name);  
                    ps.setString(2, email);  
                    ps.setString(3, phone); 
                    ps.setString(4, event); 

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

        <br><br> 
        <a href="form.jsp">Add New Student</a><br><br>
        <a href="display.jsp">View Registered Students</a>  
        </CENTER> 
    </body>
</html>
