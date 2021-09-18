package com.kh.client.view;

import java.awt.Color;
import java.awt.Dialog;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTextField;

import com.kh.client.model.vo.ClientUser;

public class Store extends JFrame {

	JLabel paySelect = new JLabel(); // 결제금액확인
	JLabel chooseSelect = new JLabel(); // 결제방식선택확인
	JLabel presult = new JLabel("금액이 선택되지 않았습니다."); // 결제금액
	JLabel cresult = new JLabel("방식이 선택되지 않았습니다."); // 결제방식
	int buyCoin; // 코인개수
	JLabel chargeCoinNum = null; // 코인충전개수확인
	ButtonGroup c = null;
	JRadioButton card = null;
	JRadioButton cash = null;
	MainMenu mm;
	int item = 50;
	int random = 30;

	public Store(ClientUser u, MainMenu mm) {
		this.mm = mm;

		this.setLayout(null);
		this.setSize(1024, 768);
		this.setResizable(false);
		Dimension frameSize = this.getSize(); // 프레임 사이즈
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize(); // 모니터 사이즈
		this.setLocation((screenSize.width - frameSize.width) / 2, (screenSize.height - frameSize.height) / 2); // 화면 중앙

		JPanel bg = new JPanel();
		bg.setSize(1024, 768);

		Image storeImage = new ImageIcon("images/bg.png").getImage().getScaledInstance(1024, 768, 0);
		JLabel storeImageIcon = new JLabel(new ImageIcon(storeImage));
		storeImageIcon.setSize(1024, 768);
		bg.add(storeImageIcon);

		// 상점이름
		JLabel store = new JLabel("상점");
		Font font = new Font("고딕", Font.BOLD, 50);
		store.setFont(font);
		store.setSize(150, 80);
		store.setLocation(60, 30);
		this.add(store);

		// --------------------------------------------------------------------------------
		// 아이템목록
		JLabel itemList = new JLabel("아이템 목록");
		itemList.setSize(100, 40);
		itemList.setLocation(95, 120);
		this.add(itemList);

		// 아이템1
		JLabel item1Coin = new JLabel(item + "코인");
		item1Coin.setSize(50, 30);
		item1Coin.setLocation(95, 320);
		RoundButton item1BuyButton = new RoundButton("구매");
		item1BuyButton.setSize(60, 30);
		item1BuyButton.setLocation(185, 320);
		JLabel item1Name = new JLabel("출제자 아이템");
		item1Name.setSize(100, 30);
		item1Name.setLocation(130, 350);
		item1Name.setForeground(Color.BLUE);
		Image item1icon = new ImageIcon("images/timer.png").getImage().getScaledInstance(150, 150, 1);
		JLabel item1Image = new JLabel(new ImageIcon(item1icon));
		item1Image.setSize(150, 150);
		item1Image.setLocation(95, 170);
		// item1.add(item1Image);
		this.add(item1Image);
		this.add(item1Name);
		this.add(item1Coin);
		this.add(item1BuyButton);

		// 아이템2
		JLabel item2Coin = new JLabel(item + "코인");
		item2Coin.setSize(50, 30);
		item2Coin.setLocation(430, 320);
		RoundButton item2BuyButton = new RoundButton("구매");
		item2BuyButton.setSize(60, 30);
		item2BuyButton.setLocation(520, 320);
		JLabel item2Name = new JLabel("정답자 아이템");
		item2Name.setSize(100, 30);
		item2Name.setLocation(465, 350);
		item2Name.setForeground(Color.BLUE);
		Image item2icon = new ImageIcon("images/chosung.png").getImage().getScaledInstance(150, 150, 0);
		JLabel item2Image = new JLabel(new ImageIcon(item2icon));
		item2Image.setSize(150, 150);
		item2Image.setLocation(430, 170);
		this.add(item2Image);
		this.add(item2Name);
		this.add(item2Coin);
		this.add(item2BuyButton);

		// 랜덤박스
		JLabel randomBoxCoin = new JLabel(random + "코인");
		randomBoxCoin.setSize(50, 30);
		randomBoxCoin.setLocation(750, 320);
		RoundButton randomBoxBuyButton = new RoundButton("뽑기");
		randomBoxBuyButton.setSize(60, 30);
		randomBoxBuyButton.setLocation(840, 320);
		JLabel randomBoxName = new JLabel("랜덤 박스");
		randomBoxName.setSize(100, 30);
		randomBoxName.setLocation(802, 350);
		randomBoxName.setForeground(Color.BLUE);
		Image randomBoxicon = new ImageIcon("images/randomBox.gif").getImage().getScaledInstance(150, 150, 0);
		JLabel randomBoxImage = new JLabel(new ImageIcon(randomBoxicon));
		randomBoxImage.setSize(150, 150);
		randomBoxImage.setLocation(750, 170);
		this.add(randomBoxName);
		this.add(randomBoxCoin);
		this.add(randomBoxImage);
		this.add(randomBoxBuyButton);

		// 랜덤박스뽑기 결과
		Dialog randomBoxResultDialog = new Dialog(this, "랜덤박스");
		randomBoxResultDialog.setResizable(false);
		randomBoxResultDialog.setLayout(null);
		randomBoxResultDialog.setSize(300, 300);
		randomBoxResultDialog.setLocation((screenSize.width - randomBoxResultDialog.getWidth()) / 2,
				(screenSize.height - randomBoxResultDialog.getHeight()) / 2);
		// 뽑기결과 아이템 이미지
		JLabel randomBoxLabel = new JLabel();
		randomBoxLabel.setBounds(75, 60, 150, 140);
		randomBoxResultDialog.add(randomBoxLabel);

		// 뽑기 결과 출력 후 확인 버튼
		RoundButton randomBoxDialogOkButton = new RoundButton("확인");
		randomBoxDialogOkButton.setBounds(120, 250, 60, 30);
		randomBoxResultDialog.add(randomBoxDialogOkButton);

		// 아이템 획득 결과
		JLabel randomBoxResultLabel = new JLabel();
		randomBoxResultLabel.setBounds(110, 200, 150, 30);
		randomBoxResultDialog.add(randomBoxResultLabel);

		// --------------------------------------------------------------------------------
		// 보유아이템
		JLabel ownItemList = new JLabel("보유아이템");
		ownItemList.setSize(100, 40);
		ownItemList.setLocation(95, 400);
		this.add(ownItemList);

		// 보유아이템1
		JPanel ownItem1 = new JPanel();
		ownItem1.setSize(150, 150);
		ownItem1.setLocation(95, 450);
		JLabel ownItem1Image = new JLabel(new ImageIcon(item1icon));
		ownItem1.add(ownItem1Image);
		this.add(ownItem1);

		JLabel ownItem1Label = new JLabel("보유개수 : " + u.getOwnItem1());
		ownItem1Label.setSize(100, 40);
		ownItem1Label.setLocation(165, 590);
		JLabel ownItem1Name = new JLabel("출제자 아이템");
		ownItem1Name.setSize(100, 30);
		ownItem1Name.setLocation(130, 630);
		ownItem1Name.setForeground(Color.BLUE);
		this.add(ownItem1Name);
		this.add(ownItem1Label);

		// 보유아이템2
		JPanel ownItem2 = new JPanel();
		ownItem2.setSize(150, 150);
		ownItem2.setLocation(430, 450);
		JLabel ownItem2Image = new JLabel(new ImageIcon(item2icon));
		ownItem2.add(ownItem2Image);
		this.add(ownItem2);

		JLabel ownItem2Label = new JLabel("보유개수 : " + u.getOwnItem2());
		ownItem2Label.setSize(100, 40);
		ownItem2Label.setLocation(500, 590);
		JLabel ownItem2Name = new JLabel("정답자 아이템");
		ownItem2Name.setSize(100, 30);
		ownItem2Name.setLocation(465, 630);
		ownItem2Name.setForeground(Color.BLUE);
		this.add(ownItem2Name);
		this.add(ownItem2Label);

		// --------------------------------------------------------------------------------
		// 코인개수 출력
		JLabel ownCoinLabel = new JLabel("내 코인 : " + u.getCoin());
		ownCoinLabel.setSize(100, 40);
		ownCoinLabel.setLocation(310, 55);
		this.add(ownCoinLabel);

		// 아이템1 구매 팝업
		Dialog item1BuyDialog = new Dialog(this, "아이템 구매", true);
		item1BuyDialog.setResizable(false);
		item1BuyDialog.setLayout(null);
		item1BuyDialog.setSize(200, 160);
		item1BuyDialog.setLocation((screenSize.width - item1BuyDialog.getWidth()) / 2,
				(screenSize.height - item1BuyDialog.getHeight()) / 2);
		JLabel item1BuyDialogLabel = new JLabel("구매하시겠습니까?");
		item1BuyDialogLabel.setSize(150, 40);
		item1BuyDialogLabel.setLocation(50, 50);
		item1BuyDialog.add(item1BuyDialogLabel);
		RoundButton item1BuyDialogBuyButton = new RoundButton("구매");
		item1BuyDialogBuyButton.setSize(60, 40);
		item1BuyDialogBuyButton.setLocation(70, 100);
		item1BuyDialog.add(item1BuyDialogBuyButton);

		// 아이템2 구매 팝업
		Dialog item2BuyDialog = new Dialog(this, "아이템 구매", true);
		item2BuyDialog.setResizable(false);
		item2BuyDialog.setLayout(null);
		item2BuyDialog.setSize(200, 160);
		item2BuyDialog.setLocation((screenSize.width - item2BuyDialog.getWidth()) / 2,
				(screenSize.height - item2BuyDialog.getHeight()) / 2);
		JLabel item2BuyDialogLabel = new JLabel("구매하시겠습니까?");
		item2BuyDialogLabel.setSize(150, 40);
		item2BuyDialogLabel.setLocation(50, 50);
		item2BuyDialog.add(item2BuyDialogLabel);
		RoundButton item2BuyDialogBuyButton = new RoundButton("구매");
		item2BuyDialogBuyButton.setSize(60, 40);
		item2BuyDialogBuyButton.setLocation(70, 100);
		item2BuyDialog.add(item2BuyDialogBuyButton);

		// 코인 부족할때 팝업
		Dialog emptyCoin = new Dialog(this, "코인 부족!", true);
		emptyCoin.setResizable(false);
		emptyCoin.setLayout(null);
		emptyCoin.setSize(130, 130);
		emptyCoin.setLocation((screenSize.width - emptyCoin.getWidth()) / 2,
				(screenSize.height - emptyCoin.getHeight()) / 2);
		RoundButton emptyCoinButton = new RoundButton("확인");
		emptyCoinButton.setSize(60, 30);
		emptyCoinButton.setLocation(45, 90);
		JLabel emptyCoinLabel = new JLabel("코인이 부족합니다!");
		emptyCoinLabel.setSize(130, 40);
		emptyCoinLabel.setLocation(17, 40);
		emptyCoin.add(emptyCoinLabel);
		emptyCoin.add(emptyCoinButton);

		emptyCoinButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				emptyCoin.dispose();
			}
		});
		// --------------------------------------------------------------------------------
		// 아이템1 구매시
		item1BuyButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				if (u.getCoin() >= 0 && u.getCoin() - item >= 0) {
					item1BuyDialog.setVisible(true);

				} else if (u.getCoin() < 0 || u.getCoin() - item < 0) {
					emptyCoin.setVisible(true);
				}
			}
		});

		// 아이템1 구매버튼 클릭시
		item1BuyDialogBuyButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 보유코인 아이템구매에 필요한 코인만큼 감소후
				u.setCoin(u.getCoin() - item);
				// 아이템1의 개수 1 증가
				u.setOwnItem1(u.getOwnItem1() + 1);
				// 아이템1 보유개수 출력
				ownItem1Label.setText("보유개수 : " + u.getOwnItem1());
				// 보유코인개수 출력
				ownCoinLabel.setText("내 코인 : " + u.getCoin());
				item1BuyDialog.dispose();
				// um.updateUser(u);
			}
		});

		// 아이템2 구매시
		item2BuyButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				if (u.getCoin() >= 0 && u.getCoin() - item >= 0) {
					item2BuyDialog.setVisible(true);

				} else if (u.getCoin() < 0 || u.getCoin() - item < 0) {
					emptyCoin.setVisible(true);
				}

			}
		});

		// 아이템2 구매버튼 클릭시
		item2BuyDialogBuyButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 보유코인 아이템구매에 필요한 코인만큼 감소후
				u.setCoin(u.getCoin() - item);
				// 아이템2의 개수 1 증가
				u.setOwnItem2(u.getOwnItem2() + 1);
				// 아이템2 보유개수 출력
				ownItem2Label.setText("보유개수 : " + u.getOwnItem2());
				// 보유코인개수 출력
				ownCoinLabel.setText("내 코인 : " + u.getCoin());
				item2BuyDialog.dispose();
				// um.updateUser(u);
			}
		});

		// 랜덤박스 뽑기 결과 창
		// 랜덤변수에 따른 아이템이미지와 결과텍스트 출력
		randomBoxBuyButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if (u.getCoin() >= 0 && u.getCoin() - random >= 0) {
					// 랜덤박스 결과창 출력
					randomBoxResultDialog.setVisible(true);
					// 보유코인 랜덤박스 구매에 필요한 개수만큼 감소
					u.setCoin(u.getCoin() - random);
					// 랜덤박스를 위한 변수 설정
					int rbn = (int) ((Math.random() * 3) + 1);
					// 변수에 따른 아이템 이미지 및 개수증가 설정
					// 변수 1이 나왔을 때
					if (rbn == 1) {
						randomBoxLabel.setIcon(new ImageIcon(item1icon));
						randomBoxResultLabel.setText("출제자 아이템");
						// 아이템1의 개수 1 증가
						u.setOwnItem1(u.getOwnItem1() + 1);
						// 아이템1 개수 출력
						ownItem1Label.setText("보유개수 : " + u.getOwnItem1());
						// 코인개수 출력
						ownCoinLabel.setText("내 코인 : " + u.getCoin());
						// 변수 2 나왔을 때
					} else if (rbn == 2) {
						randomBoxLabel.setIcon(new ImageIcon(item2icon));
						randomBoxResultLabel.setText("정답자 아이템");
						// 아이템2 개수 1증가
						u.setOwnItem2(u.getOwnItem2() + 1);
						// 아이템2 개수 출력
						ownItem2Label.setText("보유개수 : " + u.getOwnItem2());
						// 코인개수 출력
						ownCoinLabel.setText("내 코인 : " + u.getCoin());
						// 변수 3 나왔을 때
					} else if (rbn == 3) {
						Image icon = new ImageIcon("images/bomb.png").getImage().getScaledInstance(150, 140, 0);
						randomBoxLabel.setIcon(new ImageIcon(icon));
						randomBoxResultLabel.setText("꽝~! 보상 : 1코인");
						u.setCoin(u.getCoin() + 1);
						ownCoinLabel.setText("내 코인 : " + u.getCoin());

					}

					// 뽑기결과 출력 후 확인 버튼
					randomBoxDialogOkButton.addActionListener(new ActionListener() {

						@Override
						public void actionPerformed(ActionEvent e) {
							// 뽑기결과 종료
							randomBoxResultDialog.dispose();

						}
					});
				} else if (u.getCoin() < 0 || u.getCoin() - random < 0) {
					emptyCoin.setVisible(true);
				}
			}
		});

		// 결제창-------------------------------------------------------------------------
		// ------------------------------------------------------------------------------
		Dialog pay = new Dialog(this, "결제창", true);
		pay.setLayout(null);
		pay.setBounds(300, 100, 400, 600);
		pay.setResizable(false);

		pay.setLocation((screenSize.width - pay.getWidth()) / 2, (screenSize.height - pay.getHeight()) / 2); // 화면 중앙

		// --------------------------------------------------------------------------------
		// 결제하기
		JLabel payLabel = new JLabel("결제하기");
		Font payfont = new Font("고딕", Font.BOLD, 30);
		payLabel.setFont(payfont);
		payLabel.setLocation(136, 30);
		payLabel.setSize(150, 40);
		pay.add(payLabel);

		// 결제 방식 설정
		JLabel payChoose = new JLabel("결제 방식");
		payChoose.setLocation(166, 80);
		payChoose.setSize(100, 30);
		pay.add(payChoose);

		card = new JRadioButton("카드 결제");
		cash = new JRadioButton("계좌 이체");

		c = new ButtonGroup();
		c.add(card);
		c.add(cash);

		card.setLocation(100, 110);
		card.setSize(100, 30);
		cash.setLocation(200, 110);
		cash.setSize(100, 30);

		pay.add(card);
		pay.add(cash);

		// 결제 금액 설정
		JLabel price = new JLabel("결제 금액");
		price.setLocation(166, 150);
		price.setSize(100, 30);
		pay.add(price);

		JRadioButton priceButton1 = new JRadioButton("5,000원 : 50개");
		priceButton1.setLocation(130, 180);
		priceButton1.setSize(200, 30);
		JRadioButton priceButton2 = new JRadioButton("10,000원 : 105개");
		priceButton2.setLocation(130, 210);
		priceButton2.setSize(200, 30);
		JRadioButton priceButton3 = new JRadioButton("20,000원 : 210개");
		priceButton3.setLocation(130, 240);
		priceButton3.setSize(200, 30);
		JRadioButton priceButton4 = new JRadioButton("30,000원 : 315개");
		priceButton4.setLocation(130, 270);
		priceButton4.setSize(200, 30);
		JRadioButton priceButton5 = new JRadioButton("50,000원 : 550개");
		priceButton5.setLocation(130, 300);
		priceButton5.setSize(200, 30);
		ButtonGroup p = new ButtonGroup();
		p.add(priceButton1);
		p.add(priceButton2);
		p.add(priceButton3);
		p.add(priceButton4);
		p.add(priceButton5);

		pay.add(priceButton1);
		pay.add(priceButton2);
		pay.add(priceButton3);
		pay.add(priceButton4);
		pay.add(priceButton5);

		// --------------------------------------------------------------------------------
		// 충전하기 팝업창
		Dialog payDialog = new Dialog(pay, "충전하기", true);
		payDialog.setResizable(false);
		payDialog.setLayout(null);
		payDialog.setSize(300, 300);
		payDialog.setLocation((screenSize.width - payDialog.getWidth()) / 2,
				(screenSize.height - payDialog.getHeight()) / 2);

		// 버튼
		RoundButton payDialogOkButton = new RoundButton("확인");
		RoundButton payDialogCancelButton = new RoundButton("취소");

		payDialogOkButton.setLocation(100, 250);
		payDialogOkButton.setSize(75, 30);
		payDialogCancelButton.setLocation(200, 250);
		payDialogCancelButton.setSize(75, 30);

		payDialog.add(payDialogCancelButton);
		payDialog.add(payDialogOkButton);

		// 결제금액, 방식 출력 text
		this.cresult.setLocation(100, 350);
		this.cresult.setSize(300, 30);
		pay.add(this.cresult);

		this.presult.setLocation(100, 400);
		this.presult.setSize(300, 30);
		pay.add(this.presult);

		// ------------------------------------------------------------------------------------------------
		// 카드결제 선택시 번호 입력
		Dialog cardNumberInput = new Dialog(payDialog, "카드번호 입력", true);
		cardNumberInput.setResizable(false);
		cardNumberInput.setLayout(null);
		cardNumberInput.setSize(400, 250);
		cardNumberInput.setLocation((screenSize.width - cardNumberInput.getWidth()) / 2,
				(screenSize.height - cardNumberInput.getHeight()) / 2);
		JLabel cardNumberLabel = new JLabel("카드번호 입력");
		cardNumberLabel.setSize(150, 40);
		cardNumberLabel.setLocation(60, 50);
		JTextField cardNumberText1 = new JTextField();
		cardNumberText1.setSize(60, 40);
		cardNumberText1.setLocation(60, 100);
		JTextField cardNumberText2 = new JTextField();
		cardNumberText2.setSize(60, 40);
		cardNumberText2.setLocation(140, 100);
		JTextField cardNumberText3 = new JTextField();
		cardNumberText3.setSize(60, 40);
		cardNumberText3.setLocation(220, 100);
		JTextField cardNumberText4 = new JTextField();
		cardNumberText4.setSize(60, 40);
		cardNumberText4.setLocation(300, 100);
		RoundButton cardNumberInputOkButton = new RoundButton("확인");
		cardNumberInputOkButton.setSize(60, 40);
		cardNumberInputOkButton.setLocation(200, 180);
		RoundButton cardNumberInputCalcelButton = new RoundButton("취소");
		cardNumberInputCalcelButton.setSize(60, 40);
		cardNumberInputCalcelButton.setLocation(280, 180);
		JLabel cardNumberInputCancelMsg = new JLabel("취소버튼을 누르면 상점화면으로 돌아갑니다.");
		cardNumberInputCancelMsg.setSize(300, 40);
		cardNumberInputCancelMsg.setLocation(70, 210);

		// 카드번호 미입력시
		// ==============================================================================================
		Dialog cardNumberError = new Dialog(cardNumberInput, "nochooseLabel!", true);
		cardNumberError.setResizable(false);
		cardNumberError.setModal(false);
		cardNumberError.setLayout(null);
		cardNumberError.setSize(200, 150);
		cardNumberError.setLocation((screenSize.width - cardNumberError.getWidth()) / 2,
				(screenSize.height - cardNumberError.getHeight()) / 2);
		JLabel cardNumberErrorLabel = new JLabel("카드번호를 입력해주세요.");
		cardNumberErrorLabel.setSize(150, 50);
		cardNumberErrorLabel.setLocation(30, 40);
		RoundButton cardNumberErrorOkButton = new RoundButton("확인");
		cardNumberErrorOkButton.setSize(60, 40);
		cardNumberErrorOkButton.setLocation(72, 90);
		cardNumberError.add(cardNumberErrorLabel);
		cardNumberError.add(cardNumberErrorOkButton);

		cardNumberInput.add(cardNumberLabel);
		cardNumberInput.add(cardNumberText1);
		cardNumberInput.add(cardNumberText2);
		cardNumberInput.add(cardNumberText3);
		cardNumberInput.add(cardNumberText4);
		cardNumberInput.add(cardNumberInputOkButton);
		cardNumberInput.add(cardNumberInputCalcelButton);
		cardNumberInput.add(cardNumberInputCancelMsg);

		// 계좌이체 선택시
		// 번호입력=================================================================================
		Dialog cashNumberInput = new Dialog(payDialog, "계좌번호 입력", true);
		cashNumberInput.setResizable(false);
		cashNumberInput.setLayout(null);
		cashNumberInput.setSize(400, 250);
		cashNumberInput.setLocation((screenSize.width - cashNumberInput.getWidth()) / 2,
				(screenSize.height - cashNumberInput.getHeight()) / 2);
		JLabel cashNumberLabel = new JLabel("계좌번호 입력");
		cashNumberLabel.setSize(150, 40);
		cashNumberLabel.setLocation(60, 50);
		JTextField cashText = new JTextField();
		cashText.setSize(200, 40);
		cashText.setLocation(120, 100);
		RoundButton cashNumberInputOkButton = new RoundButton("확인");
		cashNumberInputOkButton.setSize(60, 40);
		cashNumberInputOkButton.setLocation(170, 180);
		RoundButton cashNumberInputCancelButton = new RoundButton("취소");
		cashNumberInputCancelButton.setSize(60, 40);
		cashNumberInputCancelButton.setLocation(250, 180);
		JLabel cashNumberInputCancelMsg = new JLabel("취소버튼을 누르면 상점화면으로 돌아갑니다.");
		cashNumberInputCancelMsg.setSize(300, 40);
		cashNumberInputCancelMsg.setLocation(70, 210);

		// 계좌번호 미입력시
		// =========================================================================================
		Dialog cashNumberError = new Dialog(cashNumberInput, "Error!", true);
		cashNumberError.setResizable(false);
		cashNumberError.setLayout(null);
		cashNumberError.setSize(200, 150);
		cashNumberError.setLocation((screenSize.width - cashNumberError.getWidth()) / 2,
				(screenSize.height - cashNumberInput.getHeight()) / 2);
		JLabel cashNumberErrorLabel = new JLabel("계좌번호를 입력해주세요.");
		cashNumberErrorLabel.setSize(150, 50);
		cashNumberErrorLabel.setLocation(30, 40);
		RoundButton cashNumberErrorOkButton = new RoundButton("확인");
		cashNumberErrorOkButton.setSize(60, 40);
		cashNumberErrorOkButton.setLocation(72, 90);
		cashNumberError.add(cashNumberErrorOkButton);
		cashNumberError.add(cashNumberErrorLabel);

		// 은행선택================================================================================================
		String[] banks = { "신한", "하나", "농협", "카카오", "대구", "부산" };
		JComboBox banklist = new JComboBox(banks);
		banklist.setSize(60, 40);
		banklist.setLocation(60, 100);
		cashNumberInput.add(cashNumberLabel);
		cashNumberInput.add(cashNumberInputOkButton);
		cashNumberInput.add(cashNumberInputCancelButton);
		cashNumberInput.add(cashText);
		cashNumberInput.add(banklist);
		cashNumberInput.add(cashNumberInputCancelMsg);

		// 카드결제 선택 시
		card.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 카드결제 선택 출력
				cresult.setText("카드 결제 선택되었습니다.");

			}
		});

		// 계좌이체 선택 시
		cash.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 계좌이체 선택 출력
				cresult.setText("계좌 이체 선택되었습니다.");

			}
		});

		// 결제금액 선택 시
		// 구매할 코인개수 넘겨준 후, 결제금액 출력
		priceButton1.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				buyCoin = 50;
				presult.setText("5,000원 선택되었습니다.");

			}
		});
		priceButton2.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				buyCoin = 105;
				presult.setText("10,000원 선택되었습니다.");

			}
		});
		priceButton3.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				buyCoin = 210;
				presult.setText("20,000원 선택되었습니다.");

			}
		});
		priceButton4.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				buyCoin = 315;
				presult.setText("30,000원 선택되었습니다.");

			}
		});
		priceButton5.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				buyCoin = 550;
				presult.setText("50,000원 선택되었습니다.");

			}
		});

		// --------------------------------------------------------------------------------
		// 충전하기 버튼
		RoundButton payDialogPayButton = new RoundButton("충전하기");
		payDialogPayButton.setLocation(180, 500);
		payDialogPayButton.setSize(90, 30);
		pay.add(payDialogPayButton);

		this.chooseSelect = new JLabel(this.cresult.getText());
		chooseSelect.setLocation(75, 80);
		chooseSelect.setSize(200, 30);
		this.paySelect = new JLabel(this.presult.getText());
		this.paySelect.setLocation(75, 120);
		this.paySelect.setSize(200, 30);
		chargeCoinNum = new JLabel();
		chargeCoinNum.setLocation(80, 180);
		chargeCoinNum.setSize(150, 30);
		payDialog.add(chooseSelect);
		payDialog.add(paySelect);
		payDialog.add(chargeCoinNum);

		// 아무것도 선택하지 않았을때
		// 경고창==============================================================================
		Dialog nochooseDialog = new Dialog(payDialog, "Error!", true);
		nochooseDialog.setResizable(false);
		nochooseDialog.setLayout(null);
		nochooseDialog.setSize(300, 150);
		nochooseDialog.setLocation((screenSize.width - nochooseDialog.getWidth()) / 2,
				(screenSize.height - nochooseDialog.getHeight()) / 2);

		JLabel nochooseLabel = new JLabel("결제방식과 금액을 선택해주세요!");
		nochooseLabel.setSize(200, 100);
		nochooseLabel.setLocation(60, 20);
		RoundButton nochooseOkButton = new RoundButton("확인");
		nochooseOkButton.setSize(70, 30);
		nochooseOkButton.setLocation(120, 100);
		nochooseDialog.add(nochooseLabel);
		nochooseDialog.add(nochooseOkButton);

		// 충전하기 클릭시 팝업

		payDialogPayButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 결제방식이 선택되지 않았을 때
				if (!cash.isSelected() && !card.isSelected()) {
					// 경고창 띄움
					nochooseDialog.setVisible(true);

					// 결제금액이 선택되지 않았을 때
				} else if (!priceButton1.isSelected() && !priceButton2.isSelected() && !priceButton3.isSelected()
						&& !priceButton4.isSelected() && !priceButton5.isSelected()) {
					// 경고창 띄움
					nochooseDialog.setVisible(true);

					// 결제방식 결제금액 모두 선택 되었을 때
				} else {

					// 카드 선택
					if (card.isSelected()) {
						// 카드번호 입력 팝업 출력
						cardNumberInput.setVisible(true);
					}

					// 계좌이체 선택
					if (cash.isSelected()) {
						// 계좌번호 입력 팝업 출력
						cashNumberInput.setVisible(true);

					}

				}
			}
		});

		// 경고창 확인버튼 클릭시
		nochooseOkButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 경고창 사라짐
				nochooseDialog.dispose();

			}
		});

		// 카드번호 입력 팝업 확인 버튼 클릭
		cardNumberInputOkButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 카드번호 미입력시
				if (cardNumberText1.getText().isEmpty() || cardNumberText2.getText().isEmpty()
						|| cardNumberText3.getText().isEmpty() || cardNumberText4.getText().isEmpty()) {
					// 카드번호 미입력 에러 팝업 출력
					cardNumberError.setVisible(true);

					// 카드번호 입력시
				} else {
					// 카드번호 입력 팝업 사라짐
					cardNumberInput.dispose();
					// 입력된 카드번호 가져와서 출력
					chooseSelect.setText("카드번호 : " + cardNumberText1.getText() + "-" + cardNumberText2.getText() + "-"
							+ cardNumberText3.getText() + "-" + cardNumberText4.getText());
					// 선택된 결제방식 가져와서 출력
					paySelect.setText(presult.getText());
					// 충전할 코인개수 가져와서 출력
					chargeCoinNum.setText(buyCoin + "개 충전하시겠습니까?");
					payDialog.setVisible(true);
					// 입력된 값 초기화
					cardNumberText1.setText(null);
					cardNumberText2.setText(null);
					cardNumberText3.setText(null);
					cardNumberText4.setText(null);
					cresult.setText("방식이 설정되지 않았습니다.");
					presult.setText("금액이 설정되지 않았습니다.");
				}

			}
		});

		// 계좌번호 입력 팝업 확인버튼 클릭
		cashNumberInputOkButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 계좌번호 미 입력시
				if (cashText.getText().isEmpty()) {
					// 계좌번호 미입력 에러 팝업 출력
					cashNumberError.setVisible(true);
				}

				// 계좌번호 입력시
				if (!cashText.getText().isEmpty()) {
					// 계좌번호 입력 팝업 사라짐
					cashNumberInput.dispose();
					// 입력된 계좌번호 가져와서 출력
					chooseSelect.setText(banklist.getSelectedItem() + " - " + cashText.getText());
					// 선택된 결제방식 가져와서 출력
					paySelect.setText(presult.getText());
					// 충전할 코인계수 가져와서 출력
					chargeCoinNum.setText(buyCoin + "개 충전하시겠습니까?");
					payDialog.setVisible(true);
					// 입력된 값 초기화
					cashText.setText(null);
					cresult.setText("방식이 설정되지 않았습니다.");
					presult.setText("금액이 설정되지 않았습니다.");
				}
			}
		});

		// 충전취소버튼
		payDialogCancelButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 충전하기 팝업 사라짐
				payDialog.dispose();

			}
		});

		// 카드결제 에러 확인버튼
		cardNumberErrorOkButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 카드번호 입력 에러 팝업 사라짐
				cardNumberError.dispose();
			}
		});

		// 카드번호입력 취소버튼
		cardNumberInputCalcelButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 결제창 종료
				cardNumberText1.setText(null);
				cardNumberText2.setText(null);
				cardNumberText3.setText(null);
				cardNumberText4.setText(null);
				payDialog.dispose();

			}
		});

		// 계좌이체 에러 확인버튼
		cashNumberErrorOkButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 계좌번호 입력 에러 팝업 사라짐
				cashNumberError.dispose();
			}
		});

		// 계좌번호입력 취소버튼
		cashNumberInputCancelButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 입력된 카드번호 초기화 후 결제창 종료
				cashText.setText(null);
				payDialog.dispose();
			}
		});

		// --------------------------------------------------------------------------------------------------------
		// 충전확인시 방식,금액 확인 팝업
		Dialog payCompleteDialog = new Dialog(pay, "충전완료", true);
		payCompleteDialog.setResizable(false);
		payCompleteDialog.setLayout(null);
		payCompleteDialog.setSize(200, 150);
		payCompleteDialog.setLocation((screenSize.width - payCompleteDialog.getWidth()) / 2,
				(screenSize.height - payCompleteDialog.getHeight()) / 2);

		JLabel payCompleteLabel = new JLabel("결제가 완료되었습니다.");
		payCompleteLabel.setSize(150, 100);
		payCompleteLabel.setLocation(35, 20);
		payCompleteDialog.add(payCompleteLabel);

		RoundButton payCompleteOkButton = new RoundButton("확인");
		payCompleteOkButton.setSize(60, 30);
		payCompleteOkButton.setLocation(70, 100);
		payCompleteDialog.add(payCompleteOkButton);

		// payCompleteDialog.setBackground(Color.GREEN); //팝업창 배경색
		// payCompleteLabel.setForeground(Color.WHITE); //라벨 글씨색
		// payCompleteOkButton.setBackground(Color.CYAN); //버튼 배경색
		// payCompleteOkButton.setForeground(Color.WHITE); //버튼 글씨색

		// 충전하기 확인 클릭 시 팝업
		payDialogOkButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 충전 완료 팝업 출력
				payCompleteDialog.setVisible(true);
			}

		});

		// 충전완료 확인 클릭
		payCompleteOkButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 선택된 값 초기화
				c.clearSelection();
				p.clearSelection();

				// 보유코인개수 수정
				u.setCoin(u.getCoin() + buyCoin);
				ownCoinLabel.setText("내 코인 : " + u.getCoin());
				// um.updateUser(u);

				// 결제창 종료
				pay.dispose();
			}
		});

		// 상점으로
		// 버튼===============================================================================================
		RoundButton payexit = new RoundButton("상점으로");
		payexit.setLocation(280, 500);
		payexit.setSize(90, 30);
		pay.add(payexit);

		// 상점으로 클릭시 팝업
		payexit.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// 선택된 값 초기화
				c.clearSelection();
				p.clearSelection();
				cresult.setText("방식이 설정되지 않았습니다.");
				presult.setText("금액이 설정되지 않았습니다.");

				pay.dispose(); // 창 종료
			}
		});

		// ----------------------------------------------------------------------------------------------------
		// 결제버튼
		RoundButton payButton = new RoundButton("결제하기");
		payButton.setSize(106, 30);
		payButton.setLocation(400, 58);
		this.add(payButton);

		// 결제버튼 클릭시
		payButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// 결제창 팝업 실행
				pay.setVisible(true);
			}
		});

		// 이전화면으로
		RoundButton exit = new RoundButton("나가기");
		exit.setSize(100, 30);
		exit.setLocation(800, 650);
		this.add(exit);

		exit.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				dispose();

				System.out.println(mm);

				mm.doMain();
			}
		});

		this.add(bg);
		this.setVisible(true);
		this.setLocationRelativeTo(null);
		this.setDefaultCloseOperation(DO_NOTHING_ON_CLOSE); // X눌러도 안꺼짐
	}
}
