import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainApp {

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                final ParkingGUI gui = new ParkingGUI();
                final ParkingCalculator calculator = new ParkingCalculator(gui);

                gui.getSaveReceiptButton().addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        calculator.saveReceiptWithFileChooser();
                    }
                });

                // Reset Button
                gui.getResetButton().addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        gui.getVehicleTypeCombo().setSelectedIndex(0);
                        gui.getEntryTimeField().setText("");
                        gui.getExitTimeField().setText("");
                        gui.getOvernightCheckBox().setSelected(false);
                        gui.getDiscountCombo().setSelectedIndex(0);
                        gui.getResultArea().setText("");
                        gui.getEntryTimeField().requestFocus();
                    }
                });

                // Exit Button
                gui.getExitButton().addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        int confirm = JOptionPane.showConfirmDialog(
                                gui,
                                "Are you sure you want to exit?",
                                "Exit Confirmation",
                                JOptionPane.YES_NO_OPTION
                        );
                        if (confirm == JOptionPane.YES_OPTION) {
                            System.exit(0);
                        }
                    }
                });

                gui.setVisible(true);
            }
        });
    }
}