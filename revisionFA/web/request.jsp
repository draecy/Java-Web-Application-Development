<%-- 
    Document   : request.jsp
    Created on : Oct 16, 2026, 2:55:22 PM
    Author     : Hanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>REVISION</title>
    </head>
    <body>
        <h1>LIBRARY BOOK REQUEST SYSTEM</h1>
        
        <div class="form-container">
            <form action="process.jsp" method="POST">
                Student Name: 
                <input type="text" name="name" required><br><br>

                Student ID:
                <input type="text" name="id" required><br><br>

                <label for="category">Book Category:</label>
                <select name="category" id="category" required>
                    <option value="Programming">Programming</option>
                    <option value="Networking">Networking</option>
                    <option value="Database">Database</option>
                </select><br><br>

                <label for="quantity">Quantity (between 1 and 5):</label>
                <input type="number" id="quantity" name="quantity" min="1" max="5"><br><br>

                Request Type: <br>
                <input type="radio" name="type" id="type" value="Borrow"> Borrow<br>
                <input type="radio" name="type" id="type" value="Reserve"> Reserve<br><br>

                Urgent Request: <br>
                <input type="radio" name="urgent" id="urgent" value="Yes"> Yes<br>
                <input type="radio" name="urgent" id="urgent" value="No"> No<br><br>

                Remarks: <br>
                <input type="textarea" id="remarks" name="remarks"><br><br>

                <button type="submit" name="submit" id="submit">Submit</button>
            </form>
        </div>
    </body>
</html>
