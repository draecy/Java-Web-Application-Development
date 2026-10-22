package libraryregistrationapp;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class RegistrationPage extends JFrame implements ActionListener {
    private JTextField nameTextField, idTextField, programmeTextField;
    private JRadioButton maleRb, femaleRb;
    private JComboBox<String> yearBox;
    private JButton registerBtn, exitBtn;
    
    public RegistrationPage() {
        setTitle("Library Membership Registration");
        setSize(450, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(new GridLayout(7, 2, 5, 5));

        JLabel nameLabel = new JLabel("Full Name: ");
        nameTextField = new JTextField();
        add(nameLabel);
        add(nameTextField);

        JLabel idLabel = new JLabel("Student ID: ");
        idTextField = new JTextField();
        add(idLabel);
        add(idTextField);

        JLabel programmeLabel = new JLabel("Programme: ");
        programmeTextField = new JTextField();
        add(programmeLabel);
        add(programmeTextField);
        
        JLabel genderLabel = new JLabel("Gender: ");
        add(genderLabel);

        femaleRb = new JRadioButton("Female");
        maleRb = new JRadioButton("Male");
        ButtonGroup genderGroup = new ButtonGroup();
        genderGroup.add(femaleRb);
        genderGroup.add(maleRb);
        
        JPanel genderPanel = new JPanel();
        genderPanel.add(femaleRb);
        genderPanel.add(maleRb);
        add(genderPanel);

        JLabel yearLabel = new JLabel("Year Of Study: ");
        add(yearLabel);
        String[] yearOfStudy = {"1", "2", "3"};
        yearBox = new JComboBox<>(yearOfStudy);
        add(yearBox);

        registerBtn = new JButton("Register");
        add(registerBtn);
        registerBtn.addActionListener(this);
        
        exitBtn = new JButton("Exit");
        add(exitBtn);
        exitBtn.addActionListener(this);

        setVisible(true);
    }
    
    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == registerBtn) {
            String name = nameTextField.getText().trim();
            String id = idTextField.getText().trim();
            String programme = programmeTextField.getText().trim();
            
            String gender = "";
            if(maleRb.isSelected()) {
                gender = "Male";
            } else if(femaleRb.isSelected()) {
                gender = "Female";
            }
            
            String year = (String) yearBox.getSelectedItem();
            
            if(name.isEmpty() || id.isEmpty() || programme.isEmpty() || gender.isEmpty()) {
                JOptionPane.showMessageDialog(this,
                        "Please fill in all fields",
                        "Error",
                        JOptionPane.ERROR_MESSAGE);
            } else {
                ConfirmationPage confirm = new ConfirmationPage(name, id, programme, gender, year);
                dispose();
            }
        } else if(e.getSource() == exitBtn) {
            System.exit(0);
        }
    }
    
    public static void main(String[] args){
        SwingUtilities.invokeLater(() -> new RegistrationPage());
    }
}