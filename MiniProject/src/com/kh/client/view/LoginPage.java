package com.kh.client.view;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.net.Socket;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import com.kh.client.model.dao.Receiver;
import com.kh.client.model.vo.ClientUser;
import com.kh.client.model.vo.Sender;
import com.kh.server.model.vo.MediaTest;

public class LoginPage extends JFrame {
	ImageIcon icon;
	String str = "";
	String userId;
	JPanel bgPan = new JPanel();

	Socket socket;
	Thread sender;
	Thread receiver;
	ClientUser u;
	MainMenu mm;
	JoinPage jp;
	FindPassword fp;

	public LoginPage(Socket socket) {
		this.socket = socket;
		sender = new Sender(socket);
		receiver = new Receiver(socket, sender, this);

		sender.start();
		receiver.start();

		this.setSize(1024, 768);
		setTitle("KH치 마인드");
		try {
			this.setIconImage(ImageIO.read(new File("images//logo.PNG")));
		} catch (IOException e) {

			e.printStackTrace();
		}

		setLayout(null);

		bgPan.setLayout(null);
		bgPan.setSize(1024, 768);
		bgPan.setBackground(new Color(195, 245, 230));
		// 배경 이미지 삽입
		icon = new ImageIcon("images//login.png");
		JPanel panel = new JPanel() {
			public void paintComponent(Graphics g) {
				g.drawImage(icon.getImage(), 0, 0, null);
				setOpaque(false);
				super.paintComponent(g);
			}
		};

		panel.setBounds(0, 0, 1024, 768);
		panel.setLayout(null);

		// 아이디
		JLabel idLabel = new JLabel("아이디 : ");
		idLabel.setBounds(290, 460, 300, 100);
		JTextField idText = new JTextField();
		idText.setBounds(360, 495, 305, 30);
		panel.add(idLabel);
		panel.add(idText);

		// 패스워드
		JLabel pwLabel = new JLabel("비밀 번호 : ");
		pwLabel.setBounds(274, 503, 300, 100);
		JPasswordField pwField = new JPasswordField();
		pwField.setBounds(360, 540, 305, 30);
		panel.add(pwLabel);
		panel.add(pwField);

		// 로그인 버튼
		RoundButton loginbtn = new RoundButton("로그인");
		loginbtn.setBounds(680, 495, 120, 75);
		panel.add(idText);
		panel.add(loginbtn);

		// 회원가입 버튼
		RoundButton joinbtn = new RoundButton("회원가입");
		joinbtn.setBounds(360, 600, 90, 30);
		panel.add(joinbtn);

		// 아이디 찾기 버튼
		RoundButton idbtn = new RoundButton("ID 찾기 ");
		idbtn.setBounds(466, 600, 90, 30);
		panel.add(idbtn);

		// 비밀번호 찾기 버튼
		RoundButton pwbtn = new RoundButton("P/W 찾기 ");
		pwbtn.setBounds(572, 600, 90, 30);
		panel.add(pwbtn);

		// 로그인 버튼
		loginbtn.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				str += idText.getText() + ":";
				char[] tempPassword = pwField.getPassword();
				String pwd = "";
				for (int i = 0; i < tempPassword.length; i++) {
					pwd += tempPassword[i];
				}
				str += pwd;
				if (idText.getText().isEmpty() || pwd.isEmpty() || str.isEmpty()) {
					JOptionPane.showMessageDialog(null, "아이디 또는 비밀번호를 확인하세요!");
					str = "";
				} else {
					((Sender) sender).sendLogin(str, idText.getText());
					str = "";
				}
			}
		});

		// 회원가입 연동
		joinbtn.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				jp = new JoinPage(sender, receiver);
			}
		});

		// 아이디 찾기 버튼
		idbtn.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				FindID fi = new FindID(sender, receiver);
			}
		});

		// 비밀번호 찾기 버튼
		pwbtn.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				fp = new FindPassword(sender, receiver);
			}
		});

		this.add(panel);
		this.setResizable(false);
		this.setVisible(true);
		this.setLocationRelativeTo(null);

		MediaTest.musicOn(2, true);

		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}

	public void resultSignUp(boolean result) {
		if (result) {
			JOptionPane.showMessageDialog(null, "회원가입 성공");
		} else {
			JOptionPane.showMessageDialog(null, "회원가입 실패");
		}
	}

	public void resultCheckId(boolean result) {
		if (result) {
			JOptionPane.showMessageDialog(null, "사용할 수 있는 아이디입니다.");
			jp.setCheck(true);
		} else {
			JOptionPane.showMessageDialog(null, "사용할 수 없는 아이디입니다.");
			jp.setCheck(false);
		}
	}

	public void resultLogin(boolean result, ClientUser u, Thread sender, Thread receiver) {

		if (result) {
			System.out.println("로그인성공");
			mm = new MainMenu(socket, u, sender, receiver);
			if (u.isTempPwd()) {
				PasswordChange pc = new PasswordChange(u);
				mm.doMain();
			} else {
				mm.doMain();
			}
			this.dispose();
		} else {
			JOptionPane.showMessageDialog(null, "아이디 또는 비밀번호가 맞지않습니다!");
		}
	}

	public MainMenu getMainMenu() {
		return mm;
	}

	public void resultEmail(boolean result) {
		if (result) {
			JOptionPane.showMessageDialog(null, "이메일을 발송했습니다.");
			fp.dispose();
		} else {
			JOptionPane.showMessageDialog(null, "이메일을 발송하지 못했습니다.");
		}
	}
}