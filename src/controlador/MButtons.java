package controlador;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;

import modelo.Modelo;
import vista.CheckInView;
import vista.Vista;

public class MButtons implements ActionListener{
	
	Vista view = new Vista();
	CheckInView civ = new CheckInView();
	Modelo model = new Modelo();
	
	
	public MButtons() {
		view.checkin.setActionCommand("checkin");
	view.checkin.addActionListener(this);
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// La fuente hay que verla
		if ( e.getActionCommand().equals("checkin")) {
			//civ.setVisible(true);
		}
	}
	
	

}
