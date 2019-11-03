package run;

import java.awt.Component;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.LayoutManager;

public class TopLayoutInicio implements LayoutManager{

	@Override
	public void addLayoutComponent(String arg0, Component arg1) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void layoutContainer(Container e) {
		int x,y = 20;

		int d =e.getWidth();
		x = 20;
		int n=e.getComponentCount();
		
		for (int i = 0; i<n;i++) {
			
			Component c=e.getComponent(i);
			c.setBounds(x, y, 100, 20);
			x+=110;
			
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
