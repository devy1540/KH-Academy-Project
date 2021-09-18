package com.kh.client.view;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class FindResult extends JFrame {

	public FindResult(String str) {

		JPanel idResultPop = new JPanel();

		idResultPop.setBackground(new Color(195, 245, 230));

		setTitle("KH치 마인드 - 아이디 찾기 결과");
		try {
			this.setIconImage(ImageIO.read(new File("images//logo.PNG")));
		} catch (IOException e) {

			e.printStackTrace();
		}
		setSize(1024, 768);
		idResultPop.setSize(1024, 768);
		this.setLayout(null);// 로케이션별로 위치와 사이즈 지정가능
		idResultPop.setLayout(null);

		JLabel idText = new JLabel("가입하신 아이디는 ");
		idText.setBounds(400, 200, 400, 200);

		JTextField idf = new JTextField();
		idf.setBounds(350, 350, 300, 30);
		idf.setText(str);

		JLabel idText2 = new JLabel("입니다.");
		idText2.setBounds(650, 350, 300, 30);

		/*
		 * RoundButton checkBtn = new RoundButton("로그인"); checkBtn.setBounds(350, 420,
		 * 80, 50);
		 */

		RoundButton exitBtn = new RoundButton("나가기");
		exitBtn.setBounds(580, 420, 80, 50);

		idResultPop.add(idText);
		idResultPop.add(idf);
		// idResultPop.add(checkBtn);
		idResultPop.add(exitBtn);
		idResultPop.add(idText2);

		add(idResultPop);

		setLocationRelativeTo(null);
		setResizable(false);
		setVisible(true);

		/*
		 * checkBtn.addActionListener(new ActionListener() {
		 * 
		 * @Override public void actionPerformed(ActionEvent e) { // LoginPage lp = new
		 * LoginPage();
		 * 
		 * } });
		 */

		exitBtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				dispose();

			}
		});

	}

}