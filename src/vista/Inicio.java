package vista;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.sql.*;
import java.util.ArrayList;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;

import Reportes.reporte;
import modelo.Modelo;
import modelo.conexion;
import run.TopLayoutInicio;
import run.TwinLayout;

public class Inicio extends JFrame{
	Connection conn = conexion.getConexion();
	public static String Nombre;
	public static String metadata;
	public JTable tbpaciente;
	public static DefaultTableModel modelo;
	JPanel p2 = new JPanel();
	JPanel p3 = new JPanel();
	JTextField clientef;
	public Inicio () {
		
		JPanel p = new JPanel(); // lamina principal
		p3.setLayout(new BorderLayout());
		p.setLayout(new BorderLayout());
		setBounds(175,50,1050,650);
		setTitle("Log in");
		//----------------------PRUEBA DE MENU------------------------------------------
		JMenuBar mb;
		JMenu m1,m2,m3;
		
		JMenuItem close;
		mb = new JMenuBar();
		m1 = new JMenu("Opciones");
		close = new JMenuItem("Cerrar sesion");
		close.addActionListener(new ActionListener () {

			@Override
			public void actionPerformed(ActionEvent e) {
				Modelo model = new Modelo();
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
		mb.setBounds(0,0,100,100); // cambiar medidas
		p.add(mb, BorderLayout.NORTH);
	//	p2.setLayout(null);
		JLabel saludo = new JLabel(Vista.Saludo);
		JLabel cliente = new JLabel("Atiendo a:");
		clientef = new JTextField("Nombre del Paciente");
		 clientef.setBounds(new Rectangle(0, 0, 100, 20));
		clientef.addKeyListener(new KeyListener() {

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
		JTextPane Buscar = new JTextPane();
		String [] array_filtro = new String [7];
		array_filtro [0] = "Curso";
		array_filtro [1] = "Ocupacion";
		array_filtro [2] = "Nombre";
		array_filtro [3] = "Apellido";
		JComboBox filtro = new JComboBox(array_filtro);
		filtro.setSize(100, 20);
		Buscar.setSize(100, 20);
		//p2.setLayout(null);
		p2.add(cliente);
		p2.add(clientef);
		p2.add(filtro);
		p3.add(p2, BorderLayout.NORTH);
		//---------------------FIN DE PRUEBA DE MENU------------------------------------
		modelo = new DefaultTableModel();
		modelo.addColumn("Nombres");
		modelo.addColumn("Apellidos");
		modelo.addColumn("Ocupacion");
		modelo.addColumn("Edad");
		Carga();
	tbpaciente = new JTable(modelo);
	JScrollPane sc = new JScrollPane(tbpaciente);
	sc.setPreferredSize(new Dimension (933,500));
	p3.add(sc, BorderLayout.CENTER);
	p.add(p3);
	
	tbpaciente.addMouseListener(new MouseListener() {

		@Override
		public void mouseClicked(MouseEvent e) {
			int row = tbpaciente.getSelectedRow();
			int column = tbpaciente.getSelectedColumn();
			
			Nombre = (String) tbpaciente.getValueAt(row, column);
			metadata = (String) filtro.getSelectedItem();
			Medicar medi = new Medicar();
			medi.setVisible(true);
	        setVisible(false);
	        Vista view = new Vista();	
			view.setVisible(false);
			medi.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
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
			// TODO Auto-generated method stub
			
		}

		@Override
		public void mouseReleased(MouseEvent arg0) {
			// TODO Auto-generated method stub
			
		}
		
	});
	
	String Datos[] = new String[4];	
	
	JButton print = new JButton("Ver Detalles.");
	print.addActionListener(new ActionListener() {

		@Override
		public void actionPerformed(ActionEvent arg0) {
			
		
		}
		
	});
	JButton boton = new JButton("Ver Detalles");
	p3.add(boton, BorderLayout.SOUTH);
	add(p);
	}
	
	//Esto Carga los productos en la tabla 1 existentes en la base de datos(nombre cantidad y precio). 
	public static void Carga() {
		ResultSet rs;
		String datos [] = new String[4];
		try {
			Connection conn = conexion.getConexion();
			PreparedStatement st = conn.prepareStatement("select nombre, apellidos, edad from persona where ? = ?"); // falta selecionar ocupacion
			st.setString(1, metadata);// columna 
			st.setString(2, Nombre);// valor
			rs = st.executeQuery();
			while (rs.next()) {
				datos[0] = rs.getString(1);//nombres
				datos[1] = String.valueOf(rs.getInt(2));//apellidos
				datos[2] = String.valueOf(rs.getFloat(3));//edad
				int edad = rs.getInt(2);
				
//				System.out.println(datos[0] + " " +datos[1]+ " " + datos[2]+ " "+ datos[3]);
				modelo.addRow(datos);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void key() {
		String var = clientef.getText();
		// --------------------------------------------ESTO NO ESTA TERMINADO -----------------------------------------------------
		if (!var.equals("")) {
			System.out.println(var);
		try {
			ResultSet rs;
			Connection conn = conexion.getConexion();
			Statement st = conn.createStatement();
			rs = st.executeQuery("select p.nombre, p.apellidos, c.cargo, p.edad from persona as p inner join cargo as c on p.id_persona = c.id_cargo where p.nombre like '%"+var+"%'");
			/*PreparedStatement st = conn.prepareStatement("select * from product where name like '?%'");
			st.setString(1, nom.getText().toString());
			//st.executeUpdate();
			rs = st.executeQuery();*/
			modelo.setRowCount(0);
			while(rs.next()) {
				System.out.println(rs.getString(2));
				String [] Datos = new String[4]; 
				int edad = rs.getInt(4);
				Datos[0] = rs.getString(1);
				Datos[1] = rs.getString(2);
				Datos[2] = rs.getString(3);
				Datos[3] = String.valueOf(edad);
				
				
				modelo.addRow(Datos);
				tbpaciente.setModel(modelo);
				
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
	
}

