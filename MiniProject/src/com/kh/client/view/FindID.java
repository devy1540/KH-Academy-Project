package com.kh.client.view;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

import com.kh.client.model.vo.Sender;
import com.kh.server.function.UserManager;

public class FindID extends JFrame{
	Thread sender;
	Thread receiver;
	
	public FindID(Thread sender, Thread receiver) {
		this.sender = sender;
		this.receiver = receiver;
		
		JPanel idPopup = new JPanel();
		idPopup.setBackground(new Color(195, 245, 230));
		
		
		setTitle("KH치 마인드 - 아이디 찾기");
		try {
			this.setIconImage(ImageIO.read(new File("images//logo.PNG")));
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		setSize(1024,768);
		idPopup.setSize(1024,768);
		this.setLayout(null);// 로케이션별로 위치와 사이즈 지정가능
		idPopup.setLayout(null);
		
		
		JLabel forntLabel = new JLabel("아이디 찾기");
		forntLabel.setFont(new Font("굴림", Font.BOLD, 40));
		forntLabel.setBounds(380,150, 300, 50);
		
		
		JLabel idText = new JLabel("회원 가입시 입력한 이메일 주소를 입력하세요. ");
		idText.setBounds(400, 200, 400, 200);
		
		
	
		
		JLabel idText2 = new JLabel("이메일  : ");
		idText2.setBounds(320,338, 100, 50);
		
		JTextField idf = new JTextField();
		idf.setBounds(380, 350, 300	, 30);
		
		RoundButton checkBtn = new RoundButton("확인");
		checkBtn.setBounds(500,420, 70	, 50);

		RoundButton exitBtn = new RoundButton("나가기");
		exitBtn.setBounds(580,420, 80	, 50);

		
		idPopup.add(forntLabel);
		idPopup.add(idText);
		idPopup.add(idText2);
		idPopup.add(idf);
		idPopup.add(checkBtn);
		idPopup.add(exitBtn);
	
		add(idPopup);

		setLocationRelativeTo(null);
		setResizable(false);
		setVisible(true);
		
		
		checkBtn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				String str = idf.getText();
				if(str != null) {
					((Sender) sender).sendFindId(str);
					dispose();
				} else {
					JOptionPane.showMessageDialog(null, "이메일을 다시 확인하세요");
				}
				
			}
		});
		
		exitBtn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				dispose();
				
			}
		});
		
	}
	
	

}