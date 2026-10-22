<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get data from calculate.jsp
    String vehicleNo = request.getParameter("vehicle_no");
    String vehicleType = request.getParameter("vehicle_type");
    String entryDate = request.getParameter("entry_date");
    String entryTime = request.getParameter("entry_time");
    String exitDate = request.getParameter("exit_date");
    String exitTime = request.getParameter("exit_time");
    String overnight = request.getParameter("overnight");
    String discountPass = request.getParameter("discount_pass");
    String parkingZone = request.getParameter("parking_zone");
    String totalHours = request.getParameter("total_hours");
    String hourlyRate = request.getParameter("hourly_rate");
    String totalFee = request.getParameter("total_fee");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Details</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>Payment Details</h1>
    <div class="total-box">
        <p>Total Amount to Pay</p>
        <h2>RM <%=String.format("%.2f", Double.parseDouble(totalFee))%></h2>
    </div>
    
    <form action="insert.jsp"method="post">
        <!-- Hidden parking information -->
        <input type="hidden" name="vehicle_no" value="<%=vehicleNo%>">
        <input type="hidden" name="vehicle_type" value="<%=vehicleType%>">
        <input type="hidden" name="entry_date" value="<%=entryDate%>">
        <input type="hidden" name="entry_time" value="<%=entryTime%>">
        <input type="hidden" name="exit_date" value="<%=exitDate%>">
        <input type="hidden" name="exit_time" value="<%=exitTime%>">
        <input type="hidden" name="overnight" value="<%=overnight%>">
        <input type="hidden" name="discount_pass" value="<%=discountPass%>">
        <input type="hidden" name="parking_zone" value="<%=parkingZone%>">
        <input type="hidden" name="total_hours" value="<%=totalHours%>">
        <input type="hidden" name="hourly_rate" value="<%=hourlyRate%>">
        <input type="hidden" name="total_fee" value="<%=totalFee%>">
        
        <!-- Payment Method -->
        <div class="form-group">
            <label>Payment Method</label>
            <select name="payment_method" class="colored-input" required>
                <option value="QR Code">QR Code</option>
                <option value="E-Wallet">E-Wallet</option>
                <option value="Online Banking">Online Banking</option>
                <option value="Credit / Debit Card">Credit / Debit Card</option>
                <option value="Cash">Cash</option>
                <option value="FPX">FPX</option>
            </select>
        </div>

        <div class="button-group">
            <input type="submit" value="Pay Now" class="btn btn-success">
            <a href="index.jsp" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>