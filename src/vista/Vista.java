package vista;

import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.UIManager;

import modelo.Modelo;
import modelo.conexion;
import run.TwinLayout;

public class Vista extends JFrame{
	JTextField user;
	JTextField pass;
	public static String Saludo;
	public static int id_usuario;
	
	public Vista() {
		try {
            // Modificamos la apariencia.
            UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
		JPanel p = new JPanel();
		//setBounds(500,100,500,500);
		setBounds(175,50,1050,650);
		setTitle("Iniciar Session");
		
		p.setLayout(null);
		JLabel txtuser = new JLabel("Usuario");
		JLabel txtpass = new JLabel("Clave");
		user = new JTextField();
		pass = new JTextField();
		JButton log = new JButton("Ingresar");
		Toolkit t = getToolkit();
		int y = t.getScreenSize().height/2;
		int x = t.getScreenSize().width/2;
		user.setBounds(425, 200, 160, 30);
		pass.setBounds(425, 250, 160, 30);
		txtuser.setBounds(350, 200, 80, 30);
		txtpass.setBounds(350, 250, 80, 30);
		log.setBounds(485, 285, 100, 30);
		log.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				Autentificar();
				
			}
			
		});
		checkin = new JButton("Registro");
		p.add(txtuser);
		p.add(user);
		p.add(txtpass);
		p.add(pass);
		p.add(log);
		p.add(checkin);
		add(p);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	public JButton checkin;
	String []datos  = new String[2];
	public void Autentificar() {

		try {
			Connection conn = conexion.getConexion();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("Select usuario,clave,id_usuario from usuario");
			boolean vf = false;
			String usu = user.getText();
			String clave = pass.getText();
			while (rs.next()) {
				datos[0] = rs.getString(1);
				datos[1] = rs.getString(2);
				id_usuario = rs.getInt(3);
				if (usu.equals(datos[0]) && clave.equals(datos[1])) {
					vf = true;
					Saludo = rs.getString(1);
					Modelo model = new Modelo();
					//model.inicio(true);
					/*Inicio i = new Inicio();
					i.setVisible(true);
					this.setVisible(false);*/
					Start i2 = new Start();
					i2.setVisible(true);
					this.setVisible(false);
					break;
				}
				
				//System.out.println( rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(6));
			}
			/*if (vf=true) {
				JOptionPane.showMessageDialog(null, "Welcome");
			}else if (vf=false) {JOptionPane.showMessageDialog(null, "User Doesnt Exist");}*/
			
			//System.out.print("holita");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
