<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get data from index.jsp
    String vehicleNo = request.getParameter("vehicle_no");
    String vehicleType = request.getParameter("vehicle_type");
    String entryDate = request.getParameter("entry_date");
    String entryTime = request.getParameter("entry_time");
    String exitDate = request.getParameter("exit_date");
    String exitTime = request.getParameter("exit_time");
    String overnight = request.getParameter("overnight");
    String discountPass = request.getParameter("discount_pass");
    String parkingZone = request.getParameter("parking_zone");

    // If overnight checkbox is not selected
    if (overnight == null) {
        overnight = "No";
    }

    // Set parking rate based on parking zone
    double hourlyRate = 0.00;

    if (parkingZone.equals("Zone A")) {
        hourlyRate = 3.00;
    } else if (parkingZone.equals("Zone B")) {
        hourlyRate = 2.50;
    } else if (parkingZone.equals("Zone C")) {
        hourlyRate = 2.00;
    } else if (parkingZone.equals("Zone D")) {
        hourlyRate = 1.50;
    }

    // Format date and time
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    // Convert String to Date
    Date entryDateTime = format.parse(entryDate + " " + entryTime);
    Date exitDateTime = format.parse(exitDate + " " + exitTime);
    // Calculate time difference
    long difference = exitDateTime.getTime() - entryDateTime.getTime();

    // Validate exit date and time
    if (difference <= 0) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <div class="error-box">
        <h2>Invalid Exit Date or Time</h2>
        <p>Exit date and time must be after entry date and time.</p>
    </div>

    <div class="button-group">
        <a href="index.jsp" class="btn btn-primary">Back</a>
    </div>
</div>
</body>
</html>
<%
        return;
    }

    // Convert time difference into hours
    double exactHours = difference / (1000.0 * 60 * 60);
    // Round parking hour up
    int totalHours = (int) Math.ceil(exactHours);
    // Calculate basic parking fee
    double basicFee = totalHours * hourlyRate;
    // Overnight charge
    double overnightCharge = 0.00;

    if (overnight.equals("Yes")) {
        overnightCharge = 10.00;
    }

    // Calculate fee before discount
    double feeBeforeDiscount = basicFee + overnightCharge;

    // Set discount rate
    double discountRate = 0.00;

    if (discountPass.equals("Staff")) {
        discountRate = 0.20;
    } else if (discountPass.equals("Member")) {
        discountRate = 0.10;
    }

    // Calculate discount amount
    double discountAmount = feeBeforeDiscount * discountRate;
    // Calculate final parking fee
    double totalFee = feeBeforeDiscount - discountAmount;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Parking Calculation</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>Parking Calculation Result</h1>

    <div class="result-box">
        <div class="result-row">
            <strong>Vehicle No: </strong>
            <span><%=vehicleNo%></span>
        </div>

        <div class="result-row">
            <strong>Vehicle Type: </strong>
            <span><%=vehicleType%></span>
        </div>

        <div class="result-row">
            <strong>Entry Date & Time: </strong>
            <span><%=entryDate%> <%=entryTime%></span>
        </div>

        <div class="result-row">
            <strong>Exit Date & Time: </strong>
            <span><%=exitDate%> <%=exitTime%></span>
        </div>

        <div class="result-row">
            <strong>Hours Parked: </strong>
            <span><%=totalHours%> hour(s)</span>
        </div>

        <div class="result-row">
            <strong>Parking Zone: </strong>
            <span><%=parkingZone%></span>
        </div>

        <div class="result-row">
            <strong>Hourly Rate: </strong>
            <span>RM <%=String.format("%.2f", hourlyRate)%></span>
        </div>

        <div class="result-row">
            <strong>Overnight Stay: </strong>
            <span><%=overnight%></span>
        </div>

        <div class="result-row">
            <strong>Discount Pass: </strong>
            <span><%=discountPass%></span>
        </div>
    </div>
        
    <div class="total-box">
        <p>Total Parking Fee: </p>
        <h2>RM <%=String.format("%.2f", totalFee)%></h2>
    </div>

    <!-- Send calculated data to payment.jsp -->
    <form action="payment.jsp" method="post">
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

        <div class="button-group">
            <input type="submit" value="Proceed to Payment" class="btn btn-success">
            <a href="index.jsp" class="btn btn-secondary">Back</a>
        </div>
    </form>
</div>
</body>
</html>