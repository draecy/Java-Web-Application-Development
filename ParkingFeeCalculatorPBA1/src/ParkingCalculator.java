import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalTime;
import java.time.Duration;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

public class ParkingCalculator implements ActionListener {

    private ParkingGUI gui;

    public ParkingCalculator(ParkingGUI gui) {
        this.gui = gui;
        this.gui.getCalculateButton().addActionListener(this);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        try {
            String vehicleType = (String) gui.getVehicleTypeCombo().getSelectedItem();
            String entryStr = gui.getEntryTimeField().getText().trim();
            String exitStr = gui.getExitTimeField().getText().trim();

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
            LocalTime entryTime = LocalTime.parse(entryStr, formatter);
            LocalTime exitTime = LocalTime.parse(exitStr, formatter);

            boolean isOvernight = gui.getOvernightCheckBox().isSelected();

            // Calculate duration
            Duration duration = Duration.between(entryTime, exitTime);
            if (duration.isNegative() || duration.isZero()) {
                if (isOvernight) {
                    duration = duration.plusDays(1);
                } else {
                    JOptionPane.showMessageDialog(gui, 
                        "Exit time must be after entry time (or check 'Overnight Stay').", 
                        "Time Input Error", JOptionPane.WARNING_MESSAGE);
                    return;
                }
            } else if (isOvernight) {
                duration = duration.plusDays(1);
            }

            long totalMinutes = duration.getSeconds() / 60;
            double totalHours = Math.ceil(totalMinutes / 60.0);

            // First 15 minutes free
            if (totalMinutes <= 15) {
                gui.getResultArea().setText("=========================================\n" +
                        "             PARKING RECEIPT             \n" +
                        "=========================================\n" +
                        "Duration: " + totalMinutes + " mins (Grace Period)\n" +
                        "TOTAL FEE: RM 0.00\nFree Parking (Under 15 Mins)\n" +
                        "=========================================");
                return;
            }

            // Rate configuration
            double hourlyRate = 0.0;
            double dailyMaxCap = 0.0;

            if ("Motorcycle".equals(vehicleType)) {
                hourlyRate = 1.00;
                dailyMaxCap = 5.00;
            } else if ("Car".equals(vehicleType)) {
                hourlyRate = 2.00;
                dailyMaxCap = 15.00;
            } else if ("Van".equals(vehicleType)) {
                hourlyRate = 2.50;
                dailyMaxCap = 20.00;
            }

            // Calculate fee
            double days = Math.floor(totalHours / 24);
            double remainingHours = totalHours % 24;
            double baseFee = (days * dailyMaxCap) + Math.min(remainingHours * hourlyRate, dailyMaxCap);

            // Discount 
            double discountRate = 0.0;
            int discountIndex = gui.getDiscountCombo().getSelectedIndex();
            if (discountIndex == 1) discountRate = 0.20;
            else if (discountIndex == 2) discountRate = 0.10;

            double discountAmount = baseFee * discountRate;
            double finalFee = baseFee - discountAmount;

            String receipt = "=========================================\n" +
                    "             PARKING RECEIPT             \n" +
                    "=========================================\n" +
                    "Vehicle Type  : " + vehicleType + "\n" +
                    "Entry Time    : " + entryTime + "\n" +
                    "Exit Time     : " + exitTime + (isOvernight ? " (+1 Day)" : "") + "\n" +
                    "Total Duration: " + (long)totalHours + " hrs (" + totalMinutes + " mins)\n" +
                    "Rate per Hour : RM " + String.format("%.2f", hourlyRate) + "\n" +
                    "Base Fee      : RM " + String.format("%.2f", baseFee) + "\n" +
                    "Discount      : -RM " + String.format("%.2f", discountAmount) + "\n" +
                    "-----------------------------------------\n" +
                    "TOTAL FEE     : RM " + String.format("%.2f", finalFee) + "\n" +
                    "=========================================";

            gui.getResultArea().setText(receipt);

        } catch (DateTimeParseException ex) {
            JOptionPane.showMessageDialog(gui, 
                "Please enter time in HH:mm format (24-hour style, e.g., 09:15 or 18:30).", 
                "Format Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void saveReceiptWithFileChooser() {
        String text = gui.getResultArea().getText().trim();
        if (text.isEmpty()) {
            JOptionPane.showMessageDialog(gui, "No receipt to save. Calculate a fee first.", "Warning", JOptionPane.WARNING_MESSAGE);
            return;
        }

        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setDialogTitle("Save Parking Receipt");
        fileChooser.setSelectedFile(new File("ParkingReceipt.txt"));

        int userSelection = fileChooser.showSaveDialog(gui);

        if (userSelection == JFileChooser.APPROVE_OPTION) {
            File fileToSave = fileChooser.getSelectedFile();
            try (FileWriter writer = new FileWriter(fileToSave)) {
                writer.write(text);
                JOptionPane.showMessageDialog(gui, "Receipt saved successfully to:\n" + fileToSave.getAbsolutePath(), "Success", JOptionPane.INFORMATION_MESSAGE);
            } catch (IOException e) {
                JOptionPane.showMessageDialog(gui, "Error saving receipt: " + e.getMessage(), "File Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }
}