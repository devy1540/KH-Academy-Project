package com.kh.client.view;

import java.awt.AWTException;
import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Dialog;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Timer;
import java.util.Vector;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JColorChooser;
import javax.swing.JDialog;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSlider;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.colorchooser.ColorSelectionModel;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.filechooser.FileNameExtensionFilter;

import com.kh.client.model.vo.Sender;
import com.kh.server.model.vo.TempPoint;

public class GameRoom extends JFrame implements Runnable {

	JLabel userImg = null;
	JLabel name = null;
	JLabel userName = null;
	JLabel ctn = null;
	JLabel userCtn = null;
	JTextArea chatOutput;
	JTextField chatInput;
	String roomName;
	String userId;
	Thread receiver;
	Thread sender;
	Thread gameTimer;
	JFrame mainFrame;

	JPanel canvasPanel;
	JPanel colorPanel;
	JDialog colorDialog;
	JColorChooser chooser; // 색상
	Color color = Color.BLACK; // 색상
	JSlider penSize;
	JButton remover;
	JButton colorButton;
	Graphics g; // 그림판
	Graphics2D g2;
	ColorSelectionModel model;
	Vector<Vector> list = new Vector<Vector>();
	Vector<TempPoint> tmp = new Vector<TempPoint>();
	MainMenu mm;
	JLabel timer;
	boolean stop;
	boolean usingTimeStop = false;

	int sX, sY, eX, eY;
	float stroke = 1;
	boolean isDraw = false;

	Font copyfont = new Font("고딕", Font.PLAIN, 10);
	Font timerFont = new Font("고딕", Font.BOLD, 18);
	Robot robot;
	JPanel bgPan = new JPanel();
	Timer timerT = null;
	int time = 10;
	int count;

	public GameRoom(Thread sender, Thread receiver, String userId, String roomName) {
		this.userId = userId;
		this.roomName = roomName;
		this.sender = sender;
		this.receiver = receiver;
		this.stop = false;
	}

	public void doGame(MainMenu mm) {
		this.mm = mm;
		mm.dispose();

		this.setTitle(roomName);
		this.setLayout(null);
		this.setSize(1030, 768);
		this.setResizable(false);

		// 자리잡기용
		// 가운데 화면
		JPanel roomCenter = new JPanel();
		roomCenter.setLayout(null);
		roomCenter.setLocation(262, 0);
		roomCenter.setSize(500, 768);
		this.add(roomCenter);

		// 그림판
		canvasPanel = new JPanel();
		canvasPanel.setLayout(null);
		canvasPanel.setSize(480, 480);
		canvasPanel.setLocation(10, 35);
		canvasPanel.setBackground(Color.LIGHT_GRAY);

		chooser = new JColorChooser();
		colorDialog = new JDialog(this, "색상표");
		colorDialog.setBounds(0, 0, 800, 400);
		colorDialog.setLayout(null);

		colorPanel = new JPanel();
		colorPanel.setBounds(0, 0, 800, 400);
		colorPanel.setLayout(null);
		colorPanel.setVisible(true);

		colorDialog.add(colorPanel);
		chooser.setBounds(0, 0, 600, 300);
		colorPanel.add(chooser);

		penSize = new JSlider(1, 30, 1);
		penSize.setBounds(610, 10, 150, 100);
		penSize.setMajorTickSpacing(5);
		penSize.setMinorTickSpacing(1);
		penSize.setPaintTicks(true);
		penSize.setVisible(true);
		colorPanel.add(penSize);

		remover = new JButton("지우개");
		remover.setBounds(650, 200, 100, 50);
		remover.setVisible(true);
		colorPanel.add(remover);

		remover.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				color = canvasPanel.getBackground();
			}
		});

		penSize.addChangeListener(new ChangeListener() {

			@Override
			public void stateChanged(ChangeEvent e) {
				stroke = (float) penSize.getValue();
			}
		});

		canvasPanel.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				if (isDraw != false) {
					super.mousePressed(e);
					eX = e.getX();
					eY = e.getY();
					tmp.add(new TempPoint(eX, eY));
					int sendColor = color.getRGB();
					((Sender) sender).sendPress(eX, eY, roomName);
				}
			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub
				if (isDraw != false) {
					super.mouseReleased(e);
					/*
					 * eX = e.getX(); eY = e.getY();
					 */
					list.add(tmp);
					tmp = new Vector<TempPoint>();
					((Sender) sender).sendRelease(roomName);
				}
			}
		});

		canvasPanel.addMouseMotionListener(new MouseAdapter() {

			@Override
			public void mouseDragged(MouseEvent e) {
				// TODO Auto-generated method stub
				if (isDraw != false) {
					super.mouseDragged(e);
					sX = e.getX();
					sY = e.getY();
					tmp.add(new TempPoint(sX, sY));
					g = canvasPanel.getGraphics();
					g2 = (Graphics2D) g;
					g2.setStroke(new BasicStroke(stroke, BasicStroke.CAP_ROUND, 0));
					g.setColor(color);
					g.drawLine(sX, sY, eX, eY);
					eX = sX;
					eY = sY;
					int sendColor = color.getRGB();
					((Sender) sender).sendCoordinate(sX, sY, sendColor, stroke, roomName);
				}
			}
		});

		roomCenter.add(canvasPanel);

		JPanel toolPane = new JPanel();
		toolPane.setLayout(null);
		toolPane.setSize(480, 50);
		toolPane.setLocation(10, 520);
		toolPane.setBackground(Color.WHITE);
		roomCenter.add(toolPane);

		JButton tool = new JButton("도구");
		tool.setSize(60, 30);
		tool.setLocation(400, 10);
		toolPane.add(tool);

		tool.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				colorDialog.setVisible(true);

				ColorSelectionModel model = chooser.getSelectionModel();

				ChangeListener listener = new ChangeListener() {
					@Override
					public void stateChanged(ChangeEvent e) {

						color = chooser.getColor();
					}
				};
				model.addChangeListener(listener);
			}
		});

		Image trashIcon = new ImageIcon("images/trash.jpg").getImage().getScaledInstance(30, 30, 0);
		JButton trash = new JButton( new ImageIcon(trashIcon) );
		trash.setSize(30, 30);
		trash.setLocation(350, 10);
		toolPane.add(trash);

		trash.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				/*
				 * if (isDraw) { isDraw = false; chatOutput.append("정답자모드로 전환되었습니다.\n");
				 * chatOutput.setCaretPosition(chatOutput.getDocument().getLength());
				 * chatInput.setText(null); chatInput.requestFocus(); } else { isDraw = true;
				 * chatOutput.append("출제자모드로 전환되었습니다.\n");
				 * chatOutput.setCaretPosition(chatOutput.getDocument().getLength());
				 * chatInput.setText(null); chatInput.requestFocus(); }
				 */
				if(isDraw) {
				canvasPanel.repaint();
				((Sender) sender).sendRepaint(roomName);
				}
			}
		});

		// 버튼 테두리 없앰
		trash.setBorderPainted(false);
		trash.setContentAreaFilled(false);
		tool.setBorderPainted(false);
		tool.setContentAreaFilled(false);

		Image ctnimg = new ImageIcon("images/ctntimer.png").getImage().getScaledInstance(30, 30, 0);
		JLabel ctntimer = new JLabel(new ImageIcon(ctnimg));
		ctntimer.setSize(30, 30);
		ctntimer.setLocation(5, 10);
		toolPane.add(ctntimer);

		timer = new JLabel("00:00");
		timer.setSize(80, 30);
		timer.setLocation(35, 10);
		toolPane.add(timer);

		JLabel item1 = new JLabel(mm.u.getOwnItem1() + "");
		item1.setSize(30, 30);
		item1.setLocation(150, 10);
		toolPane.add(item1);
		Image item1Image = new ImageIcon("images/timer.png").getImage().getScaledInstance(30, 30, 0);
		JButton item1Img = new JButton(new ImageIcon(item1Image));
		item1Img.setSize(30, 30);
		item1Img.setLocation(110, 10);
		toolPane.add(item1Img);

		item1Img.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if (mm.u.getOwnItem1() > 0 && isDraw) {
					System.out.println("time stop");
					usingTimeStop = true;
					mm.u.setOwnItem1(mm.u.getOwnItem1() - 1);
					mm.u.getOwnItem1();
					item1.setText(mm.u.getOwnItem1() + "");
				}
			}
		});
		JLabel item2 = new JLabel(mm.u.getOwnItem2() + "");
		item2.setSize(30, 30);
		item2.setLocation(210, 10);
		toolPane.add(item2);
		Image item2Image = new ImageIcon("images/chosung.png").getImage().getScaledInstance(30, 30, 0);
		JButton item2Img = new JButton(new ImageIcon(item2Image));
		item2Img.setSize(30, 30);
		item2Img.setLocation(170, 10);
		toolPane.add(item2Img);

		item2Img.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if (mm.u.getOwnItem2() > 0 && !isDraw) {
					((Sender) sender).sendChosung(userId, roomName);
					mm.u.setOwnItem2(mm.u.getOwnItem2() - 1);
					item2.setText(mm.u.getOwnItem2() + "");
				}
			}
		});

		Image captureImage = new ImageIcon("images/screenshot.png").getImage().getScaledInstance(150, 30, 0);
		JButton capture = new JButton(new ImageIcon(captureImage));
		capture.setSize(150, 30);
		capture.setLocation(20, 5);
		roomCenter.add(capture);

		capture.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				Robot robot;
				// 윈도우기준 패널위치 잡아서 범위로 지정
				Rectangle rec = new Rectangle(canvasPanel.getLocationOnScreen().x, canvasPanel.getLocationOnScreen().y,
						480, 480);

				BufferedImage capturedImg = null;
				try {
					// 범위 지정 크기만큼 캡쳐이미지로 저장
					capturedImg = new Robot().createScreenCapture(rec);

				} catch (AWTException e1) {
					e1.printStackTrace();
				}

				JFileChooser fileChooser = new JFileChooser("C:\\Users\\Username\\Desktop");

				// 파일 확장자 목록
				fileChooser.setFileFilter(new FileNameExtensionFilter("*.jpg", ".jpg"));
				fileChooser.setFileFilter(new FileNameExtensionFilter("*.png", ".png"));
				fileChooser.setFileFilter(new FileNameExtensionFilter("*.bmp", ".bmp"));

				if (fileChooser.showSaveDialog(null) == JFileChooser.APPROVE_OPTION) {
					File file = fileChooser.getSelectedFile();

					try {
						// 파일 확장자 선택되었을 시 해당 확장자명으로 파일 저장
						if (fileChooser.getFileFilter().getDescription().equals("*.jpg")) {
							ImageIO.write((BufferedImage) capturedImg, "jpg",
									new File(file.getAbsolutePath() + ".jpg"));
						} else if (fileChooser.getFileFilter().getDescription().equals("*.png")) {
							ImageIO.write((BufferedImage) capturedImg, "png",
									new File(file.getAbsolutePath() + ".png"));
						} else if (fileChooser.getFileFilter().getDescription().equals("*.bmp")) {
							ImageIO.write((BufferedImage) capturedImg, "bmp",
									new File(file.getAbsolutePath() + ".bmp"));
						}

					} catch (IOException ex) {
						System.out.println("Failed to save image!");
					}
				}

			}
		});

		Image optionImage = new ImageIcon("images/option.png").getImage().getScaledInstance(60, 30, 0);
		JButton settingbtn = new JButton(new ImageIcon(optionImage));
		settingbtn.setSize(60, 30);
		settingbtn.setLocation(425, 5);
		roomCenter.add(settingbtn);

		settingbtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// setting = new Setting(u);
				System.out.println("세팅창 미구현");

			}
		});
		// 채팅----------------------------------------------------------------------
		chatOutput = new JTextArea();
		chatOutput.setBackground(Color.WHITE);
		chatOutput.setEditable(false);
		roomCenter.add(chatOutput);

		chatInput = new JTextField(15);
		chatInput.setSize(500, 30);
		chatInput.setLocation(0, 690);
		roomCenter.add(chatInput);

		JButton chatOkbtn = new JButton("전송");
		chatOkbtn.setSize(60, 29);
		chatOkbtn.setLocation(440, 0);
		chatInput.add(chatOkbtn);

		JScrollPane chatScroll = new JScrollPane(chatOutput);
		chatScroll.setLocation(0, 576);
		chatScroll.setSize(501, 116);
		roomCenter.add(chatScroll);

		// 엔터 누를시 채팅넘기기
		chatInput.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				String msg = chatInput.getText();

				// 채팅입력 출력하기
				if (!msg.isEmpty()) {
					((Sender) sender).sendAllMsg(msg, roomName);
					chatOutput.append(userId + " >> " + msg + "\n");
					chatOutput.setCaretPosition(chatOutput.getDocument().getLength());
					chatInput.setText(null);
					chatInput.requestFocus();
				}

			}
		});

		// 전송버튼 클릭시 채팅넘기기
		chatOkbtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				String msg = chatInput.getText();

				if (!msg.isEmpty()) {
					// chatOutput이 textArea
					// chatInput이 textField
					((Sender) sender).sendAllMsg(msg, roomName);
					chatOutput.append((userId + " >> " + msg + "\n"));
					chatOutput.setCaretPosition(chatOutput.getDocument().getLength());
					chatInput.setText(null);
					chatInput.requestFocus();
				}
			}
		});

		// ---------------------------------------------------------------------
		// 오른쪽 화면
		JPanel roomRight = new JPanel();
		roomRight.setLayout(null);
		roomRight.setBackground(Color.ORANGE);
		roomRight.setLocation(762, 0);
		roomRight.setSize(262, 768);
		this.add(roomRight);

		// 이미지, 닉네임, 게임 내 정답횟수
		JPanel user5 = new JPanel();
		user5.setLayout(null);
		user5.setSize(240, 120);
		user5.setLocation(12, 35);
		// userImg = new JLabel(new ImageIcon(new
		// ImageIcon(u.getImgName()).getImage().getScaledInstance(100, 100, 0)));
		userImg = new JLabel("유저5 이미지");
		userImg.setSize(100, 100);
		userImg.setLocation(10, 15);
		user5.add(userImg);
		name = new JLabel("닉네임");
		name.setSize(100, 40);
		name.setLocation(140, 0);
		user5.add(name);
		userName = new JLabel("유저5");
		userName.setSize(100, 30);
		userName.setLocation(140, 30);
		ctn = new JLabel("정답 횟수");
		ctn.setSize(100, 40);
		ctn.setLocation(130, 55);
		user5.add(ctn);
		userCtn = new JLabel("횟수");
		userCtn.setSize(100, 40);
		userCtn.setLocation(157, 80);
		user5.add(userCtn);
		user5.add(userName);
		roomRight.add(user5);

		JPanel user6 = new JPanel();
		user6.setLayout(null);
		user6.setSize(240, 120);
		user6.setLocation(12, 175);
		userImg = new JLabel("유저6 이미지");
		userImg.setSize(100, 100);
		userImg.setLocation(10, 15);
		user6.add(userImg);
		name = new JLabel("닉네임");
		name.setSize(100, 40);
		name.setLocation(140, 0);
		user6.add(name);
		userName = new JLabel("유저6");
		userName.setSize(100, 30);
		userName.setLocation(140, 30);
		user6.add(userName);
		ctn = new JLabel("정답 횟수");
		ctn.setSize(100, 40);
		ctn.setLocation(130, 55);
		user6.add(ctn);
		userCtn = new JLabel("횟수");
		userCtn.setSize(100, 40);
		userCtn.setLocation(157, 80);
		user6.add(userCtn);
		roomRight.add(user6);

		JPanel user7 = new JPanel();
		user7.setLayout(null);
		user7.setSize(240, 120);
		user7.setLocation(12, 315);
		userImg = new JLabel("유저7 이미지");
		userImg.setSize(100, 100);
		userImg.setLocation(10, 15);
		user7.add(userImg);
		name = new JLabel("닉네임");
		name.setSize(100, 40);
		name.setLocation(140, 0);
		user7.add(name);
		userName = new JLabel("유저7");
		userName.setSize(100, 30);
		userName.setLocation(140, 30);
		user7.add(userName);
		ctn = new JLabel("정답 횟수");
		ctn.setSize(100, 40);
		ctn.setLocation(130, 55);
		user7.add(ctn);
		userCtn = new JLabel("횟수");
		userCtn.setSize(100, 40);
		userCtn.setLocation(157, 80);
		user7.add(userCtn);
		roomRight.add(user7);

		JPanel user8 = new JPanel();
		user8.setLayout(null);
		user8.setSize(240, 120);
		user8.setLocation(12, 455);
		userImg = new JLabel("유저8 이미지");
		userImg.setSize(100, 100);
		userImg.setLocation(10, 15);
		user8.add(userImg);
		name = new JLabel("닉네임");
		name.setSize(100, 40);
		name.setLocation(140, 0);
		user8.add(name);
		userName = new JLabel("유저8");
		userName.setSize(100, 30);
		userName.setLocation(140, 30);
		user8.add(userName);
		ctn = new JLabel("정답 횟수");
		ctn.setSize(100, 40);
		ctn.setLocation(130, 55);
		user8.add(ctn);
		userCtn = new JLabel("횟수");
		userCtn.setSize(100, 40);
		userCtn.setLocation(157, 80);
		user8.add(userCtn);
		roomRight.add(user8);

		JButton exitBtn = new JButton("나가기");
		exitBtn.setSize(80, 40);
		exitBtn.setLocation(150, 670);
		roomRight.add(exitBtn);

		// 게임시작
		// 버튼=========================================================================================
		JButton startBtn = new JButton("게임 시작");
		startBtn.setSize(190, 40);
		startBtn.setLocation(40, 610);
		roomRight.add(startBtn);

		startBtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if (isDraw) {
					((Sender) sender).sendRepaint(roomName);
					threadStop(false);
					startStopWatch();
				}
			}
		});

		// 나가기 버튼 클릭
		exitBtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				((Sender) sender).exitRoom(roomName);
				((Sender) sender).sendUserInfo(mm.u);
				dispose();
				mm.setVisible(true);
				threadStop(true);
			}
		});

		this.addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				// TODO Auto-generated method stub
				JFrame frame = (JFrame) e.getWindow();
				((Sender) sender).exitRoom(roomName);
				((Sender) sender).sendUserInfo(mm.u);
				frame.dispose();
				mm.setVisible(true);
			}
		});

		// 신고하기 버튼
		JButton report = new JButton("신고하기");
		report.setSize(90, 40);
		report.setLocation(40, 670);
		roomRight.add(report);

		Dialog reportDialog = new Dialog(this, "신고하기", true);
		reportDialog.setLayout(null);
		reportDialog.setSize(380, 480);
		reportDialog.setLocationRelativeTo(null);

		Image reportImage = new ImageIcon("images/report.png").getImage().getScaledInstance(132, 220, 0);
		JLabel reportImageIcon = new JLabel(new ImageIcon(reportImage));
		reportImageIcon.setSize(132, 220);
		reportImageIcon.setLocation(8, 180);
		reportDialog.add(reportImageIcon);

		JLabel reportNameLabel = new JLabel("신고할 유저 : ");
		reportNameLabel.setSize(100, 30);
		reportNameLabel.setLocation(40, 50);
		reportDialog.add(reportNameLabel);

		JTextField reportNameText = new JTextField();
		reportNameText.setSize(200, 30);
		reportNameText.setLocation(140, 50);
		reportDialog.add(reportNameText);

		JLabel reportReason = new JLabel("신고 내용 : ");
		reportReason.setSize(100, 100);
		reportReason.setLocation(40, 100);
		reportDialog.add(reportReason);

		JTextArea reportReasonText = new JTextArea();
		reportReasonText.setSize(200, 300);
		reportReasonText.setLocation(140, 100);
		reportReasonText.setLineWrap(true);
		reportDialog.add(reportReasonText);

		JButton reportOk = new JButton("확인");
		reportOk.setSize(60, 30);
		reportOk.setLocation(170, 420);
		reportDialog.add(reportOk);

		JButton reportCancel = new JButton("취소");
		reportCancel.setSize(60, 30);
		reportCancel.setLocation(250, 420);
		reportDialog.add(reportCancel);

		// 신고하기 버튼
		report.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				reportDialog.setVisible(true);

			}
		});

		// 신고 확인 버튼
		reportOk.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if (!reportNameText.getText().isEmpty()) {
					JOptionPane.showMessageDialog(null, "신고 완료되었습니다.");
					reportDialog.dispose();
				} else {
					JOptionPane.showMessageDialog(null, "유저 이름이나 내용이 입력되지 않았습니다.");
				}

			}
		});

		// 신고 취소 버튼
		reportCancel.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				reportDialog.dispose();

			}
		});
		// ---------------------------------------------------------------------
		// 왼쪽 화면
		JPanel roomLeft = new JPanel();
		roomLeft.setLayout(null);
		roomLeft.setBackground(Color.CYAN);
		roomLeft.setLocation(0, 0);
		roomLeft.setSize(262, 768);
		this.add(roomLeft);

		JPanel user1 = new JPanel();
		user1.setLayout(null);
		user1.setSize(240, 120);
		user1.setLocation(12, 35);
		userImg = new JLabel("유저1 이미지");
		userImg.setSize(100, 100);
		userImg.setLocation(10, 15);
		user1.add(userImg);
		name = new JLabel("닉네임");
		name.setSize(100, 40);
		name.setLocation(140, 0);
		user1.add(name);
		userName = new JLabel("유저1");
		userName.setSize(100, 30);
		userName.setLocation(140, 30);
		user1.add(userName);
		ctn = new JLabel("정답 횟수");
		ctn.setSize(100, 40);
		ctn.setLocation(130, 55);
		user1.add(ctn);
		userCtn = new JLabel("횟수");
		userCtn.setSize(100, 40);
		userCtn.setLocation(157, 80);
		user1.add(userCtn);
		roomLeft.add(user1);

		JPanel user2 = new JPanel();
		user2.setLayout(null);
		user2.setSize(240, 120);
		user2.setLocation(12, 175);
		userImg = new JLabel("유저2 이미지");
		userImg.setSize(100, 100);
		userImg.setLocation(10, 15);
		user2.add(userImg);
		name = new JLabel("닉네임");
		name.setSize(100, 40);
		name.setLocation(140, 0);
		user2.add(name);
		userName = new JLabel("유저2");
		userName.setSize(100, 30);
		userName.setLocation(140, 30);
		user2.add(userName);
		ctn = new JLabel("정답 횟수");
		ctn.setSize(100, 40);
		ctn.setLocation(130, 55);
		user2.add(ctn);
		userCtn = new JLabel("횟수");
		userCtn.setSize(100, 40);
		userCtn.setLocation(157, 80);
		user2.add(userCtn);
		roomLeft.add(user2);

		JPanel user3 = new JPanel();
		user3.setLayout(null);
		user3.setSize(240, 120);
		user3.setLocation(12, 315);
		userImg = new JLabel("유저3 이미지");
		userImg.setSize(100, 100);
		userImg.setLocation(10, 15);
		user3.add(userImg);
		name = new JLabel("닉네임");
		name.setSize(100, 40);
		name.setLocation(140, 0);
		user3.add(name);
		userName = new JLabel("유저3");
		userName.setSize(100, 30);
		userName.setLocation(140, 30);
		user3.add(userName);
		ctn = new JLabel("정답 횟수");
		ctn.setSize(100, 40);
		ctn.setLocation(130, 55);
		user3.add(ctn);
		userCtn = new JLabel("횟수");
		userCtn.setSize(100, 40);
		userCtn.setLocation(157, 80);
		user3.add(userCtn);
		roomLeft.add(user3);

		JPanel user4 = new JPanel();
		user4.setLayout(null);
		user4.setSize(240, 120);
		user4.setLocation(12, 455);
		userImg = new JLabel("유저4 이미지");
		userImg.setSize(100, 100);
		userImg.setLocation(10, 15);
		user4.add(userImg);
		name = new JLabel("닉네임");
		name.setSize(100, 40);
		name.setLocation(140, 0);
		user4.add(name);
		userName = new JLabel("유저4");
		userName.setSize(100, 30);
		userName.setLocation(140, 30);
		user4.add(userName);
		ctn = new JLabel("정답 횟수");
		ctn.setSize(100, 40);
		ctn.setLocation(130, 55);
		user4.add(ctn);
		userCtn = new JLabel("횟수");
		userCtn.setSize(100, 40);
		userCtn.setLocation(157, 80);
		user4.add(userCtn);
		roomLeft.add(user4);

		Image icon = new ImageIcon("images/title.jpg").getImage().getScaledInstance(240, 120, 0);
		JLabel logo = new JLabel(new ImageIcon(icon));
		logo.setSize(240, 150);
		logo.setLocation(12, 580);
		roomLeft.add(logo);

		JLabel copyRight = new JLabel("CopyRighted by KH치마인드");
		copyRight.setFont(copyfont);
		copyRight.setSize(200, 20);
		copyRight.setLocation(170, 717);
		roomCenter.add(copyRight);

		this.setVisible(true);
		this.setLocationRelativeTo(null);
		this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
	}

	public void appendChat(String msg) {
		chatOutput.append(msg + "\n");
		chatOutput.setCaretPosition(chatOutput.getDocument().getLength());
		chatInput.requestFocus();
	}

	public void oneUserAppendChat(String msg, String userId) {
		if (this.userId.equals(userId)) {
			chatOutput.append(msg + "\n");
			chatOutput.setCaretPosition(chatOutput.getDocument().getLength());
			chatInput.requestFocus();
		}
	}
	
	public void allRepaint() {
		canvasPanel.repaint();
	}
	public void dragMouse(int sX, int sY, Color color, float stroke) {
		tmp.add(new TempPoint(sX, sY));
		g = canvasPanel.getGraphics();
		g2 = (Graphics2D) g;
		g2.setStroke(new BasicStroke(stroke, BasicStroke.CAP_ROUND, 0));
		g.setColor(color);
		g.drawLine(sX, sY, eX, eY);
		eX = sX;
		eY = sY;
	}

	public void pressMouse(int eX, int eY) {
		this.eX = eX;
		this.eY = eY;
		tmp.add(new TempPoint(eX, eY));
	}

	public void releaseMouse(/* int eX, int eY */) {
		/*
		 * this.eX = eX; this.eY = eY;
		 */
		list.add(tmp);
		tmp = new Vector<TempPoint>();
	}

	public void startStopWatch() {
		gameTimer = new Thread(this);
		gameTimer.start();
	}

	public void inturruptThread() {
		if (gameTimer != null) {
			gameTimer.interrupt();
		}
	}

	public void threadStop(boolean stop) {
		this.stop = stop;
	}

	@Override
	public void run() {

		count = 90;
		int i_min = 0;
		String s_min = "";
		String s_sec = "";
		while (count != -1 && !stop) {
			i_min = count / 60;
			s_min = String.format("%02d", i_min);
			s_sec = String.format("%02d", count % 60);
			String str = s_min + " : " + s_sec;
			timer.setText(str);
			count--;
			((Sender) sender).sendTimer(str, roomName, userId);
			if (count == -1) {
				break;
			}
			try {
				Thread.sleep(1000);
			} catch (Exception e) {
				return;
			}

			if (usingTimeStop) {
				try {
					Thread.sleep(5000);
					usingTimeStop = false;
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (count == 0) {
				isDraw = false;
			}
		}

	}

	public void setTime(String str) {
		timer.setText(str);
		timer.repaint();
	}

	public void changeIsDraw(String userId, boolean flag) {
		isDraw = flag;
	}
}
