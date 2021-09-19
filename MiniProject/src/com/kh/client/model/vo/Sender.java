package com.kh.client.model.vo;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

public class Sender extends Thread {
	Socket socket;
//	ObjectOutputStream out;
	DataOutputStream out;
	String userId;
	String roomName;
	
	public Sender(Socket socket) { // Ŭ���̾�Ʈ�� ���ϰ� ���̵�
		this.socket = socket;
		try {
//			out = new ObjectOutputStream(new DataOutputStream(socket.getOutputStream()));
			out = new DataOutputStream(socket.getOutputStream());
		} catch (IOException e) {
			System.out.println("Sender ������ Exception �߻�");
			e.printStackTrace();
		}
	}

	@Override
	public void run() { // run()�޼ҵ� ������
		// ������ �Է��� ������̸��� �����ش�.
		/*try {
			out.writeUTF("login:::" + userId);
			out.flush();
		} catch (IOException e) {
			System.out.println("�α��� Exception!!! : ");
			e.printStackTrace();
		}*/
	}// run()------

	public void sendCoordinate(int x, int y, int sendColor, float stroke, String roomName) {
		try {
			out.writeUTF("coordinate:::" + x + ",/" + y + ",/" + sendColor + ",/" + stroke + ",/" + roomName + ",/" + userId);
			out.flush();
		} catch (IOException e) {
			System.out.println("��ǥ Exception!!!");
			e.printStackTrace();
		}
	}
	
	public void sendPress(int x, int y, String roomName) {
		try {
			out.writeUTF("press:::" + x + ",/" + y + ",/" + roomName + ",/" + userId);
			out.flush();
		} catch (IOException e) {
			System.out.println("��ǥpress Exception!!!");
			e.printStackTrace();
		}
	}

	public void sendRelease(String roomName) {
		try {
			out.writeUTF("released:::" + roomName + ",/" + userId);
			out.flush();
		} catch (IOException e) {
			System.out.println("��ǥ Released Exception!!!");
		}
	}
	
	public void sendChosung(String userId, String roomName) {
		try {
			out.writeUTF("chosung:::" + userId + ",/" + roomName);
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void sendAllMsg(String msg, String roomName) {
    	try {
			out.writeUTF("sendAllMsg:::" + msg + ",/" + roomName + ",/" + userId);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
	
	public void sendMainRoomMsg(String msg, String userId) {
		try {
			out.writeUTF("sendMainRoomMsg:::" + msg + ",/" + userId);
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void exitRoom(String roomName) {
    	try {
			out.writeUTF("exitRoom:::" + roomName + ",/" + userId);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
	
	public void sendColor(int color) {
		try {
			out.writeUTF("color:::" + color);
			out.flush();
		} catch (IOException e) {
			System.out.println("color exception");
			e.printStackTrace();
		}
	}

	public void searchClient() {
		try {
			out.writeUTF("search");
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public synchronized void sendCreateRoom(String roomName, String roomPwd, String people) {
		try {
			out.writeUTF("createRoom:::" + roomName + ",/" + roomPwd + ",/"+ people + ",/" + userId);
			System.out.println("createRoom:::" + roomName + ",/" + roomPwd + ",/"+ people + ",/" + userId);
			out.flush();
		} catch (IOException e) {
			System.out.println("�游��� Exception!!!");
			e.printStackTrace();
		}
	}

	public synchronized void sendEnterRoom(String roomName) {
		try {
			out.writeUTF("enterRoom:::" + roomName + ",/" + userId);
			out.flush();
		} catch (IOException e) {
			System.out.println("������ Exception!!!");
			e.printStackTrace();
		}
	}
	
	public synchronized void sendSignUp(String msg) {
		try {
			out.writeUTF("signUp:::" + msg + ",/" + socket.getLocalPort());
			out.flush();
		} catch(IOException e) {
			System.out.println("회원가입 Exception");
			e.printStackTrace();
		}
	}
	
	public synchronized void sendCheckId(String id) {
		try {
			out.writeUTF("checkId:::" + id + ",/" + socket.getLocalPort());
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public synchronized void sendEmail(String id, String email) {
		try {
			out.writeUTF("sendEmail:::" + id + ",/" + email + ",/" + socket.getLocalPort());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public synchronized void sendLogin(String msg, String userId) {		//msg = 아이디 ,/ 비밀번호
		try {
			this.userId = userId;
			out.writeUTF("login:::" + msg + ":" + socket.getLocalPort());
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public synchronized void sendLogOut(String userId) {
		try {
			out.writeUTF("logOut:::" + userId);
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public synchronized void sendUserInfo(ClientUser u) {
		String userId = u.getUserId();
		String userPw = u.getUserPwd();
		String userName = u.getUserName();
		String userEmail = u.getEmail();
		int userCoin = u.getCoin();
		String userImgName = u.getImgName();
		boolean userProfile = u.isProfile();
		boolean userMusicSet = u.isMusicSet();
		int userVictory = u.getVictory();
		int userItem1 = u.getOwnItem1();
		int userItem2 = u.getOwnItem2();
		boolean userTempPwd = u.isTempPwd();
		boolean userAcceptQuest1 = u.isAcceptQuest1();
		boolean userAcceptQuest2 = u.isAcceptQuest2();
		boolean userAcceptQuest3 = u.isAcceptQuest3();
		boolean userQuestClear1 = u.isQuestClear1();
		boolean userQuestClear2 = u.isQuestClear2();
		boolean userQusetClear3 = u.isQuestClear3();

		try {
			out.writeUTF("userInfo:::" + userId + ",/" + userPw + ",/" + userName  + ",/" + userEmail + ",/" + userCoin + ",/"
					+ userImgName  + ",/" +  userProfile + ",/" + userMusicSet + ",/" + userVictory + ",/" + userItem1 + ",/" + userItem2 + ",/" + userTempPwd  + ",/" + 
					userAcceptQuest1 + ",/"	+ userAcceptQuest2 + ",/" + userAcceptQuest3 + ",/" + userQuestClear1 + ",/" + userQuestClear2
					+ ",/" + userQusetClear3 );
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void sendTimer(String time, String roomName, String userId) {
		try {
			out.writeUTF("timer:::" + time + ",/" + roomName + ",/" + userId);
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void sendChangeIsDraw(String userId, String flag, String roomName) {
		try {
			out.writeUTF("changeIsDraw:::" + userId + ",/" + flag + ",/" + roomName);
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public synchronized void sendFindId(String email) {
		try {
			out.writeUTF("findId:::" + email + ",/" + socket.getLocalPort());
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void sendRepaint(String roomName) {
		try {
			out.writeUTF("repaint:::" + roomName);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}// class Sender-------
