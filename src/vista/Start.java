package vista;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

import modelo.Modelo;
import run.StartButtonsLayout;

public class Start extends JFrame{
	JPanel p = new JPanel();
	Box h1,h2,h3,h4;
	public Start(){
		setBounds(500,100,500,500);
		setTitle("Start");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		  ImageIcon ImageIcon = new ImageIcon("/home/josuan/Videos/149086-essential-set/png/home.icono");
	        Image image = ImageIcon.getImage();
	        this.setIconImage(image);
		p.setLayout(new StartButtonsLayout());
		
		//h1 = Box.createHorizontalBox();
		
		//h1.setSize(new Dimension (300,300));
		//h1.setBounds(100, 20, 400, 50);
		boton("Tratar Paciente.","btinit","/home/josuan/Videos/149086-essential-set/png/home.icono");
		boton("Agregar Producto","add_inex","");
		boton("Agregar a Inventario","add_exist","");
		boton("Reporte General","","");
		//p.add(h1);
		
		//h2 = Box.createHorizontalBox();
		//h1.setSize(new Dimension (300,300));
		//h2.setBounds(100, 70, 400, 50);
		boton("Reporte de Personal","","");
		boton("Reporte de Clientes","","");
		boton("Reporte de Productos","","");
		boton("Reporte Financiero","","");
		boton("Proximamente","","");
		boton("Cerrar sesion","CloseOperation","");
		//p.add(h2);
		add(p);
		
		setVisible(true);
	}
	public void boton (String titulo, String comand, String dir) {
		Font fuente = new Font("Serif",Font.BOLD,14);
		JButton boton = new JButton();
		boton.setText(titulo);
		boton.setIcon(new ImageIcon(dir));

		// Texto en el centro y debajo del icono
		boton.setHorizontalTextPosition( SwingConstants.CENTER);
		boton.setVerticalTextPosition( SwingConstants.BOTTOM );
		boton.setBackground(Color.WHITE);
		boton.setFont(fuente);
		//boton.setIcon(new ImageIcon("inicio.png"));
		//boton.setHorizontalAlignment(JButton.NORTH_EAST);
		boton.setActionCommand(comand);
		boton.addActionListener(new events());
		p.add(boton);
		//Box.createHorizontalStrut(10);
					
			}
	
	public class events implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			if(e.getActionCommand().equals("btinit")) {
				Inicio i = new Inicio();
				i.setVisible(true);
				setVisible(false);
			}else if (e.getActionCommand().equals("add_inex")) {
				Agregar a = new Agregar();
				setVisible(false);
				a.setVisible(true);
			}else if (e.getActionCommand().equals("add_exist")) {
				AddInexist a = new AddInexist();
				setVisible(false);
				a.setVisible(true);
			}else if (e.getActionCommand().equals("CloseOperation")) {
				Modelo model = new Modelo();
				Vista view = new Vista();
			    setVisible(false);	
				view.setVisible(true);
			}
			
		}
		
	}
}
