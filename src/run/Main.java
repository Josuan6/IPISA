package run;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.swing.JFrame;
import javax.swing.UIManager;

import controlador.MButtons;
import controlador.MCheckin;
import vista.*;
import vista.reportframe;

public class Main {

	public static void main(String[] args) {
		//Vista v = new Vista();
		MButtons m = new MButtons();
		//Medicar medi = new Medicar();
		//medi.setVisible(true);
		//medi.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//MCheckin m2 = new MCheckin();
		// TODO Auto-generated method stub
		/*frame f = new frame();
		f.setVisible(true);
		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);*/
		//reportframe f = new reportframe(); 
		try {
            // Modificamos la apariencia.
            UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
		 
	        // Mostrar la fecha y la hora usando toString ()
	}

}
