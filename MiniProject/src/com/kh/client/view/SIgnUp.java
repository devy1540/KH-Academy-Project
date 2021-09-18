package com.kh.client.view;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

public class SIgnUp extends JPanel {
	JPanel bgPan = new JPanel();

	public SIgnUp() {
		setLayout(null);

		bgPan.setLayout(null);
		bgPan.setSize(1024, 768);
		bgPan.setBackground(new Color(195, 245, 230));

		RoundButton btnNewButton = new RoundButton("확인");
		btnNewButton.setVerticalAlignment(SwingConstants.BOTTOM);
		btnNewButton.setLayout(null);
		btnNewButton.setBounds(175, 188, 70, 25);
		btnNewButton.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
			}
		});
		add(btnNewButton);

		JLabel label = new JLabel("회원가입을 축하드립니다~!!");
		label.setFont(new Font("굴림", Font.PLAIN, 18));
		label.setBounds(101, 125, 255, 40);
		add(label);
		this.add(bgPan);

	}
}