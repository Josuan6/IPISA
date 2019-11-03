package vista;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

import Reportes.reporte;

public class reportframe extends JFrame{
	Connection conn;
	public reportframe() {
		JPanel p = new JPanel();
		setBounds(500,100,500,500);
		setTitle("reporte");
		JButton ver = new JButton("ver");
		JButton exportar = new JButton("exportar");
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java1","root","Josuan_25");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// el el evento del boton generar
		ver.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				// TODO Auto-generated method stub
				reporte.showViewer();
			}
			
		});
		
		exportar.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				// TODO Auto-generated method stub
				reporte.exportToPDF("/home/josuan/Videos/reporte.pdf");
			}
			
		});
		
		p.add(ver);
		p.add(exportar);
		add(p);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//en el evento del boton exportar
	}

}
