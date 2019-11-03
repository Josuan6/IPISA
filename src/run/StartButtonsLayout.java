package run;

import java.awt.Component;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.LayoutManager;

public class StartButtonsLayout implements LayoutManager{

	@Override
	public void addLayoutComponent(String arg0, Component arg1) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void layoutContainer(Container e) {
		int x,y = 20;

		int d =e.getWidth();
		x = d/2;
		int contador = 0;
		int n=e.getComponentCount();
		
		for (int i = 0; i<n;i++) {
			contador++;
			
			Component c=e.getComponent(i);
			c.setBounds(x-200, y, 210, 50);
			x+=220;
			if (contador%2==0) {
				x=d/2;
				y+=80;
			}
		}
		
	}

	@Override
	public Dimension minimumLayoutSize(Container arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Dimension preferredLayoutSize(Container arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void removeLayoutComponent(Component arg0) {
		// TODO Auto-generated method stub
		
	}
	
}
