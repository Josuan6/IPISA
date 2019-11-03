package vista;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import modelo.Modelo;
import modelo.conexion;
import run.TwinLayout;

public class CheckInView extends JFrame{
	
	public JTextField nom, ape, correo, pass, rpass, direc,tel, user, rol;
	public JButton aceptar;
	
	public CheckInView() {
		
		JPanel p = new JPanel();
		setBounds(500,100,500,500);
		setTitle("Registro");
		setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
		p.setLayout(new TwinLayout());
		
		JTextArea txtuser = new JTextArea("Usuario");
		txtuser.setEditable(false);
		txtuser.setBackground(null);
		JTextArea txtpass = new JTextArea("Clave");
		txtpass.setEditable(false);
		txtpass.setBackground(null);
		JTextArea txtrpass = new JTextArea("Repita Clave");
		txtrpass.setEditable(false);
		txtrpass.setBackground(null);
		
		nom = new JTextField();
		ape = new JTextField();
		correo = new JTextField();
		tel = new JTextField();
		direc = new JTextField();
		user = new JTextField();
		pass = new JTextField();
		rpass = new JTextField();
		
		aceptar = new JButton("Aceptar");
		aceptar.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				//System.out.print("holota");
				/*Modelo model = new Modelo();*/
				registra();
				
			}
			
		});
		
		p.add(txtuser);
		p.add(user);
		p.add(txtpass);
		p.add(pass);
		p.add(txtrpass);
		p.add(rpass);
		p.add(aceptar);
		
		this.add(p);
	}
	
	public void registra() {
				String usu = user.getText(),passw = pass.getText(), passw2 = rpass.getText();
		if (!usu.equals("") && !passw.equals("")) {
			if (passw.equals(passw2)) {
				Connection conn = conexion.getConexion();
		try {
			
			conn.setAutoCommit(false);
			PreparedStatement st0 = conn.prepareStatement("SELECT MAX(id_persona) AS id FROM persona");
			ResultSet rs = st0.executeQuery();
			int id_persona = 0;
			while(rs.next()) {
				id_persona = rs.getInt(1);
			}
			System.out.println(id_persona);
			PreparedStatement st2 = conn.prepareStatement("insert into usuario (usuario, clave, id_roll, id_persona) values (?,?,?,?)");
			st2.setString(1, usu);
			st2.setString(2, passw);
			st2.setInt(3, 1);
			st2.setInt(4, id_persona);
			st2.executeUpdate();
			//ResultSet rs =st.execute();
			conn.commit();
			//System.out.print("holita");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
			} else System.out.print("Claves no coinciden");
		} else System.out.print("Algun campo esta vacio");
	}

}
