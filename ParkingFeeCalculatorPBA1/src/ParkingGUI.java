import javax.swing.*;
import java.awt.*;

public class ParkingGUI extends JFrame {

    JComboBox<String> vehicleTypeCombo;
    JTextField entryTimeField;
    JTextField exitTimeField;
    JCheckBox overnightCheckBox;
    JComboBox<String> discountCombo;
    JTextArea resultArea;
    JButton calculateButton;
    JButton resetButton;
    JButton saveReceiptButton;
    JButton exitButton;

    public ParkingGUI() {

        setTitle("Enhanced Parking Fee Calculator");
        setSize(700, 750);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout(10, 10));

        // ==============================
        // COLOUR SCHEME
        // ==============================

        Color darkGreen = new Color(25, 70, 55);
        Color green = new Color(40, 120, 90);
        Color lightMint = new Color(235, 248, 243);
        Color white = Color.WHITE;
        Color darkText = new Color(35, 55, 45);

        Font labelFont = new Font(
                "Arial",
                Font.PLAIN,
                28
        );

        // ==============================
        // TITLE PANEL
        // ==============================

        JPanel titlePanel = new JPanel();
        titlePanel.setBackground(darkGreen);

        JLabel titleLabel = new JLabel(
                "PARKING FEE CALCULATOR"
        );

        titleLabel.setFont(
                new Font("Arial", Font.BOLD, 30)
        );

        titleLabel.setForeground(white);

        titlePanel.add(titleLabel);

        add(titlePanel, BorderLayout.NORTH);

        // ==============================
        // CENTER PANEL
        // ==============================

        JPanel centerPanel = new JPanel(
                new BorderLayout()
        );

        centerPanel.setBackground(lightMint);

        // ==============================
        // INPUT PANEL
        // ==============================

        JPanel inputPanel = new JPanel(
                new GridLayout(5, 2, 10, 10)
        );

        inputPanel.setBackground(lightMint);

        inputPanel.setBorder(
                BorderFactory.createEmptyBorder(
                        20, 25, 15, 25
                )
        );

        // ==============================
        // VEHICLE TYPE
        // ==============================

        JLabel vehicleLabel = new JLabel(
                "Vehicle Type:"
        );

        vehicleLabel.setFont(labelFont);
        vehicleLabel.setForeground(darkText);

        inputPanel.add(vehicleLabel);

        String[] vehicles = {
                "Car",
                "Motorcycle",
                "Van"
        };

        vehicleTypeCombo = new JComboBox<>(
                vehicles
        );

        vehicleTypeCombo.setBackground(white);
        vehicleTypeCombo.setForeground(darkText);

        vehicleTypeCombo.setFont(
                new Font(
                        "Arial",
                        Font.PLAIN,
                        20
                )
        );

        inputPanel.add(vehicleTypeCombo);

        // ==============================
        // ENTRY TIME
        // ==============================

        JLabel entryLabel = new JLabel(
                "Entry Time (HH:mm, e.g. 08:30):"
        );

        entryLabel.setFont(labelFont);
        entryLabel.setForeground(darkText);

        inputPanel.add(entryLabel);

        entryTimeField = new JTextField();

        entryTimeField.setBackground(white);
        entryTimeField.setForeground(darkText);

        entryTimeField.setFont(
                new Font(
                        "Arial",
                        Font.PLAIN,
                        20
                )
        );

        inputPanel.add(entryTimeField);

        // ==============================
        // EXIT TIME
        // ==============================

        JLabel exitLabel = new JLabel(
                "Exit Time (HH:mm, e.g. 17:45):"
        );

        exitLabel.setFont(labelFont);
        exitLabel.setForeground(darkText);

        inputPanel.add(exitLabel);

        exitTimeField = new JTextField();

        exitTimeField.setBackground(white);
        exitTimeField.setForeground(darkText);

        exitTimeField.setFont(
                new Font(
                        "Arial",
                        Font.PLAIN,
                        20
                )
        );

        inputPanel.add(exitTimeField);

        // ==============================
        // OVERNIGHT
        // ==============================

        JLabel overnightLabel = new JLabel(
                "Overnight Stay (+24 hours)?"
        );

        overnightLabel.setFont(labelFont);
        overnightLabel.setForeground(darkText);

        inputPanel.add(overnightLabel);

        overnightCheckBox = new JCheckBox(
                "Yes"
        );

        overnightCheckBox.setBackground(
                lightMint
        );

        overnightCheckBox.setForeground(
                darkText
        );

        overnightCheckBox.setFont(
                new Font(
                        "Arial",
                        Font.PLAIN,
                        20
                )
        );

        inputPanel.add(overnightCheckBox);

        // ==============================
        // DISCOUNT
        // ==============================

        JLabel discountLabel = new JLabel(
                "Discount Pass:"
        );

        discountLabel.setFont(labelFont);
        discountLabel.setForeground(darkText);

        inputPanel.add(discountLabel);

        String[] discounts = {
                "None (0%)",
                "Staff / VIP (20%)",
                "Mall Member (10%)"
        };

        discountCombo = new JComboBox<>(
                discounts
        );

        discountCombo.setBackground(white);
        discountCombo.setForeground(darkText);

        discountCombo.setFont(
                new Font(
                        "Arial",
                        Font.PLAIN,
                        20
                )
        );

        inputPanel.add(discountCombo);

        // ==============================
        // BUTTON PANEL
        // ==============================

        JPanel buttonPanel = new JPanel(
                new FlowLayout(
                        FlowLayout.CENTER,
                        10,
                        10
                )
        );

        buttonPanel.setBackground(lightMint);

        calculateButton = new JButton(
                "Calculate"
        );

        resetButton = new JButton(
                "Reset"
        );

        saveReceiptButton = new JButton(
                "Save Receipt"
        );

        exitButton = new JButton(
                "Exit"
        );

        // ==============================
        // BUTTON SIZES
        // ==============================

        Dimension normalButtonSize =
                new Dimension(120, 45);

        Dimension saveButtonSize =
                new Dimension(145, 45);

        calculateButton.setPreferredSize(
                normalButtonSize
        );

        resetButton.setPreferredSize(
                normalButtonSize
        );

        saveReceiptButton.setPreferredSize(
                saveButtonSize
        );

        exitButton.setPreferredSize(
                normalButtonSize
        );

        // ==============================
        // BUTTON FONT
        // ==============================

        Font buttonFont = new Font(
                "Arial",
                Font.BOLD,
                16
        );

        calculateButton.setFont(buttonFont);
        resetButton.setFont(buttonFont);
        saveReceiptButton.setFont(buttonFont);
        exitButton.setFont(buttonFont);

        // ==============================
        // CALCULATE BUTTON
        // ==============================

        calculateButton.setBackground(green);
        calculateButton.setForeground(white);
        calculateButton.setFocusPainted(false);

        // ==============================
        // RESET BUTTON
        // ==============================

        resetButton.setBackground(
                new Color(90, 145, 125)
        );

        resetButton.setForeground(white);
        resetButton.setFocusPainted(false);

        // ==============================
        // SAVE RECEIPT BUTTON
        // ==============================

        saveReceiptButton.setBackground(
                new Color(45, 150, 100)
        );

        saveReceiptButton.setForeground(white);
        saveReceiptButton.setFocusPainted(false);

        // ==============================
        // EXIT BUTTON
        // ==============================

        exitButton.setBackground(
                new Color(180, 65, 65)
        );

        exitButton.setForeground(white);
        exitButton.setFocusPainted(false);

        // Add buttons
        buttonPanel.add(calculateButton);
        buttonPanel.add(resetButton);
        buttonPanel.add(saveReceiptButton);
        buttonPanel.add(exitButton);

        centerPanel.add(
                inputPanel,
                BorderLayout.CENTER
        );

        centerPanel.add(
                buttonPanel,
                BorderLayout.SOUTH
        );

        add(
                centerPanel,
                BorderLayout.CENTER
        );

        // ==============================
        // RECEIPT OUTPUT
        // ==============================

        resultArea = new JTextArea(
                14,
                40
        );

        resultArea.setFont(
                new Font(
                        "Monospaced",
                        Font.PLAIN,
                        14
                )
        );

        resultArea.setEditable(false);

        // Dark green receipt
        resultArea.setBackground(
                new Color(25, 45, 38)
        );

        // Light mint text
        resultArea.setForeground(
                new Color(220, 245, 230)
        );

        resultArea.setCaretColor(white);

        resultArea.setBorder(
                BorderFactory.createEmptyBorder(
                        10,
                        10,
                        10,
                        10
                )
        );

        // ==============================
        // SCROLL PANE
        // ==============================

        JScrollPane scrollPane =
                new JScrollPane(resultArea);

        scrollPane.setPreferredSize(
                new Dimension(700, 240)
        );

        scrollPane.setBorder(
                BorderFactory.createTitledBorder(
                        BorderFactory.createLineBorder(
                                green,
                                2
                        ),
                        "Receipt / Calculation Summary"
                )
        );

        add(
                scrollPane,
                BorderLayout.SOUTH
        );
    }

    // ==============================
    // GETTERS
    // ==============================

    public JComboBox<String> getVehicleTypeCombo() {
        return vehicleTypeCombo;
    }

    public JTextField getEntryTimeField() {
        return entryTimeField;
    }

    public JTextField getExitTimeField() {
        return exitTimeField;
    }

    public JCheckBox getOvernightCheckBox() {
        return overnightCheckBox;
    }

    public JComboBox<String> getDiscountCombo() {
        return discountCombo;
    }

    public JTextArea getResultArea() {
        return resultArea;
    }

    public JButton getCalculateButton() {
        return calculateButton;
    }

    public JButton getResetButton() {
        return resetButton;
    }

    public JButton getSaveReceiptButton() {
        return saveReceiptButton;
    }

    public JButton getExitButton() {
        return exitButton;
    }
}