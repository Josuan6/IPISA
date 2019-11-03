package Reportes;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import modelo.conexion;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;

public abstract class reporte {
	private static JasperReport report;
	
	private static JasperPrint reportFilled;
	
	private static JasperViewer viewer;
	static Map parametro;
	 
	
	public static void createReport (Connection conn, String path, int paramet) {
		try {
			parametro = new HashMap();
		parametro.put("Parametro", paramet);
			report = (JasperReport)JRLoader.loadObject(new File (path));
			reportFilled = JasperFillManager.fillReport(report,parametro,conn);
		}catch(JRException e) {
			e.printStackTrace();
		}
		
	}
	
	public static void showViewer() {
		viewer =new JasperViewer(reportFilled);
		viewer.setVisible(true);
	}
	
	public static void exportToPDF(String destination) {
		try {
			JasperExportManager.exportReportToPdfFile(reportFilled, destination);
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
