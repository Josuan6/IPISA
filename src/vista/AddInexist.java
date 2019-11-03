package vista;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

import modelo.conexion;
import run.TwinLayout;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
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

public class AddInexist extends JFrame{
	JLabel txtbuscar;
	JTextField buscar;
	JPanel p2 = new JPanel();
	Connection conn = conexion.getConexion();
	JPanel p3 = new JPanel();
	public static DefaultTableModel modelo;
	int idcant_prod;
	JTable tb;
	public AddInexist() {
		JPanel Pbase = new JPanel();
		JPanel p2 = new JPanel();
		JPanel p3 = new JPanel();
		setBounds(500,100,500,500);
		setTitle("Log in");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		txtbuscar = new JLabel("Busqueda");
		buscar = new JTextField();

		p2.add(txtbuscar);
		p2.add(buscar);
		
		
		//----------------------PRUEBA DE MENU------------------------------------------
				//Pbase.setLayout(new BorderLayout());
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
						m3 = new JMenu("Start");
						m3.addMouseListener(new MouseListener() {

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
						mb.add(m3);
						mb.setBounds(20,20,100,100);
						Pbase.add(mb, BorderLayout.NORTH);
						//---------------------FIN DE PRUEBA DE MENU------------------------------------
		
		
		modelo = new DefaultTableModel();
		modelo.addColumn("Nombre");
		modelo.addColumn("Cantidad");
		modelo.addColumn("Precio");
		tb = new JTable(modelo);
		tb.addMouseListener(new MouseListener() {

			@Override
			public void mouseClicked(MouseEvent arg0) {
				int filaseleccionada = tb.getSelectedRow();
				
				if (filaseleccionada >=0) {
					String Datos[] = new String[3];			
					int s2 = 0, ce2 = 0;
					Datos[0] = tb.getValueAt(filaseleccionada, 0).toString();
					String ce = tb.getValueAt(filaseleccionada, 1).toString();
					
					String s = JOptionPane.showInputDialog(null, "Digite la cantidad que desee agregar");
					//------------------------------------------------------------------------
					float fce = Float.parseFloat(ce);
					ce2 = Math.round(fce);
					s2 = Integer.parseInt(s);
					int nc = ce2 + s2;
					
					
					
					try {
						ResultSet rs;
						PreparedStatement st0 = conn.prepareStatement("select id_cantidad from productos where nombre = ?");
						st0.setString(1, Datos[0]);
						ResultSet rs0 = st0.executeQuery();
						while (rs0.next()) {
							idcant_prod = rs0.getInt(1);
						}
						
						PreparedStatement st = conn.prepareStatement("update cantidad set cantidad = ? where id_cantidad = ?");
						st.setInt(1, nc);
						st.setInt(2, idcant_prod);
						st.executeUpdate();
					} catch (SQLException e2) {
						// TODO Auto-generated catch block
						e2.printStackTrace();
					}
					//------------------------------------------------------------------------
					
					//modelo2.addRow(Datos);
					modelo.setRowCount(0);
					buscar.setText("");
					Carga();
				}
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
		JScrollPane sc = new JScrollPane(tb);
		sc.setPreferredSize(new Dimension (450,400));
		p3.add(sc, BorderLayout.CENTER);
		
		
		buscar.addKeyListener(new KeyListener() {

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
		buscar.setPreferredSize(new Dimension(100,20));
		
		Pbase.add(p2, BorderLayout.NORTH);
		Pbase.add(p3, BorderLayout.CENTER);
		add(Pbase);
	}
	
	public void key() {
		String s = buscar.getText();
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
	public static void Carga() {
		ResultSet rs;
		try {
			Connection conn = conexion.getConexion();
			Statement st = conn.createStatement();
			rs = st.executeQuery("select p.nombre, p.precio, c.cantidad from productos as p inner join cantidad as c on p.id_cantidad = c.id_cantidad");
			String datos [] = new String[3];
			
			while (rs.next()) {
				datos[0] = rs.getString(1);//nombre
				datos[2] = String.valueOf(rs.getInt(2));//cantidad
				datos[1] = String.valueOf(rs.getFloat(3));//precio
//				System.out.println(datos[0] + " " +datos[1]+ " " + datos[2]+ " "+ datos[3]);
				modelo.addRow(datos);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
