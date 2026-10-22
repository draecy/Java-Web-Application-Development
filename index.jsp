<%-- 
    Document   : index
    Created on : Oct 19, 2026, 4:04:15 PM
    Author     : Hanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REVISION</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1>SUBMISSION FORM</h1>
        <div class="form-container">
            <form action="process.jsp">
                STUDENT ID: <br>
                <input type="text" name="id" required> <br><br>
                STUDENT NAME: <br>
                <input type="text" name="name" required> <br><br>
                BOOK CATEGORY:
                <select name="category" required>
                    <option value="DATABASE">DATABASE</option>
                    <option value="SOFTWARE">SOFTWARE</option>
                    <option value="NETWORK">NETWORK</option>
                </select> <br><br>
                QUANTITY: 
                <input type="number" name="quantity" min="1" step="1" required> <br><br>
                REQUEST TYPE: <br>
                <input type="radio" name="type" value="BORROW"> BORROW <br>
                <input type="radio" name="type" value="RESERVE"> RESERVE <br><br>
                URGENT ?
                <input type="checkbox" name="urgent" value="YES"> YES <br><br>
                PRICE (RM)
                <input type="number" name="price" min="0.01" step="0.01" required><br><br>
                
                <input type="submit" name="SUBMIT">
            </form>
        </div>
    </body>
</html>
