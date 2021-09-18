package com.kh.client.view;

import java.awt.Color;
import java.awt.Dialog;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import java.io.IOException;
import java.net.Socket;

import javax.imageio.ImageIO;
import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSpinner;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.SpinnerModel;
import javax.swing.SpinnerNumberModel;
import javax.swing.border.TitledBorder;
import javax.swing.table.DefaultTableModel;

import com.kh.client.model.vo.ClientUser;
import com.kh.client.model.vo.Sender;
import com.kh.server.function.UserManager;
import com.kh.server.model.vo.MediaTest;

public class MainMenu extends JFrame implements MouseListener {

	UserManager um = new UserManager();

	JPanel north_p, center_p, south_p;

	JPanel listPan = new JPanel();
	JPanel bgPan = new JPanel();
	Font copyfont = new Font("怨좊뵓", Font.PLAIN, 10);

	JTextArea textOutput;
	JTextField textInput;
	RoundButton rbtn;

	JLabel lblroom;
	JLabel lblsang;
	JLabel lblpeople;

	public JTable table1;
	public DefaultTableModel model1;

	Socket socket;
	String userId;
	String userPw;
	String userCoin;
	String userItem2;
	String userItem1;

	boolean userMusicSet;
	boolean profile;
	boolean tempPwd;

	Thread sender;
	Thread receiver;
	MainMenu mm;
	ClientUser u;

	public MainMenu(Socket socket, ClientUser u, Thread sender, Thread receiver) {
		super("MainMenuPage");
		this.socket = socket;
		this.u = u;
		this.sender = sender;
		this.receiver = receiver;
	}

	public void doMain() {

		this.mm = this;
		this.setLayout(null);
		this.setSize(1024, 768);
		bgPan.setLayout(null);
		bgPan.setSize(1024, 768);
		bgPan.setBackground(new Color(195, 245, 230));
		try {
			this.setIconImage(ImageIO.read(new File("images//logo.PNG")));
		} catch (IOException e) {

			e.printStackTrace();
		}

		this.setSize(1024, 768);

		Image profileimg = new ImageIcon("images\\profile.PNG").getImage().getScaledInstance(85, 60, 0);
		Image optimg = new ImageIcon("images\\option.PNG").getImage().getScaledInstance(150, 50, 0);
		Image shopimg = new ImageIcon("images\\shop.PNG").getImage().getScaledInstance(85, 50, 0);
		Image exitimg = new ImageIcon("images\\exit.PNG").getImage().getScaledInstance(150, 50, 0);
		Image coinimg = new ImageIcon("images\\coin.png").getImage().getScaledInstance(60, 60, 0);
		Image questimg = new ImageIcon("images\\quest.PNG").getImage().getScaledInstance(85, 50, 0);
		Image chosungimg = new ImageIcon("images\\chosung.png").getImage().getScaledInstance(60, 60, 0);
		Image timerimg = new ImageIcon("images\\timer.png").getImage().getScaledInstance(60, 60, 0);
		Image logo = new ImageIcon("images\\login.png").getImage().getScaledInstance(200, 150, 0);
		Image makeimg = new ImageIcon("images\\make.PNG").getImage().getScaledInstance(85, 50, 0);
		Image joinimg = new ImageIcon("images\\join.png").getImage().getScaledInstance(85, 50, 0);

		JLabel namelbl = new JLabel(u.getUserId());
		namelbl.setBounds(185, 40, 60, 60);

		JLabel logolb = new JLabel(new ImageIcon(logo));
		logolb.setBounds(800, 0, 200, 150);
		this.add(logolb);

		JButton profilebtn = new JButton(new ImageIcon(profileimg));
		profilebtn.setLocation(80, 40);
		profilebtn.setSize(85, 60);
		profilebtn.setBorderPainted(false);
		profilebtn.setContentAreaFilled(false);

		JButton optbtn = new JButton(new ImageIcon(optimg));
		optbtn.setLocation(825, 600);
		optbtn.setSize(150, 50);
		optbtn.setBorderPainted(false);
		optbtn.setContentAreaFilled(false);

		JButton shopbtn = new JButton(new ImageIcon(shopimg));
		shopbtn.setLocation(715, 150);
		shopbtn.setSize(85, 50);
		shopbtn.setBorderPainted(false);
		shopbtn.setContentAreaFilled(false);

		rbtn = new RoundButton("E     X     I     T");
		rbtn.setLocation(825, 670);
		rbtn.setSize(150, 50);
		rbtn.setFocusPainted(false);
		rbtn.setContentAreaFilled(false);

		JButton make = new JButton(new ImageIcon(makeimg));
		make.setBounds(460, 150, 85, 50);
		make.setBorderPainted(false);
		make.setContentAreaFilled(false);

		JButton in = new JButton(new ImageIcon(joinimg));
		in.setBounds(545, 150, 85, 50);
		in.setBorderPainted(false);
		in.setContentAreaFilled(false);

		Dialog makeRoomDialog = new Dialog(this, "방만들기", true);
		makeRoomDialog.setLayout(null);
		makeRoomDialog.setBounds(600, 500, 600, 500);

		JLabel roomName = new JLabel("방제목");
		JLabel roomPwd = new JLabel("방암호");
		JLabel roomPeople = new JLabel("인원수");

		roomName.setBounds(125, 150, 75, 35);
		roomPwd.setBounds(125, 200, 75, 35);
		roomPeople.setBounds(125, 250, 75, 35);

		JTextField roomName2 = new JTextField();
		JTextField roomPwd2 = new JTextField();
		JTextArea roomPeople2 = new JTextArea();
		roomName2.setBounds(175, 150, 175, 25);
		roomPwd2.setEnabled(false);
		roomPwd2.setEditable(false);
		roomPwd2.setBounds(175, 200, 175, 25);
		roomPeople2.setBounds(175, 250, 175, 25);

		SpinnerModel numberModel = new SpinnerNumberModel(4, 4, 8, 1);
		JSpinner selectPeople = new JSpinner(numberModel);
		selectPeople.setBounds(175, 250, 175, 25);

		RoundButton btnOK = new RoundButton("확인");
		RoundButton btnCancel = new RoundButton("취소");
		btnOK.setBounds(250, 300, 100, 35);
		btnCancel.setBounds(375, 300, 100, 35);

		JCheckBox checkSecret = new JCheckBox();
		checkSecret.setBounds(360, 185, 50, 50);

		makeRoomDialog.add(roomPeople);
		makeRoomDialog.add(roomPwd);
		makeRoomDialog.add(roomName);
		makeRoomDialog.add(roomName2);
		makeRoomDialog.add(roomPwd2);
		makeRoomDialog.add(selectPeople);
		makeRoomDialog.add(btnOK);
		makeRoomDialog.add(btnCancel);
		makeRoomDialog.add(checkSecret);

		makeRoomDialog.setLocationRelativeTo(null);

		JTextArea roomState = new JTextArea();
		roomState.setBounds(450, 150, 350, 200);
		roomState.setEditable(false);

		JScrollPane scPanel2 = new JScrollPane(roomState);
		scPanel2.setBounds(450, 200, 350, 220);
		scPanel2.setBorder(new TitledBorder("방 정보"));

		DefaultListModel<String> model1 = new DefaultListModel<String>();
		JList roomList = new JList(model1);
		JScrollPane scPanel = new JScrollPane(roomList);
		scPanel.setBorder(new TitledBorder("방 목록"));
		scPanel.setBounds(80, 200, 350, 220);

		roomName2.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				String roomName = roomName2.getText();
				String roomPw = roomPwd2.getText();
				String people = selectPeople.getValue() + "";
				model1.addElement(roomName + " : " + people);
				((Sender) sender).sendCreateRoom(roomName, roomPw, people);
				makeRoomDialog.dispose();
				roomName2.setText("");

			}
		});
		roomList.addMouseListener(new MouseListener() {

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseClicked(MouseEvent e) {
				String roomName = roomName2.getText();
				if (roomList.getSelectedIndex() != -1) {
					if (roomName == null) {
						JOptionPane.showMessageDialog(null, "방이름을 입력하세요!");
					} else {
						((Sender) sender).sendEnterRoom(roomName);
					}

				}
			}
		});

		btnCancel.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				makeRoomDialog.dispose();

			}
		});
		btnOK.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				String roomName = roomName2.getText();
				String roomPw = roomPwd2.getText();
				String people = selectPeople.getValue() + "";
				model1.addElement(roomName + " : " + people);
				((Sender) sender).sendCreateRoom(roomName, roomPw, people);
				makeRoomDialog.dispose();
				roomName2.setText("");

			}
		});

		checkSecret.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if (checkSecret.isSelected()) {
					roomPwd2.setEditable(true);
					roomPwd2.setEnabled(true);

				} else {
					roomPwd2.setEditable(false);
					roomPwd2.setEnabled(false);
				}

			}
		});

		make.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				makeRoomDialog.setVisible(true);
			}
		});

		in.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				String roomName = JOptionPane.showInputDialog("방이름 입력");
				if (roomName == null) {
					JOptionPane.showMessageDialog(null, "방이름을 입력하세요!");
				} else {
					((Sender) sender).sendEnterRoom(roomName);
				}
			}
		});

		JButton questbtn = new JButton(new ImageIcon(questimg));
		questbtn.setLocation(630, 150);
		questbtn.setSize(85, 50);
		questbtn.setBorderPainted(false);
		questbtn.setContentAreaFilled(false);

		textOutput = new JTextArea();
		textOutput.setBounds(80, 520, 720, 640);
		textOutput.setEditable(false);

		textInput = new JTextField();
		textInput.setBounds(80, 670, 720, 28);
		// textInput.requestFocus();
		this.add(textInput);

		JButton textOkbtn = new JButton("전송");
		textOkbtn.setSize(60, 26);
		textOkbtn.setLocation(658, 0);
		textInput.add(textOkbtn);

		JScrollPane chatScroll = new JScrollPane(textOutput);
		chatScroll.setLocation(80, 490);
		chatScroll.setSize(720, 182);
		chatScroll.setBorder(new TitledBorder("채팅창"));
		this.add(chatScroll);

		// 전송 버튼
		textOkbtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				String msg = textInput.getText();
				if (!msg.isEmpty()) {
					((Sender) sender).sendMainRoomMsg(msg, u.getUserId());
					textOutput.append(u.getUserId() + " >> " + msg + "\n");
					textOutput.setCaretPosition(textOutput.getDocument().getLength());
					textInput.setText(null);
					textInput.requestFocus();
				}
			}
		});
		// 엔터
		textInput.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				String msg = textInput.getText();
				if (!msg.isEmpty()) {
					((Sender) sender).sendMainRoomMsg(msg, u.getUserId());
					textOutput.append(u.getUserId() + " >> " + msg + "\n");
					textOutput.setCaretPosition(textOutput.getDocument().getLength());
					textInput.setText(null);
					textInput.requestFocus();
				}
			}
		});

		profilebtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				Profile pf = new Profile(u);
				pf.setVisible(true);

			}
		});

		shopbtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				setVisible(false);
				Store st = new Store(u, getMainMenu());
			}

		});

		optbtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				Setting set = new Setting(u);

			}
		});
		make.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// MakeRoom mr = new MakeRoom(null);

			}
		});
		questbtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				QuestMenu qm = new QuestMenu(u);
				qm.setVisible(true);
			}
		});

		MediaTest.musicOff();

		MediaTest.musicOn(1, u.isMusicSet());

		rbtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				((Sender) sender).sendUserInfo(u);
				JOptionPane.showMessageDialog(null, "게임을 종료합니다.");
				System.exit(DISPOSE_ON_CLOSE);

			}
		});

		this.addWindowListener(new WindowAdapter() {

			@Override
			public void windowClosing(WindowEvent e) {
				((Sender) sender).sendUserInfo(u);
				JOptionPane.showMessageDialog(null, "게임을 종료합니다.");
				dispose();
			}
		});
		JLabel copyRight = new JLabel("CopyRighted by KH마인드");
		copyRight.setFont(copyfont);
		copyRight.setSize(200, 20);
		copyRight.setLocation(460, 710);
		this.add(copyRight);

		this.add(listPan);

		this.add(textInput);
		this.add(profilebtn);
		this.add(rbtn);
		this.add(shopbtn);
		this.add(optbtn);
		this.add(namelbl);
		this.add(questbtn);
		this.add(make);
		this.add(in);
		this.add(scPanel);
		this.add(scPanel2);

		this.add(bgPan);

		this.setResizable(false);
		this.setLocationRelativeTo(null);

		this.setVisible(true);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	@Override
	public void mouseClicked(MouseEvent e) {

	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	public void appendChat(String msg) {
		textOutput.append(msg + "\n");
		textOutput.setCaretPosition(textOutput.getDocument().getLength());
		textInput.requestFocus();
	}

	public MainMenu getMainMenu() {
		return mm;
	}
}
