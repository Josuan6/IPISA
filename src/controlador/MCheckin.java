package controlador;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import modelo.Modelo;
import vista.CheckInView;

public class MCheckin implements ActionListener{
	CheckInView civ = new CheckInView();
	Modelo model = new Modelo();
	public MCheckin(){
		civ.aceptar.setActionCommand("");
		civ.aceptar.addActionListener(this);
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getActionCommand().equals("")) {
			System.out.print("holota");
			//model.registra();
		}
		
	}

}
