package com.kh.client.view;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JRadioButton;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import com.kh.client.model.vo.Sender;
import com.kh.server.function.UserManager;

public class JoinPage extends JFrame {

	private JTextArea textArea;
	private JRadioButton rbAgree;
	private JRadioButton rbdisAgree;
	JPanel bgPan = new JPanel();
	UserManager um = new UserManager();
	String str = "";
	Thread sender;
	Thread receiver;
	int cnt = 0;
	boolean check = false;

	public JoinPage(Thread sender, Thread receiver) {
		this.sender = sender;
		this.receiver = receiver;

		setTitle("KH치 마인드 - 회원가입");
		try {
			this.setIconImage(ImageIO.read(new File("images/logo.PNG")));
		} catch (IOException e) {

			e.printStackTrace();
		}
		this.setBounds(250, 250, 800, 768);
		this.setLayout(null);
		bgPan.setLayout(null);
		bgPan.setSize(1024, 768);
		bgPan.setBackground(new Color(195, 245, 230));

		// 회원가입 로고
		JLabel nameCard = new JLabel("회원가입");
		nameCard.setFont(new Font("굴림", Font.BOLD, 22));
		nameCard.setBounds(330, 150, 292, 64);
		add(nameCard);

		// 아이디
		JLabel ldLabel = new JLabel("아이디 : ");
		ldLabel.setBounds(177, 248, 57, 15);
		add(ldLabel);

		JTextField idtextField = new JTextField();
		idtextField.setBounds(249, 241, 263, 30);
		add(idtextField);
		idtextField.setColumns(10);

		// 아이디 중복확인
		RoundButton btnNewButton = new RoundButton("중복확인");
		btnNewButton.setBounds(525, 240, 97, 31);
		add(btnNewButton);

		btnNewButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				((Sender) sender).sendCheckId(idtextField.getText());
			}
		});

		// 비밀번호
		JLabel pwLabel = new JLabel("비밀번호 : ");
		pwLabel.setBounds(162, 301, 72, 15);
		add(pwLabel);

		JPasswordField pwTextField = new JPasswordField();
		pwTextField.setColumns(10);
		pwTextField.setBounds(249, 294, 263, 30);
		add(pwTextField);

		// 비밀번호 재확인
		JLabel pwLabel2 = new JLabel("비밀번호 재확인 : ");
		pwLabel2.setBounds(119, 353, 200, 15);
		add(pwLabel2);

		JPasswordField pwTextField2 = new JPasswordField();
		pwTextField2.setColumns(10);
		pwTextField2.setBounds(249, 346, 263, 30);
		add(pwTextField2);

		// 비밀번호 일치여부
		JLabel pwCheck = new JLabel();
		pwCheck.setBounds(250, 380, 200, 15);
		pwTextField2.addKeyListener(new KeyListener() {

			@Override
			public void keyTyped(KeyEvent e) {

			}

			@Override
			public void keyReleased(KeyEvent e) {

				// 비밀번호 스트링변환
				char[] tempPassword = pwTextField.getPassword();
				String pwd = "";

				for (int i = 0; i < tempPassword.length; i++) {
					pwd += tempPassword[i];

				}

				// 비밀번호 확인 스트링변환
				char[] tempPassword2 = pwTextField2.getPassword();
				String pwd2 = "";

				for (int j = 0; j < tempPassword2.length; j++) {
					pwd2 += tempPassword2[j];

				}

				if (pwd.equals(pwd2)) {
					pwCheck.setText("비밀번호가 일치합니다.");
				} else {
					pwCheck.setText("비밀번호가 일치하지 않습니다.");
				}
			}

			@Override
			public void keyPressed(KeyEvent e) {
			}
		});

		add(pwCheck);

		// 이름
		JLabel nameLabel = new JLabel("닉네임(한글x) : ");
		nameLabel.setBounds(132, 411, 90, 15);
		add(nameLabel);

		JTextField nameTextField = new JTextField();
		nameTextField.setColumns(10);
		nameTextField.setBounds(249, 404, 263, 30);
		add(nameTextField);

		// 이메일
		JLabel emailLabel = new JLabel("이메일 : ");
		emailLabel.setBounds(177, 467, 57, 15);
		add(emailLabel);

		JTextField emailTextField = new JTextField();
		emailTextField.setColumns(10);
		emailTextField.setBounds(249, 460, 190, 30);
		add(emailTextField);

		JLabel atLabel = new JLabel("@");
		atLabel.setBounds(442, 465, 15, 15);
		add(atLabel);

		JTextField domainTextField = new JTextField();
		domainTextField.setColumns(10);
		domainTextField.setBounds(460, 460, 160, 30);
		add(domainTextField);

		String[] domain = { "직접 입력", "naver.com", "gmail.com" };
		JComboBox<String> emailList = new JComboBox<>(domain);
		emailList.setSelectedIndex(0);

		emailList.setBounds(620, 460, 150, 30);
		add(emailList);

		emailList.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				JComboBox<String> temp = (JComboBox<String>) e.getSource();
				if (((String) temp.getSelectedItem()).equals("직접 입력")) {
					domainTextField.setText(null);
				} else {
					domainTextField.setText((String) temp.getSelectedItem());
				}
			}
		});

		// 가입완료 버튼_가입 완료 팝업창 후 로그인화면
		RoundButton CompleteBtn = new RoundButton("가입완료");
		CompleteBtn.setBounds(254, 527, 118, 42);
		add(CompleteBtn);
		dispose();

		// 나가기 _ 로그인화면
		RoundButton exitBtn = new RoundButton("나가기");
		exitBtn.setBounds(394, 527, 118, 42);
		add(exitBtn);
		dispose();

		CompleteBtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				int idFlag = 0;
				if (check) {
					char[] tmpStr1 = idtextField.getText().toCharArray();
					for (int i = 0; i < idtextField.getText().length(); i++) {
						if ((tmpStr1[i] >= 48 && tmpStr1[i] <= 57) || (tmpStr1[i] >= 65 && tmpStr1[i] <= 90)
								|| (tmpStr1[i] >= 97 && tmpStr1[i] <= 122)) {
							continue;
						} else {
							idFlag = 1;
							break;
						}
					}
					if (idFlag == 0) {
						String signUpId = idtextField.getText();
						str += signUpId + ":";

						char[] tempPassword = pwTextField.getPassword();
						String pwd = "";
						for (int i = 0; i < tempPassword.length; i++) {
							pwd += tempPassword[i];
						}
						str += pwd + ":";
						int flag = 0;
						char[] tmpStr = nameTextField.getText().toCharArray();
						for (int i = 0; i < nameTextField.getText().length(); i++) {
							if ((tmpStr[i] >= 48 && tmpStr[i] <= 57) || (tmpStr[i] >= 65 && tmpStr[i] <= 90)
									|| (tmpStr[i] >= 97 && tmpStr[i] <= 122)) {
								continue;
							} else {
								flag = 1;
								break;
							}
						}
						if (flag == 0) {
							str += nameTextField.getText() + ":";
							str += emailTextField.getText() + "@" + domainTextField.getText();
							System.out.println("회원가입 정보 : " + str);
							send(str);
							str = "";
							dispose();
						} else if (flag == 1) {
							JOptionPane.showMessageDialog(null, "한글입력은 안됩니다.");
						}
					} else if (idFlag == 1) {
						JOptionPane.showMessageDialog(null, "한글입력은 안됩니다.");
					}
				} else {
					JOptionPane.showMessageDialog(null, "아이디 중복확인 하세요");
				}
			}
		});

		exitBtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				dispose();

			}
		});
		this.add(bgPan);
		this.setResizable(false);
		this.setVisible(true);
		this.setLocationRelativeTo(null);// 정중앙
	}

	public void send(String str) {
		((Sender) sender).sendSignUp(str);
	}

	public void setCheck(boolean check) {
		this.check = check;
	}
}