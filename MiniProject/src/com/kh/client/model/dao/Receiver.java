package com.kh.client.model.dao;

import java.awt.Color;
import java.awt.Graphics;
import java.io.DataInputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.SocketException;
import java.util.Vector;

import javax.swing.JOptionPane;

import com.kh.client.model.vo.ClientUser;
import com.kh.client.view.FindResult;
import com.kh.client.view.GameRoom;
import com.kh.client.view.LoginPage;
import com.kh.client.view.MainMenu;
import com.kh.server.model.vo.TempPoint;

public class Receiver extends Thread{
	Socket socket;
	Thread sender;
	String userId;
//	ObjectInputStream in;
	DataInputStream in;
	int sX, sY, eX, eY;
	Float stroke;
	Color color = Color.BLACK;
	Graphics g;
	GameRoom game;
	LoginPage lp;
	MainMenu mm;
	Vector<TempPoint> tmp = new Vector<TempPoint>(); 
	Vector<Vector> list = new Vector<Vector>();

	// Socket�� �Ű������� �޴� ������.
	public Receiver(Socket socket, Thread sender, LoginPage lp) {
		this.socket = socket;
		this.sender = sender;
		this.lp = lp;
		try {
//			in = new ObjectInputStream(new DataInputStream(this.socket.getInputStream()));
			in = new DataInputStream(this.socket.getInputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void run() {			// run()메소드 재정의
		
		try {
		while (in != null) { 	// 입력스트림이 null이 아니면..반복
				String msg = in.readUTF();
				System.out.println("receive");
				if (msg.startsWith("coordinate")) {
					String[] tmpMsg = msg.split(":::");
					tmpMsg = tmpMsg[1].split(",/");
					sX = Integer.parseInt(tmpMsg[0]);
					sY = Integer.parseInt(tmpMsg[1]);
					color = new Color(Integer.parseInt(tmpMsg[2]));
					stroke = Float.parseFloat(tmpMsg[3]);
					game.dragMouse(sX, sY, color, stroke);
					
				} else if (msg.startsWith("press")) {
					String[] tmpMsg = msg.split(":::");
					tmpMsg = tmpMsg[1].split(",/");
					eX = Integer.parseInt(tmpMsg[0]);
					eY = Integer.parseInt(tmpMsg[1]);

					game.pressMouse(eX, eY);
					
				} else if (msg.startsWith("login")) {
					String[] tmpMsg = msg.split(":::");
					tmpMsg = tmpMsg[1].split(":");
					
					boolean result = Boolean.parseBoolean(tmpMsg[0]);
					String userId = tmpMsg[1];
					this.userId = userId;
					String userPw = tmpMsg[2];
					String userName = tmpMsg[3];
					String userEmail = tmpMsg[4];
					int userCoin = Integer.parseInt(tmpMsg[5]);
					boolean userProfile = Boolean.parseBoolean(tmpMsg[6]);
					boolean userMusicSet = Boolean.parseBoolean(tmpMsg[7]);
					int userVictory = Integer.parseInt(tmpMsg[8]);
					boolean userAcceptQuest1 = Boolean.parseBoolean(tmpMsg[9]);
					boolean userAcceptQuest2 = Boolean.parseBoolean(tmpMsg[10]);
					boolean userAcceptQuest3 = Boolean.parseBoolean(tmpMsg[11]);
					boolean userQuestClear1 = Boolean.parseBoolean(tmpMsg[12]);
					boolean userQuestClear2 = Boolean.parseBoolean(tmpMsg[13]);
					boolean userQusetClear3 = Boolean.parseBoolean(tmpMsg[14]);
					int userItem1 = Integer.parseInt(tmpMsg[15]);
					int userItem2 = Integer.parseInt(tmpMsg[16]);
					
					
					
					
					System.out.println(result);
					ClientUser u = new ClientUser(userId, userPw, userName, userEmail, userCoin, userProfile, userMusicSet, userVictory
							, userAcceptQuest1, userAcceptQuest2, userAcceptQuest3, userQuestClear1, userQuestClear2, userQusetClear3
							, userItem1, userItem2);
					
					lp.resultLogin(result, u, sender, this);

				}  else if (msg.startsWith("released")) {
					game.releaseMouse();
					
				} else if (msg.startsWith("createRoom")) {
					String[] tmpMsg = msg.split(":::");
					String roomName = tmpMsg[1];
					mm = lp.getMainMenu();
					game = new GameRoom(sender, this, userId, roomName);
					System.out.println("방을 생성했습니다.");
					game.doGame(mm);

				} else if (msg.startsWith("enterRoom")) {
					String[] tmpMsg = msg.split(":::");
					String roomName = tmpMsg[1];
					mm = lp.getMainMenu();
					game = new GameRoom(sender, this, userId, roomName);
					game.doGame(mm);

				} else if (msg.startsWith("sendAllMsg")) {
					String[] tmpMsg = msg.split(":::");
					tmpMsg = tmpMsg[1].split(",/");
					String receiveMsg = tmpMsg[0];
					String fromUserId = tmpMsg[1];
					game.appendChat(fromUserId + " >> " + receiveMsg);
				} else if(msg.startsWith("sendMainRoomMsg")) {
					String[] tmpMsg = msg.split(":::");
					tmpMsg = tmpMsg[1].split(",/");
					String receiveMsg = tmpMsg[0];
					String fromUserId = tmpMsg[1];
					mm = lp.getMainMenu();
					mm.appendChat(fromUserId + " >> " + receiveMsg);
					
				} else if(msg.startsWith("signUp")) {
					String[] tmpMsg = msg.split(":::");
					boolean result = Boolean.parseBoolean(tmpMsg[1]);
					lp.resultSignUp(result);
				} else if(msg.startsWith("failLogin")) {
					JOptionPane.showMessageDialog(null, "아이디와 비밀번호를 확인하세요!");
					
				} else if(msg.startsWith("timer")) {
					String[] tmpMsg = msg.split(":::");
					game.setTime(tmpMsg[1]);

				} else if(msg.startsWith("checkId")) {
					String[] tmpMsg = msg.split(":::");
					boolean result = Boolean.parseBoolean(tmpMsg[1]);
					System.out.println(result);
					lp.resultCheckId(result);
				} else if(msg.startsWith("sendEmail")) {
					String[] tmpMsg = msg.split(":::");
					boolean result = Boolean.parseBoolean(tmpMsg[1]);
					System.out.println(result);
					lp.resultEmail(result);
          
				} else if(msg.startsWith("changeIsDraw")) {
					String[] tmpMsg = msg.split(":::");
					tmpMsg = tmpMsg[1].split(",/");
					
					String userId = tmpMsg[0];
					Boolean flag = Boolean.parseBoolean(tmpMsg[1]);
					game.changeIsDraw(userId, flag);
				} else if(msg.startsWith("sendAnswer")) {
					String[] tmpMsg = msg.split(":::");
					tmpMsg = tmpMsg[1].split(",/");
					String answer = "제시어 : " + tmpMsg[0];
					String userId = tmpMsg[1];
					game.oneUserAppendChat(answer, userId);


				} else if(msg.startsWith("findId")) {
					String[] tmpMsg = msg.split(":::");
					String findId = tmpMsg[1];
					if(findId.equals("notFound")) {
						JOptionPane.showMessageDialog(null, "해당 이메일이 등록된 아이디가 없습니다.");
					} else {
						FindResult fr = new FindResult(findId);
					}

				} else if(msg.startsWith("isDraw")) {
					String[] tmpMsg = msg.split(":::");
					tmpMsg = tmpMsg[1].split(",/");
					
					String receiveMsg = tmpMsg[0];
					String userId = tmpMsg[1];
					Boolean flag = Boolean.parseBoolean(tmpMsg[2]);
					System.out.println("Receiver : " + flag);
					game.changeIsDraw(userId, flag);
					game.threadStop(true);
					game.appendChat(receiveMsg);
				} else if(msg.startsWith("chosung")) {
					String[] tmpMsg = msg.split(":::");
					tmpMsg = tmpMsg[1].split(",/");
					
					String userId = tmpMsg[0];
					String chosung = tmpMsg[1];
					
					game.oneUserAppendChat(chosung, userId);

				}else if(msg.startsWith("repaint")) {
					game.allRepaint();
				}
			}  
		} catch (SocketException e) {
			JOptionPane.showMessageDialog(null, "서버와 연결이 끊어졌습니다. 접속을 종료합니다.");
			System.exit(0);
		} catch (Exception e) {
			
		}
	}// run()------
	
}
