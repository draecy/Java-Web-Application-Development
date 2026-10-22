<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get current date and time automatically
    Date currentDateTime = new Date();

    // Set date format
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    // Set time format
    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

    // Store current date and time
    String entryDate = dateFormat.format(currentDateTime);
    String entryTime = timeFormat.format(currentDateTime);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Parking Fee Calculator</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>Parking Fee Calculator</h1>
    <form action="calculate.jsp" method="post">
        
        <!-- Vehicle Registration Number -->
        <div class="form-group">
            <label>Vehicle Registration Number</label>
            <input type="text" name="vehicle_no" class="colored-input" placeholder="Example: ABC1234"required>
        </div>

        <!-- Vehicle Type -->
        <div class="form-group">
            <label>Vehicle Type</label>
            <select name="vehicle_type" class="colored-input" required>
                <option value="Sedan">Sedan</option>
                <option value="SUV">SUV</option>
                <option value="MPV">MPV</option>
                <option value="Hatchback">Hatchback</option>
                <option value="Motorcycle">Motorcycle</option>
            </select>
        </div>

        <!-- Automatic Entry Date -->
        <div class="form-group">
            <label>Entry Date (Automatic)</label>
            <input type="date" name="entry_date" value="<%=entryDate%>" class="colored-input" readonly>
        </div>

        <!-- Automatic Entry Time -->
        <div class="form-group">
            <label>Entry Time (Automatic)</label>
            <input type="time" name="entry_time" value="<%=entryTime%>" class="colored-input" readonly>
        </div>

        <!-- Exit Date -->
        <div class="form-group">
            <label>Exit Date</label>
            <input type="date" name="exit_date" class="colored-input" required>
        </div>

        <!-- Exit Time -->
        <div class="form-group">
            <label>Exit Time</label>
            <input type="time" name="exit_time" class="colored-input" required>
        </div>

        <!-- Overnight Stay -->
        <div class="form-group">
            <label>Overnight Stay</label>
            <div class="checkbox-group">
                <label class="checkbox-option">
                    <input type="checkbox" name="overnight" value="Yes">
                    Yes
                </label>
            </div>
        </div>

        <!-- Discount Pass -->
        <div class="form-group">
            <label>Discount Pass</label>
            <div class="radio-group">
                <label class="radio-option">
                    <input type="radio" name="discount_pass" value="Staff">
                    Staff
                </label>
                <label class="radio-option">
                    <input type="radio" name="discount_pass" value="Member">
                    Member
                </label>
                <label class="radio-option">
                    <input type="radio" name="discount_pass" value="None" checked>
                    None
                </label>
            </div>
        </div>

        <!-- Parking Zone -->
        <div class="form-group">
            <label>Parking Zone</label>
            <select name="parking_zone" class="colored-input">
                <option value="Zone A">Zone A - RM3.00/hour</option>
                <option value="Zone B">Zone B - RM2.50/hour</option>
                <option value="Zone C">Zone C - RM2.00/hour</option>
                <option value="Zone D">Zone D - RM1.50/hour</option>
            </select>
        </div>

        <!-- Buttons -->
        <div class="button-group">
            <input type="submit" value="Calculate" class="btn btn-primary">
            <input type="reset" value="Reset" class="btn btn-outline">
            <a href="view_records.jsp" class="btn btn-secondary">
                View Records
            </a>
        </div>
    </form>
</div>
</body>
</html>