package com.kh.client.view;

import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.RenderingHints;

import javax.swing.Action;
import javax.swing.Icon;
import javax.swing.JButton;

public class RoundButton extends JButton {
	
	public RoundButton() {
		super();
	}
	
	public RoundButton(String text) {
		super(text);
	}
	
	public RoundButton(Action action) {
		super(action);
	}
	public RoundButton(Icon icon) {
		super(icon);
	}
	
	public RoundButton(String text, Icon icon) {
		super(text,icon);
	}

	protected void decorate() {
		setBorderPainted(false);
		setOpaque(false);
	}
	
	@Override
	protected void paintComponent(Graphics g) {
		int width = getWidth();
		int height = getHeight();
		
		Graphics2D graphics = (Graphics2D) g;
		
		graphics.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		
		if(getModel().isArmed()) {
			graphics.setColor(getBackground().darker());
		} else if (getModel().isRollover()) {
			graphics.setColor(getBackground().brighter());
		} else {
			graphics.setColor(getBackground());
		}
		
		
		graphics.fillRoundRect(0, 0, width, height, 10, 10); 
		FontMetrics fontMetrics = graphics.getFontMetrics(); 
		Rectangle stringBounds = fontMetrics.getStringBounds(this.getText(), graphics).getBounds(); 
		int textX = (width - stringBounds.width) / 3;
		int textY = (height - stringBounds.height) / 2 + fontMetrics.getAscent();
		graphics.setColor(new Color(255, 255, 255)); 
		graphics.setFont(new Font("고딕", Font.BOLD, 18));
		graphics.drawString(getText(), textX, textY); 
		graphics.dispose(); 
		setBackground(new Color(52, 152, 219));		
		setFocusPainted(false);
		setContentAreaFilled(false);
		setVerticalTextPosition(JButton.CENTER);
		setHorizontalTextPosition(JButton.CENTER);
		super.paintComponent(g);

				
	}
	
	
	
	


}
