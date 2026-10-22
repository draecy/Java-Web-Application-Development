package libraryregistrationapp;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class ConfirmationPage extends JFrame {
    public ConfirmationPage(String name, String id, String programme, String gender, String year) {
        setTitle("Registration Confirmation");
        setSize(350, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(new GridLayout(7, 1, 5, 5));
        
        JLabel successLabel = new JLabel("Registration Successful!");
        add(successLabel);
        
        JLabel nameLabel = new JLabel("Full Name: " + name);
        add(nameLabel);
        
        JLabel idLabel = new JLabel("Student ID: " + id);
        add(idLabel);
        
        JLabel programmeLabel = new JLabel("Programme: " + programme);
        add(programmeLabel);
        
        JLabel genderLabel = new JLabel("Gender: " + gender);
        add(genderLabel);
        
        JLabel yearLabel = new JLabel("Year Of Study: " + year);
        add(yearLabel);
        
        JButton closeBtn = new JButton("Close");
        closeBtn.addActionListener(e -> System.exit(0));
        add(closeBtn);
        
        setVisible(true);
    }
}
