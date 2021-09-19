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
import javax.swing.JPanel;
import javax.swing.JTextField;

import com.kh.client.model.vo.Sender;

public class FindPassword extends JFrame {
	Thread sender;
	Thread receiver;

	public FindPassword(Thread sender, Thread receiver) {
		this.sender = sender;
		this.receiver = receiver;

		JPanel pwPopup = new JPanel();
		pwPopup.setBackground(new Color(195, 245, 230));

		setTitle("KH치 마인드 - 비밀번호 찾기");
		try {
			this.setIconImage(ImageIO.read(new File("images//logo.PNG")));
		} catch (IOException e) {

			e.printStackTrace();
		}
		setSize(1024, 768);
		pwPopup.setSize(1024, 768);
		this.setLayout(null);// 로케이션별로 위치와 사이즈 지정가능
		pwPopup.setLayout(null);

		// 로고
		JLabel pwLogoLabel = new JLabel("비밀번호 찾기");
		pwLogoLabel.setFont(new Font("굴림", Font.BOLD, 40));
		pwLogoLabel.setBounds(380, 150, 300, 50);

		// 내용
		JLabel idText = new JLabel("회원 가입시 입력된 아이디와 이메일 주소를 입력하여 주세요.");
		idText.setBounds(330, 200, 400, 200);

		// 가입아이디
		JLabel idLabel = new JLabel("아이디  : ");
		idLabel.setBounds(320, 338, 100, 50);

		// 가입 아이디 텍스트
		JTextField idf = new JTextField();
		idf.setBounds(380, 350, 300, 30);

		// 가입이메일
		JLabel emailLabel = new JLabel("이메일  : ");
		emailLabel.setBounds(320, 390, 100, 50);

		// 가입 이메일 텍스트
		JTextField emailf = new JTextField();
		emailf.setBounds(380, 400, 300, 30);

		// 이메일로 전송함
		RoundButton checkBtn = new RoundButton("전송");
		checkBtn.setBounds(380, 480, 300, 40);

		// 로그인 화면으로 나가기
		RoundButton exitBtn = new RoundButton("나가기");
		exitBtn.setBounds(580, 550, 80, 50);

		pwPopup.add(pwLogoLabel);
		pwPopup.add(idText);
		pwPopup.add(idLabel);
		pwPopup.add(idf);
		pwPopup.add(emailLabel);
		pwPopup.add(emailf);
		pwPopup.add(checkBtn);
		pwPopup.add(exitBtn);

		add(pwPopup);

		// 이메일로 전송
		checkBtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// JOptionPane.showConfirmDialog(null, "이메일 전송 준비중 ㅠㅠ");
				((Sender) sender).sendEmail(idf.getText(), emailf.getText());
				/*
				 * JOptionPane.showMessageDialog(null, "입력하신 이메일로 전송을 완료하였습니다."); dispose();
				 */
			}
		});

		// 나가기 : 로그인 화면으로
		exitBtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				dispose();
			}
		});

		setLocationRelativeTo(null);
		setResizable(false);
		setVisible(true);

	}
}