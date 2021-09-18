package com.kh.client.view;

import java.awt.Color;
import java.awt.Dialog;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

import com.kh.client.model.vo.ClientUser;
import com.kh.server.function.UserManager;

public class QuestMenu extends JFrame {

	

	public QuestMenu(ClientUser user) {
		ImageIcon background;
		ImageIcon bgi;
		Font font = new Font("고딕", Font.BOLD, 11);
		String[] questList = new String[4];
		questList[0] = "\t코인100개소유"; // 1번 아이템 10개
		questList[1] = "\t주먹밥쿵야 10개 모으기"; // 2번 아이템 10개
		questList[2] = "\t처음으로 우승해보기"; // 3 그냥

		this.setBounds(420, 100, 600, 600);

		try {
			this.setIconImage(ImageIO.read(new File("images//logo.PNG")));
		} catch (IOException e) {

			e.printStackTrace();
		}
		
		JPanel Panel = new JPanel();
		
		Panel.setBackground(new Color(195,245,230));	
		Panel.setLocation(30, 30);
		Panel.setSize(600, 600);

		/////////////////////////////////////////////////////

		JTextField questList1 = new JTextField(questList[0], 15);
		questList1.setEditable(false);
		questList1.setLocation(50, 70);
		questList1.setSize(300, 60);
		questList1.setFont(font);
		
		questList1.setBackground(Color.white);
		if (user.isQuestClear1() == true) {
			questList1.setText("\t    퀘스트 완료 !! ");
		}

		JTextField questList2 = new JTextField(questList[1], 15);
		questList2.setEditable(false);
		questList2.setLocation(50, 190);
		questList2.setSize(300, 60);
		questList2.setFont(font);
		questList2.setBackground(Color.white);
		if (user.isQuestClear2() == true) {
			questList2.setText("\t    퀘스트 완료 !! ");
		}

		JTextField questList3 = new JTextField(questList[2], 15);
		questList3.setEditable(false);
		questList3.setLocation(50, 310);
		questList3.setSize(300, 60);
		questList3.setFont(font);
		questList3.setBackground(Color.white);
		if (user.isQuestClear3() == true) {
			questList3.setText("\t    퀘스트 완료 !! ");
		}

		JLabel title = new JLabel("퀘스트 목록");
		title.setSize(150, 60);
		title.setLocation(250, 0);
		
		JLabel getItem = new JLabel("");
		getItem.setSize(150,60);
		getItem.setLocation(150,200);

		RoundButton button = new RoundButton("확인");
		button.setSize(80, 30);
		button.setLocation(470, 480);

		String change[] = new String[3];
		change[0] = "수락";
		change[1] = "진행중";
		change[2] = "완료";

		//////////////////////////////////////////////////////////////////////
		RoundButton sdButton = new RoundButton("아이템 받기 !");
		sdButton.setSize(120, 40);
		sdButton.setLocation(150, 300);

		JLabel sdlabel1 = new JLabel(
				new ImageIcon(new ImageIcon("images/yangpa.PNG").getImage().getScaledInstance(150, 150, 0)));

		sdlabel1.setLocation(130, 60);
		sdlabel1.setSize(150, 150);

		bgi = new ImageIcon("images/background.PNG");
		JPanel sdPanel = new JPanel() {
			public void paintComponent(Graphics g) {

				g.drawImage(bgi.getImage(), 0, 0, 400, 400, null);
				setOpaque(false);
				super.paintComponent(g);

			}
		};
		sdPanel.setSize(400,400);
		sdPanel.setLocation(0,0);
		sdPanel.setLayout(null);
		
		Dialog sd = new Dialog(this, "^^");
		sd.setSize(400, 400);
		sd.setLocation(512, 250);
		sd.setLayout(null);
		sdPanel.add(sdButton);
		sdPanel.add(sdlabel1);
		sdPanel.add(getItem);
		sd.add(sdPanel);

		RoundButton clearButton1 = new RoundButton("수락");
		clearButton1.setSize(80, 30);
		clearButton1.setLocation(470, 80);

		if (user.isAcceptQuest1() == true && user.isQuestClear1() == false) {
			clearButton1.setText("진행중");
			clearButton1.setEnabled(false);
		}

		if (user.getCoin() >= 100 && user.isAcceptQuest1() == true) {
			clearButton1.setEnabled(true);
			clearButton1.setText("완료");
		}
		if (user.isQuestClear1() == true) {
			clearButton1.setEnabled(false);
			clearButton1.setText("완료");
		}

		RoundButton clearButton2 = new RoundButton("수락");
		clearButton2.setSize(80, 30);
		clearButton2.setLocation(470, 200);

		if (user.isAcceptQuest2() == true && user.isQuestClear2() == false) {
			clearButton2.setText("진행중");
			clearButton2.setEnabled(false);

		}

		if (user.getOwnItem1() >= 10 && user.isAcceptQuest2() == true) {
			clearButton2.setText("완료");
			clearButton2.setEnabled(true);
		}
		if (user.isQuestClear2() == true) {
			clearButton2.setEnabled(false);
			clearButton2.setText("완료");
		}

		RoundButton clearButton3 = new RoundButton("수락");
		clearButton3.setSize(80, 30);
		clearButton3.setLocation(470, 325);

		if (user.isAcceptQuest3() == true && user.isQuestClear3() == false) {
			clearButton3.setText("진행중");
			clearButton3.setEnabled(false);
		}

		if (user.getVictory() >= 1 && user.isAcceptQuest3() == true) {
			clearButton3.setText("완료");
			clearButton3.setEnabled(true);
		}

		if (user.isQuestClear3() == true) {
			clearButton3.setEnabled(false);
			clearButton3.setText("완료");
		}

		////////////////////////////////////////////
		clearButton1.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				user.setAcceptQuest1(true);

				if (user.isAcceptQuest1() == true && user.isQuestClear1() == false) {
					clearButton1.setText("진행중");
					clearButton1.setEnabled(false);
				}

				if (user.getCoin() >= 100) {
					clearButton1.setText("완료");
					user.setQuestClear1(true);
					clearButton1.setEnabled(false);
					sdlabel1.setIcon(
							new ImageIcon(new ImageIcon("images/timer.PNG").getImage().getScaledInstance(150, 150, 0)));
					user.setOwnItem1(user.getOwnItem1() + 10);
					getItem.setText("타이머 10개 획득 !");
					sd.setVisible(true);

				}

			}

		});

		clearButton2.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				user.setAcceptQuest2(true);
				if (user.isAcceptQuest2() == true && user.isQuestClear2() == false) {
					clearButton2.setText("진행중");
					clearButton2.setEnabled(false);
				}

				if (user.getOwnItem1() >= 10) {
					clearButton2.setText("완료");
					user.setQuestClear2(true);
					clearButton2.setEnabled(false);
					sdlabel1.setIcon(new ImageIcon(
							new ImageIcon("images/chosung.PNG").getImage().getScaledInstance(150, 150, 0)));
					user.setOwnItem2(user.getOwnItem2() + 10);
					getItem.setText("초성 아이템 10개 획득 !");
					sd.setVisible(true);
				}

			}

		});

		clearButton3.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				user.setAcceptQuest3(true);
				if (user.isAcceptQuest3() == true && user.isQuestClear3() == false) {
					clearButton3.setText("진행중");
					clearButton3.setEnabled(false);
				}

				if (user.getVictory() >= 1) {
					clearButton3.setText("완료");
					user.setQuestClear3(true);
					clearButton3.setEnabled(false);
					sdlabel1.setIcon(
							new ImageIcon(new ImageIcon("images/jumuk.PNG").getImage().getScaledInstance(150, 150, 0)));
					getItem.setText("ㅁㄴㅇㅁㄴㅇㅁㄴㅇ");
					sd.setVisible(true);
				}

			}

		});

		sdButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				if (user.isQuestClear1() == true) {
					questList1.setText("\t    퀘스트 완료");
					clearButton1.setEnabled(false);
					user.setQuestClear1(true);
				}
				if (user.isQuestClear2() == true) {
					// 보상2
					questList2.setText("\t    퀘스트 완료");
					clearButton2.setEnabled(false);
					user.setQuestClear2(true);
				}
				if (user.isQuestClear3() == true) {
					// 보상3
					questList3.setText("\t    퀘스트 완료");
					clearButton3.setEnabled(false);
					user.setQuestClear3(true);
				}
				sd.setVisible(false);
			}
		});

		button.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				dispose();

			}
		});
		//////////////////////////////////////////////////////

		///

		this.add(Panel);

		Panel.add(button);
		Panel.add(clearButton1);
		Panel.add(clearButton2);
		Panel.add(clearButton3);
		/*
		 * Panel.add(acceptButton1); Panel.add(acceptButton2); Panel.add(acceptButton3);
		 */

		Panel.add(title);
		Panel.add(questList1);
		Panel.add(questList2);
		Panel.add(questList3);
		Panel.setLayout(null);

		this.add(Panel);

	}

}
