package vista;

import com.mysql.cj.protocol.Resultset;

import modelo.Modelo;
import modelo.conexion;
import run.TwinLayout;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;

public class Agregar extends JFrame{
	JTextArea txtnom,txtcant,txtpre, txttipo;
	JTextField nom,cant,pre;
	int id_unidad_medida,idcant;
	JPanel p2 = new JPanel();
	JPanel p3 = new JPanel();
	DefaultTableModel modelo;
	JTable tb;
	JComboBox<String> cb;
	Connection conn = conexion.getConexion();
	public Agregar() {
		JPanel p = new JPanel();
		setBounds(500,100,500,500);
		setTitle("Log in");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//----------------------PRUEBA DE MENU------------------------------------------
		p.setLayout(new BorderLayout());
				JMenuBar mb;
				JMenu m1,m2,m3;
				JMenuItem close, addNexist;
				mb = new JMenuBar();
				m1 = new JMenu("Opciones");
				close = new JMenuItem("Cerrar sesion");
				close.addActionListener(new ActionListener () {

					@Override
					public void actionPerformed(ActionEvent e) {
						Vista view = new Vista();
					    setVisible(false);	
						view.setVisible(true);
						
					}
					
				});
				m1.add(close);
				m2 = new JMenu("Start");
				m2.addMouseListener(new MouseListener() {

					@Override
					public void mouseClicked(MouseEvent arg0) {
						// TODO Auto-generated method stub
						
					}

					@Override
					public void mouseEntered(MouseEvent arg0) {
						// TODO Auto-generated method stub
						
					}

					@Override
					public void mouseExited(MouseEvent arg0) {
						// TODO Auto-generated method stub
						
					}

					@Override
					public void mousePressed(MouseEvent arg0) {
						Start a = new Start();
						setVisible(false);
						a.setVisible(true);
						
					}

					@Override
					public void mouseReleased(MouseEvent arg0) {
						// TODO Auto-generated method stub
						
					}
					
				});
			
				mb.add(m1);
				mb.add(m2);
				mb.setBounds(20,20,100,100);
				p.add(mb, BorderLayout.NORTH);
				//---------------------FIN DE PRUEBA DE MENU------------------------------------
		txtnom = new JTextArea("Nombre");
		txtnom.setEditable(false);
		txtnom.setBackground(null);
		
		txttipo = new JTextArea("Tipo");
		txttipo.setEditable(false);
		txttipo.setBackground(null);
		
		txtcant = new JTextArea("Cantidad");
		txtcant.setEditable(false);
		txtcant.setBackground(null);
		
		txtpre = new JTextArea("Precio");
		txtpre.setEditable(false);
		txtpre.setBackground(null);
		
		nom = new JTextField();
		nom.addKeyListener(new KeyListener() {

			@Override
			public void keyPressed(KeyEvent e) {
				//key();
				
			}
				

			@Override
			public void keyReleased(KeyEvent arg0) {
				// TODO Auto-generated method stub
				key();
				
			}

			@Override
			public void keyTyped(KeyEvent arg0) {
				// TODO Auto-generated method stub
				//key();
			}
			
		});
		cant = new JTextField();
		pre = new JTextField();
		
		JButton Acept = new JButton("Aceptar");
		Acept.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				registra();
				
				Inicio ini = new Inicio();
				/*ini.modelo.setRowCount(0);
				ini.Carga();*/
			}
			
		});
		modelo = new DefaultTableModel();
		modelo.addColumn("Nombre");
		modelo.addColumn("Cantidad");
		modelo.addColumn("Precio");
		p3.setLayout(new BorderLayout());
		tb = new JTable(modelo);
		JScrollPane sc = new JScrollPane(tb);
		sc.setPreferredSize(new Dimension (450,100));
		
		cb = new JComboBox<String>();
		cb.addItem("none");
		combometodo();
		cb.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				System.out.println(cb.getSelectedItem());
				
			}
			
		});
		
		p3.add(sc, BorderLayout.CENTER);
		JTextArea ta = new JTextArea();
		p3.add(ta,BorderLayout.SOUTH);
		p.add(p3,BorderLayout.SOUTH);
		
		p2.setLayout(new TwinLayout());
		p2.add(txtnom);
		p2.add(nom);
		p2.add(txttipo);
		p2.add(cb);
		p2.add(txtcant);
		p2.add(cant);
		p2.add(txtpre);
		p2.add(pre);
		p2.add(Acept);
		p.add(p2,BorderLayout.CENTER);
		add(p);
	}
	String [] Datos = new String[1]; 
	
	
	public void registra() {
		String nomb = nom.getText(), canti = cant.getText(), prec = pre.getText(), unidad_medida = cb.getSelectedItem().toString();
		System.out.println(unidad_medida);
		if (!nomb.equals("") && !canti.equals("") && !prec.equals("") && !unidad_medida.equals("none")) {
			byte c = 1;
			float precio2 = Float.parseFloat(prec);
			float cant2 = Float.parseFloat(canti);
		try {
			ResultSet rs;
			Statement stid = conn.createStatement();
			rs = stid.executeQuery("select id_unidad_medida from unidad_medida where nombre = '"+unidad_medida+"'");
			while (rs.next()) {
				id_unidad_medida = rs.getInt(1);
				System.out.println(id_unidad_medida);
				System.out.println(unidad_medida);
			}
			PreparedStatement st2 = conn.prepareStatement("insert into cantidad (cantidad, id_unidad_medida) values (?,?)");
			st2.setFloat(1, cant2);
			st2.setInt(2, id_unidad_medida);
			st2.executeUpdate();
			
			
			// Obteniendo el valor del id de cantidad para relacionarlo con producto usando "max".
			Statement stidc = conn.createStatement();
			ResultSet rsidc = stidc.executeQuery("select max(id_cantidad) from cantidad order by id_cantidad desc");
			while (rsidc.next()) {
				idcant = rsidc.getInt(1);
			}
			PreparedStatement st = conn.prepareStatement("insert into productos (nombre, precio, is_organic, id_Cantidad) values (?,?,?,?)");
			st.setString(1, nomb);
			st.setFloat(2, precio2);
			st.setByte(3, c);
			st.setInt(4, idcant);
			st.executeUpdate();
			//ResultSet rs =st.execute();
			
			//System.out.print("holita");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		} else JOptionPane.showMessageDialog(null, "Algun campo esta vacio"); 
	}
	public void key() {
		String s = nom.getText();
		// --------------------------------------------ESTO NO ESTA TERMINADO -----------------------------------------------------
		if (!s.equals("")) {
			System.out.println(s);
		try {
			ResultSet rs;
			Connection conn = conexion.getConexion();
			Statement st = conn.createStatement();
			rs = st.executeQuery("select p.nombre, p.precio, c.cantidad from productos as p inner join cantidad as c on p.id_cantidad = c.id_cantidad where p.nombre like '%"+s+"%'");
			/*PreparedStatement st = conn.prepareStatement("select * from product where name like '?%'");
			st.setString(1, nom.getText().toString());
			//st.executeUpdate();
			rs = st.executeQuery();*/
			modelo.setRowCount(0);
			while(rs.next()) {
				System.out.println(rs.getString(2));
				String [] Datos = new String[3]; 
				Datos[0] = rs.getString(1);
				Datos[2] = rs.getString(2);
				Datos[1] = rs.getString(3);
				
				
				modelo.addRow(Datos);
				tb.setModel(modelo);
				
			}
			
			//System.out.print("holita");
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		}else {
			System.out.println("Vacio");
			modelo.setRowCount(0);
		}
	}
	
	public void combometodo() {
		try {
			ResultSet rs;
			Statement st = conn.createStatement();
			rs = st.executeQuery("select nombre from unidad_medida");
			while(rs.next()) {
				 cb.addItem(rs.getString(1));
			}
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
	}
}
