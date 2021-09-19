package com.kh.client.view;

import java.awt.Color;
import java.awt.Dialog;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPasswordField;

import com.kh.client.model.vo.ClientUser;

public class PasswordChange extends JFrame {
	public PasswordChange(ClientUser u) {
		JPasswordField newpw = new JPasswordField();
		newpw.setSize(120, 30);
		newpw.setLocation(130, 100);
		JPasswordField newpw2 = new JPasswordField();
		newpw2.setSize(120, 30);
		newpw2.setLocation(130, 150);

		RoundButton pwdOk = new RoundButton("변경");
		pwdOk.setSize(80, 30);
		pwdOk.setLocation(210, 300);
		if (newpw == newpw2) {
			pwdOk.setEnabled(true);
		} else {
			pwdOk.setEnabled(false);
		}

		RoundButton pwdOut = new RoundButton("나가기");
		pwdOut.setSize(80, 30);
		pwdOut.setLocation(300, 300);

		JLabel pwCheck = new JLabel();
		pwCheck.setBounds(270, 155, 200, 15);

		JLabel sdpwLabel = new JLabel("비밀번호 재입력 :");
		sdpwLabel.setSize(100, 30);
		sdpwLabel.setLocation(30, 150);

		JLabel sdpwLabel2 = new JLabel("비밀번호 입력 :");
		sdpwLabel2.setSize(100, 30);
		sdpwLabel2.setLocation(30, 100);

		Dialog tempPwd = new Dialog(this, "비밀번호 변경");
		tempPwd.setBounds(512, 300, 400, 400);
		tempPwd.setLayout(null);
		tempPwd.add(newpw);
		tempPwd.add(newpw2);
		tempPwd.add(pwdOk);
		tempPwd.add(pwCheck);
		tempPwd.add(sdpwLabel);
		tempPwd.add(sdpwLabel2);
		tempPwd.add(pwdOut);
		tempPwd.setBackground(new Color(195, 245, 230));
		tempPwd.setVisible(true);
		try {
			this.setIconImage(ImageIO.read(new File("images//logo.PNG")));
		} catch (IOException e) {

			e.printStackTrace();
		}
		pwdOut.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				tempPwd.setVisible(false);

			}
		});

		////////// 확인 눌렀을때/////////
		pwdOk.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				char[] tempPassword = newpw.getPassword();
				String pwd = "";

				for (int i = 0; i < tempPassword.length; i++) {
					pwd += tempPassword[i];
				}
				u.setUserPwd(pwd);
				u.setTempPwd(false);
				System.out.println(u.getUserPwd() + "" + pwd);
				tempPwd.setVisible(false);
			}
		});

		newpw2.addKeyListener(new KeyListener() {
			@Override
			public void keyTyped(KeyEvent e) {
			}

			@Override
			public void keyReleased(KeyEvent e) {
				// 비밀번호 스트링변환
				char[] tempPassword = newpw.getPassword();
				String pwd = "";
				for (int i = 0; i < tempPassword.length; i++) {
					pwd += tempPassword[i];
				}
				// 비밀번호 확인 스트링변환
				char[] tempPassword2 = newpw2.getPassword();
				String pwd2 = "";
				for (int j = 0; j < tempPassword2.length; j++) {
					pwd2 += tempPassword2[j];
				}
				if (pwd.equals(pwd2)) {
					pwCheck.setText("비밀번호가 일치.");
					pwdOk.setEnabled(true);
				} else {
					pwCheck.setText("비밀번호 불일치.");
					pwdOk.setEnabled(false);
				}
			}

			@Override
			public void keyPressed(KeyEvent e) {
			}
		});

	}

}
