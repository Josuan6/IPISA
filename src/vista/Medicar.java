package vista;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.*;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.table.DefaultTableModel;

import modelo.Modelo;
import modelo.conexion;
import run.MedicarLayout;

public class Medicar  extends JFrame{
	Inicio i = new Inicio();
	Vista v = new Vista();
	String medicina = "", dosis = "";
	String medida = "";
	String tipo = "";
	String [] datos = new String [20];
	DefaultListModel lista = new DefaultListModel();
	JTextField sintomas = new JTextField();
	JLabel txtsintomas = new JLabel("Sintomas:");
	JLabel txtmsintomas = new JLabel("Sintomas Presentados:");
	JLabel txtdiagnostico = new JLabel("Diagnostico:");
	JLabel txtmedicina = new JLabel("Medicado con:");
	JLabel txtdosis = new JLabel("Dosis:");
	JLabel txtmensaje = new JLabel("Atiende a:");
	JLabel doctora = new JLabel(v.Saludo);
	JLabel paciente = new JLabel(i.Nombre);
	JTextArea diagnostico = new JTextArea();
	JList lsintomas = new JList();
	JComboBox cbmedicina;
	JSpinner fdosis = new JSpinner();
	JTable tb = new JTable();
	JScrollPane s;
	JButton bt = new JButton("Aceptar");
	public static DefaultTableModel modelo;
	public static DefaultComboBoxModel modelocombo;
	
	public Medicar(){
		JPanel p = new JPanel();
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
		mb.setBounds(0,0,1050,30); // cambiar medidas
		mb.setBackground(Color.LIGHT_GRAY);
		p.add(mb);
         
		this.setBounds(175,50,1050,500);
		this.setTitle("Enfermeria");
		// Inicia el codigo
		p.setLayout(null);
		sintomas.addKeyListener(new KeyListener() {

			@Override
			public void keyPressed(KeyEvent e3) {
				
			}

			@Override
			public void keyReleased(KeyEvent e3) {
				if(e3.getKeyCode() == e3.VK_ENTER) {
					lista.addElement(sintomas.getText());
					lsintomas.setModel(lista);
					sintomas.setText("");
					
				}
				
			}

			@Override
			public void keyTyped(KeyEvent e3) {
			}});
		JScrollPane sc2 = new JScrollPane(diagnostico);
		doctora.setBounds(10, 30, 80, 20);
		txtmensaje.setBounds(100, 30, 80, 20);
		paciente.setBounds(170, 30, 80, 20);
		txtsintomas.setBounds(10, 60, 60, 20);
		sintomas.setBounds(80, 60, 160, 25);
		//txtdiagnostico.setBounds(10, 90, 80, 20);
		txtdiagnostico.setBounds(270, 60, 140, 20);
		JScrollPane sc1 = new JScrollPane(lsintomas);
		sc1.setBounds(80, 100, 160, 285);
		sc2.setBounds(270, 90, 150, 295);
		txtmedicina.setBounds(440, 60, 90, 20);
		//-------------------------------------------------------------------------------------------------
		modelo = new DefaultTableModel();
		modelo.addColumn("Medicina");
		modelo.addColumn("Dosis");
		modelo.addColumn("Medida");
		modelo.addColumn("Tipo");
		tb = new JTable(modelo);
		JScrollPane sc = new JScrollPane(tb);
		sc.setBorder(BorderFactory.createLineBorder(Color.BLACK, 1));
		sc.setBounds(440, 90, 510, 295);
		//sc.setPreferredSize(new Dimension (933,500));
		p.add(sc, BorderLayout.CENTER);
		//-------------------------------------------------------------------------------------------------
		modelocombo = new DefaultComboBoxModel();
		modelocombo.setSelectedItem("---- None ----");
		CargaCombo();
		cbmedicina = new JComboBox(modelocombo);
		cbmedicina.addActionListener(new ActionListener () {

			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println(cbmedicina.getSelectedItem());
				int rowcount;
				rowcount = tb.getRowCount();
				medicina = (String) cbmedicina.getSelectedItem();
				try {
					PreparedStatement pst = conexion.getConexion().prepareStatement("select t.tipo_medicina, u.abreviacion from medicina as m inner join tipo_medicina as t on t.id_tipo_medicina = m. id_medicina inner join medida_medicina as u on u.id_medida_medicina = m.id_medicina where nombre_medicina = ?");
					pst.setString(1, medicina);
					ResultSet rs = pst.executeQuery();
					while(rs.next()) {
						medida = rs.getString(2);
						tipo = rs.getString(1);
					}
				}catch(SQLException p) {
					
				}
				for(int j = 0; j < rowcount; j++) {
					System.out.println(rowcount = tb.getRowCount());
					System.out.println(tb.getValueAt(j, 0));
					
					if (cbmedicina.getSelectedItem() == tb.getValueAt(j, 0)) {
					}else {
						datos [0] = (String) cbmedicina.getSelectedItem();
						datos[2] = medida;
						datos[3] = tipo;
						modelo.addRow(datos);
						tb.setModel(modelo);
					}
				}
				if (rowcount == 0) {
					datos [0] = (String) cbmedicina.getSelectedItem();
					datos[2] = medida;
					datos[3] = tipo;
					modelo.addRow(datos);
					tb.setModel(modelo);
				}
				
			}
			
		});
		cbmedicina.setBounds(530, 60, 160, 25);
		txtdosis.setBounds(730, 60, 50, 20);
		fdosis.setBounds(785, 60, 160, 25);
		fdosis.addChangeListener(new ChangeListener () {

			@Override
			public void stateChanged(ChangeEvent e) {
				int rowcount;
				int cb = (int) fdosis.getValue();
				String scb = String.valueOf(cb);
				rowcount = tb.getRowCount();
				for(int j = 0; j < rowcount; j++) {
					System.out.println(tb.getValueAt(j, 0));
					if (cbmedicina.getSelectedItem() == tb.getValueAt(j, 0)) {
						
							tb.setValueAt(scb, j, 1);
					}
				}
			}
			
		});
		bt.setBounds(900, 400, 100, 40);
		diagnostico.setBorder(BorderFactory.createLineBorder(Color.BLACK, 1));
		sc1.setBorder(BorderFactory.createLineBorder(Color.BLACK, 1));
		sintomas.setBorder(BorderFactory.createLineBorder(Color.BLACK, 1));
		fdosis.setBorder(BorderFactory.createLineBorder(Color.BLACK, 1));
		
		p.add(doctora);
		p.add(txtmensaje);
		p.add(paciente);
		p.add(txtsintomas);
		p.add(sintomas);
		p.add(txtdiagnostico);
		p.add(sc2);
		p.add(txtmsintomas);
		p.add(sc1);
		p.add(txtmedicina);
		p.add(cbmedicina);
		p.add(txtdosis);
		p.add(fdosis);
		p.add(bt);
		this.add(p);	
	}
	public static void CargaCombo() {
		ResultSet rs;
		try {
			Connection conn = conexion.getConexion();
			Statement st = conn.createStatement();
			rs = st.executeQuery("select nombre_medicina from medicina");
			while (rs.next()) {
				modelocombo.addElement(rs.getString(1));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
