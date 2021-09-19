package com.kh.server.view;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;

import com.kh.client.function.Jaso;
import com.kh.server.function.UserManager;
import com.kh.server.model.vo.User;

public class MultiServer implements Serializable {
	public static final int PORT = 1540;
	HashMap<String, DataOutputStream> clientMap;
	HashMap<String, HashMap<String, DataOutputStream>> multiRoom;
	HashMap<Integer, DataOutputStream> loginMap;
	ArrayList<Object> arrRoom;
	ServerSocket serverSocket;
	Socket socket;
	UserManager um;

	String[] q = { "고래밥", "마우스", "하늘보리", "인터폰", "조보아", "백종원", "치킨", "피자", "양꼬치", "올레길", "아이폰", "코카콜라", "우리말", "골목식당", "알라딘", "마스터", "김진호", "도깨비", "노트북", "귓속말" };
	String answer = q[(int) (Math.random() * 20)];

	public MultiServer() {
		um = new UserManager();
		clientMap = new HashMap<>();
		multiRoom = new HashMap<>();
		loginMap = new HashMap<>();
		Collections.synchronizedMap(multiRoom);
		Collections.synchronizedMap(clientMap);
		Collections.synchronizedMap(loginMap);

	}

	public void init() {
		try {
			serverSocket = new ServerSocket(PORT);
			System.out.println("Run to Server...");
			Admin ad = new Admin();
			ad.Adminsd();

			while (true) {
				socket = serverSocket.accept();
				System.out.println(socket.getInetAddress() + ":" + socket.getPort());
				DataOutputStream out = new DataOutputStream(socket.getOutputStream());
				loginMap.put(socket.getPort(), out);
				Thread msr = new MultiServerRec(socket);
				msr.start();

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public synchronized void sendSignUp(String msg) {
		String[] tmpMsg = msg.split(":::");
		tmpMsg = tmpMsg[1].split(",/");
		int tmpPort = Integer.parseInt(tmpMsg[1]);
		boolean result = um.signUp(tmpMsg[0]);

		try {
			DataOutputStream out = new DataOutputStream(socket.getOutputStream());
			Iterator iter = loginMap.keySet().iterator();
			while (iter.hasNext()) {
				int key = (int) iter.next();
				if (key == tmpPort) {
					DataOutputStream iterOut = (DataOutputStream) loginMap.get(key);
					iterOut.writeUTF("signUp:::" + result);
					iterOut.flush();
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public synchronized void sendCheckId(String msg) {
		// "checkId:::" + id + ",/" + socket.getLocalPort()
		String[] tmpMsg = msg.split(":::");
		tmpMsg = tmpMsg[1].split(",/");
		String checkId = tmpMsg[0];
		int tmpPort = Integer.parseInt(tmpMsg[1]);

		try {
			boolean result = um.checkId(checkId);

			Iterator iter = loginMap.keySet().iterator();
			while (iter.hasNext()) {
				int key = (int) iter.next();
				if (key == tmpPort) {
					DataOutputStream iterOut = (DataOutputStream) loginMap.get(key);
					iterOut.writeUTF("checkId:::" + result);
					iterOut.flush();
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public synchronized void sendLogin(String msg) {

		String[] tmpMsg = msg.split(":");
		String userId = tmpMsg[0];
		String userPw = tmpMsg[1];
		String userName = tmpMsg[2];
		String userEmail = tmpMsg[3];
		String userCoin = tmpMsg[4];
		String userProfile = tmpMsg[5];
		String userMusicSet = tmpMsg[6];
		String userVictory = tmpMsg[7];
		String userAcceptQuest1 = tmpMsg[8];
		String userAcceptQuest2 = tmpMsg[9];
		String userAcceptQuest3 = tmpMsg[10];
		String userQuestClear1 = tmpMsg[11];
		String userQuestClear2 = tmpMsg[12];
		String userQusetClear3 = tmpMsg[13];
		String userItem1 = tmpMsg[14];
		String userItem2 = tmpMsg[15];
		int port = Integer.parseInt(tmpMsg[16]);

		boolean result = um.login(userId + ":" + userPw);
		try {
			Iterator iter = loginMap.keySet().iterator();
			while (iter.hasNext()) {
				int key = (int) iter.next();
				if (key == port) {
					DataOutputStream iterOut = (DataOutputStream) loginMap.get(key);
					iterOut.writeUTF("login:::" + result + ":" + userId + ":" + userPw + ":" + userName + ":"
							+ userEmail + ":" + userCoin + ":" + userProfile + ":" + userMusicSet + ":" + userVictory
							+ ":" + userAcceptQuest1 + ":" + userAcceptQuest2 + ":" + userAcceptQuest3 + ":"
							+ userQuestClear1 + ":" + userQuestClear2 + ":" + userQusetClear3 + ":" + userItem1 + ":"
							+ userItem2);
					iterOut.flush();
					// loginMap.remove(key);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void sendCoordinate(String msg) {
		String[] tmpMsg = msg.split(":::");
		tmpMsg = tmpMsg[1].split(",/");
		String x = tmpMsg[0];
		String y = tmpMsg[1];
		String color = tmpMsg[2];
		String stroke = tmpMsg[3];
		String roomName = tmpMsg[4];
		String userId = tmpMsg[5];

		Iterator iter = multiRoom.get(roomName).keySet().iterator();
		while (iter.hasNext()) {
			String key = (String) iter.next();
			if (key.equals(userId)) {
				continue;
			} else {
				DataOutputStream iterOut = (DataOutputStream) multiRoom.get(roomName).get(key);
				try {
					iterOut.writeUTF("coordinate:::" + x + ",/" + y + ",/" + color + ",/" + stroke);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public void sendPress(String msg) {
		String[] tmpMsg = msg.split(":::");
		tmpMsg = tmpMsg[1].split(",/");
		String x = tmpMsg[0];
		String y = tmpMsg[1];
		String roomName = tmpMsg[2];
		String userId = tmpMsg[3];

		Iterator iter = multiRoom.get(roomName).keySet().iterator();
		while (iter.hasNext()) {
			String key = (String) iter.next();
			if (key.equals(userId)) {
				continue;
			} else {
				DataOutputStream iterOut = (DataOutputStream) multiRoom.get(roomName).get(key);
				try {
					iterOut.writeUTF("press:::" + x + ",/" + y);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public void sendRelease(String msg) {
		String[] tmpMsg = msg.split(":::");
		tmpMsg = tmpMsg[1].split(",/");
		String roomName = tmpMsg[0];
		String userId = tmpMsg[1];

		Iterator iter = multiRoom.get(roomName).keySet().iterator();
		while (iter.hasNext()) {
			String key = (String) iter.next();
			if (key.equals(userId)) {
				continue;
			} else {
				DataOutputStream iterOut = (DataOutputStream) multiRoom.get(roomName).get(key);
				try {
					iterOut.writeUTF("released:::");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public synchronized void exitRoom(String msg) {

		String[] tmpMsg = msg.split(":::");
		tmpMsg = tmpMsg[1].split(",/");
		String roomName = tmpMsg[0];
		String userId = tmpMsg[1];

		Iterator iter = multiRoom.get(roomName).keySet().iterator();
		while (iter.hasNext()) {
			String iterId = (String) iter.next();
			if (iterId.equals(userId)) {
				clientMap.put(userId, multiRoom.get(roomName).get(iterId));
				System.out.println(userId + "님이 게임방 " + roomName + "을 나오고 메인화면에 접속했습니다.");
				sendAllMsg("sendAllMsg:::" + userId + "님이 퇴장했습니다" + ",/" + roomName + ",/" + userId);
				multiRoom.get(roomName).remove(userId); // 방에서 빠져나왔기 때문에 삭제
				break;
			}
		}
		

		if (multiRoom.get(roomName).size() == 0) {
			System.out.println("방에 인원이 없어서 삭제합니다.");

			multiRoom.remove(roomName);
		}
	}

	public void sendChangeIsDraw(String msg) {
		String[] tmpMsg = msg.split(",/");
		String userId = tmpMsg[0];
		boolean flag = Boolean.parseBoolean(tmpMsg[1]);
		String roomName = tmpMsg[2];

		Iterator iter = multiRoom.get(roomName).keySet().iterator();
		while (iter.hasNext()) {
			String key = (String) iter.next();
			System.out.println(key);
			if (key.contains(userId)) {
				sendAnswer(userId, roomName);
				DataOutputStream iterOut = (DataOutputStream) multiRoom.get(roomName).get(key);
				try {
					iterOut.writeUTF("changeIsDraw:::" + userId + ",/" + flag);
				} catch (IOException e) {
					e.printStackTrace();

				}
			}
		}
	}

	public void sendAnswer(String userId, String roomName) {
		Iterator iter = multiRoom.get(roomName).keySet().iterator();
		answer = q[(int) (Math.random() * 5)];
		while (iter.hasNext()) {
			String key = (String) iter.next();
			if (key.equals(userId)) {
				DataOutputStream iterOut = (DataOutputStream) multiRoom.get(roomName).get(key);
				try {
					iterOut.writeUTF("sendAnswer:::" + answer + ",/" + userId);
					iterOut.flush();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	public void sendAllMsg(String msg) { // 게임방메세지
		String[] tmpMsg = msg.split(":::");
		tmpMsg = tmpMsg[1].split(",/");
		String sendMsg = tmpMsg[0];
		String roomName = tmpMsg[1];
		String userId = tmpMsg[2];

		if (answer.equals(sendMsg)) {
			sendIsDraw(userId, roomName);
		} else {
			Iterator iter = multiRoom.get(roomName).keySet().iterator();

			while (iter.hasNext()) {
				String key = (String) iter.next();
				if (key.equals(userId)) {
					continue;
				} else {
					DataOutputStream iterOut = (DataOutputStream) multiRoom.get(roomName).get(key);
					System.out.println("iterOut : " + iterOut);
					try {
						iterOut.writeUTF("sendAllMsg:::" + sendMsg + ",/" + userId);
						iterOut.flush();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public void sendIsDraw(String userId, String roomName) {
		Iterator iter = multiRoom.get(roomName).keySet().iterator();

		while (iter.hasNext()) {
			String key = (String) iter.next();
			if (key.equals(userId)) {
				DataOutputStream iterOut = (DataOutputStream) multiRoom.get(roomName).get(key);
				try {
					iterOut.writeUTF("isDraw:::" + userId + "님이 정답을 맞추셨습니다.\n다음 출제자는 " + userId + "입니다." + ",/" + userId
							+ ",/" + true + ",/" + roomName);
					iterOut.flush();
					sendAnswer(userId, roomName);

				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				DataOutputStream iterOut = (DataOutputStream) multiRoom.get(roomName).get(key);
				System.out.println("iterOut : " + iterOut);
				try {
					iterOut.writeUTF("isDraw:::" + userId + "님이 정답을 맞추셨습니다.\n다음 출제자는 " + userId + "입니다." + ",/" + userId
							+ ",/" + false + ",/" + roomName);
					iterOut.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public void sendMainRoomMsg(String msg) {
		String[] tmpMsg = msg.split(":::");
		tmpMsg = tmpMsg[1].split(",/");
		String sendMsg = tmpMsg[0];
		String userId = tmpMsg[1];

		Iterator iter = clientMap.keySet().iterator();
		while (iter.hasNext()) {
			String key = (String) iter.next();
			if (key.equals(userId)) {
				continue;
			} else {
				DataOutputStream iterOut = (DataOutputStream) clientMap.get(key);
				try {
					iterOut.writeUTF("sendMainRoomMsg:::" + sendMsg + ",/" + userId);
					iterOut.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

	}

	public synchronized void createMultiRoom(String msg) {
		String[] tmpMsg = msg.split(":::"); // 1번 인덱스가 방이름
		tmpMsg = tmpMsg[1].split(",/"); // 0번 : 방이름, 1번 : 아이디

		String roomName = tmpMsg[0];
		String roomPwd = tmpMsg[1];
		int people = Integer.parseInt(tmpMsg[2]);
		String userId = tmpMsg[3];

		if (multiRoom.containsKey(roomName)) {
			System.out.println("이미 존재하는 방입니다."); // 동일한 방이름으로 방 생성이 안됨
		} else {
			multiRoom.put(roomName, new HashMap<>()); // 방이름에 대해 방생성
			Collections.synchronizedMap(multiRoom.get(roomName));
			multiRoom.get(roomName).put(userId, clientMap.get(userId)); // 방생성한 유저의 정보 아이디와 출력스트림입력
			Iterator iter = multiRoom.keySet().iterator();
			exit: while (iter.hasNext()) {
				String key = (String) iter.next(); // 방이름을 키값으로 저장
				System.out.println("생성된 방 이름 : " + key);
				if (key.equals(roomName)) { // 키값과 방이름이 같을때만 해당 방의 유저정보 관리
					Iterator iter2 = multiRoom.get(key).keySet().iterator();
					while (iter2.hasNext()) {
						String key2 = (String) iter2.next(); // 유저아이디를 키2값으로 저장
						if (key2.equals(userId)) {
							DataOutputStream iter2Out = (DataOutputStream) multiRoom.get(key).get(key2);
							try {
								iter2Out.writeUTF("createRoom:::" + roomName);
								iter2Out.flush();
							} catch (IOException e) {
								e.printStackTrace();
							}
							System.out.println(userId + "님이 게임방 " + key + "으로 입장했습니다.");
							sendChangeIsDraw(userId + ",/" + true + ",/" + roomName);
							clientMap.remove(userId); // 방에 들어가니깐 메인화면에서 정보 삭제
							break exit;

						} // key2(유저이름) if문--------
					} // iter2.hasNext() while문------
				} // key(방이름) if문-----------
			} // iter.hasNext() while문-------
		} // else문 (방이름 중복체크)-----------
	}// createMultiRoom 메소드 -----------

	public synchronized void enterMultiRoom(String msg) {
		String[] tmpMsg = msg.split(":::"); // 1번 인덱스가 방이름
		tmpMsg = tmpMsg[1].split(",/"); // 0번 : 방이름, 1번 : 아이디

		String roomName = tmpMsg[0];
		String userId = tmpMsg[1];

		if (multiRoom.containsKey(roomName)) {
			multiRoom.get(roomName).put(userId, clientMap.get(userId)); // 만들어진 방에 입장
			clientMap.remove(userId); // 방에 입장해서 메인화면에서 삭제
			Iterator iter = multiRoom.keySet().iterator(); // ��Ƽ�� Ű��
			exit: while (iter.hasNext()) {
				String key = (String) iter.next();
				if (key.equals(roomName)) {
					Iterator iter2 = multiRoom.get(key).keySet().iterator();
					while (iter2.hasNext()) {
						String key2 = (String) iter2.next();
						if (key2.equals(userId)) {
							DataOutputStream iter2Out = (DataOutputStream) multiRoom.get(key).get(key2);
							try {
								iter2Out.writeUTF("enterRoom:::" + roomName);
								iter2Out.flush();
								/*String sendMsg = tmpMsg[0];
								String roomName = tmpMsg[1];
								String userId = tmpMsg[2];*/
								sendAllMsg("sendAllMsg:::" + userId + "님이 입장했습니다" + ",/" + roomName + ",/" + userId);
								break exit;
							} catch (IOException e) {
								e.printStackTrace();
							}
						} // key2(유저아이디)에 대한 if문------
					} // iter2.hasNext() while문------
				} // key(방이름)에 대한 if문------
			} // iter.hasNext() while문------
		} else {
			System.out.println("존재하지 않는 방입니다.");
		}
	}

	public void sendFailLogin() {
		try {
			DataOutputStream out = new DataOutputStream(socket.getOutputStream());
			out.writeUTF("failLogin:::");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public synchronized void sendLogOut(String msg) {
		String[] tmpMsg = msg.split(":::");
		String userId = tmpMsg[1];
		System.out.println(userId + "님이 로그아웃했습니다.");
		clientMap.remove(userId);
	}

	public void sendUserInfo(String msg) {
		String[] tmpMsg = msg.split(":::");
		um.createUser(tmpMsg[1]);
	}

	public synchronized void sendEmail(String msg) {
		String[] tmpMsg = msg.split(":::");
		tmpMsg = tmpMsg[1].split(",/");
		String id = tmpMsg[0];
		String email = tmpMsg[1];
		int tmpPort = Integer.parseInt(tmpMsg[2]);

		try {
			boolean result = um.findPwd(id, email);

			Iterator iter = loginMap.keySet().iterator();
			while (iter.hasNext()) {
				int key = (int) iter.next();
				if (key == tmpPort) {
					DataOutputStream iterOut = (DataOutputStream) loginMap.get(key);
					iterOut.writeUTF("sendEmail:::" + result);
					iterOut.flush();
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public synchronized void sendFindId(String msg) {
		String[] tmpMsg = msg.split(":::");
		tmpMsg = tmpMsg[1].split(",/");
		String email = tmpMsg[0];
		int tmpPort = Integer.parseInt(tmpMsg[1]);

		try {
			String result = um.FindId(email);
			if (result != null) {
				Iterator iter = loginMap.keySet().iterator();
				while (iter.hasNext()) {
					int key = (int) iter.next();
					if (key == tmpPort) {
						DataOutputStream iterOut = (DataOutputStream) loginMap.get(key);
						iterOut.writeUTF("findId:::" + result);
						iterOut.flush();
					}
				}
			} else {
				Iterator iter = loginMap.keySet().iterator();
				while (iter.hasNext()) {
					int key = (int) iter.next();
					if (key == tmpPort) {
						DataOutputStream iterOut = (DataOutputStream) loginMap.get(key);
						iterOut.writeUTF("findId:::notFound");
						iterOut.flush();
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void sendTimer(String msg) {
		String[] tmpMsg = msg.split(":::");
		tmpMsg = tmpMsg[1].split(",/");
		System.out.println(tmpMsg[0] + tmpMsg[1] + tmpMsg[2]);
		String time = tmpMsg[0];
		String roomName = tmpMsg[1];
		String userId = tmpMsg[2];

		Iterator iter = multiRoom.get(roomName).keySet().iterator();
		while (iter.hasNext()) {
			String key = (String) iter.next();
			if (key.equals(userId)) {
				continue;
			} else {
				DataOutputStream iterOut = (DataOutputStream) multiRoom.get(roomName).get(key);
				try {
					iterOut.writeUTF("timer:::" + time);
					iterOut.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public void sendchosung(String msg) {
		String[] tmpMsg = msg.split(":::");
		tmpMsg = tmpMsg[1].split(",/");
		String userId = tmpMsg[0];
		String roomName = tmpMsg[1];
		String chosung = Jaso.hangulToJaso(answer);

		Iterator iter = multiRoom.get(roomName).keySet().iterator();
		while (iter.hasNext()) {
			String key = (String) iter.next();
			if (key.contains(userId)) {
				DataOutputStream iterOut = (DataOutputStream) multiRoom.get(roomName).get(key);
				try {
					iterOut.writeUTF("chosung:::" + userId + ",/" + chosung);
					iterOut.flush();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	public void sendRepaint(String msg) {
		String[] tmpMsg = msg.split(":::");
		String roomName = tmpMsg[1];
		
		Iterator iter = multiRoom.get(roomName).keySet().iterator();
		while(iter.hasNext()) {
			String key = (String) iter.next();
			DataOutputStream iterOut = (DataOutputStream) multiRoom.get(roomName).get(key);
			try {
				iterOut.writeUTF("repaint");
				iterOut.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// ----// 내부 클래스 //--------//

	// 클라이언트로부터 읽어온 메시지를 다른 클라이언트(socket)에 보내는 역할을 하는 메서드
	class MultiServerRec extends Thread {
		String userId;
		Socket socket;
		DataInputStream in;
		DataOutputStream out;

		// ������.
		public MultiServerRec(Socket socket) {
			this.socket = socket;
			try {
				in = new DataInputStream(socket.getInputStream());
				out = new DataOutputStream(socket.getOutputStream());
			} catch (IOException e) {
				System.out.println("����123");
				e.printStackTrace();
			}
		}

		@Override
		public synchronized void run() {
			receiveServer();
		}// run()------------

		public synchronized void receiveServer() {
			try {
				while (in != null) {
					String msg = in.readUTF();
					if (msg.startsWith("coordinate")) { // ��ǥ
						sendCoordinate(msg);
					} else if (msg.startsWith("login")) { // �α���
						System.out.println(msg);
						String[] tmpMsg = msg.split(":::");
						tmpMsg = tmpMsg[1].split(":");
						String userId = tmpMsg[0];
						this.userId = userId;
						String userPw = tmpMsg[1];
						int localPort = Integer.parseInt(tmpMsg[2]);
						if (um.login(userId + ":" + userPw)) {
							clientMap.put(userId, out);
							System.out.println(clientMap.get(userId));
							User loginUser = um.selectOneUser(userId);
							System.out.println(loginUser.getUserId() + ":" + loginUser.getUserPwd() + ":"
									+ loginUser.getUserName() + ":" + loginUser.getEmail() + ":" + loginUser.getCoin()
									+ ":" + loginUser.getProfile() + ":" + loginUser.getMusicSet() + ":"
									+ loginUser.getVictory() + ":" + loginUser.getAcceptQuest1() + ":"
									+ loginUser.getAcceptQuest2() + ":" + loginUser.getAcceptQuest3() + ":"
									+ loginUser.getQuestClear1() + ":" + loginUser.getQuestClear2() + ":"
									+ loginUser.getQuestClear3() + ":" + loginUser.getOwnItem1() + ":"
									+ loginUser.getOwnItem2());

							String msg2 = loginUser.getUserId() + ":" + loginUser.getUserPwd() + ":"
									+ loginUser.getUserName() + ":" + loginUser.getEmail() + ":" + loginUser.getCoin()
									+ ":" + loginUser.getProfile() + ":" + loginUser.getMusicSet() + ":"
									+ loginUser.getVictory() + ":" + loginUser.getAcceptQuest1() + ":"
									+ loginUser.getAcceptQuest2() + ":" + loginUser.getAcceptQuest3() + ":"
									+ loginUser.getQuestClear1() + ":" + loginUser.getQuestClear2() + ":"
									+ loginUser.getQuestClear3() + ":" + loginUser.getOwnItem1() + ":"
									+ loginUser.getOwnItem2() + ":" + localPort;
							sendLogin(msg2);
						} else {
							sendFailLogin();
						}

					} else if (msg.startsWith("createRoom")) { // ���ӹ����
						System.out.println(msg);
						createMultiRoom(msg);
					} else if (msg.startsWith("enterRoom")) { // ������
						System.out.println(msg);
						enterMultiRoom(msg);
					} else if (msg.startsWith("press")) { // ��ǥ
						// sendCoordinate(msg);
						sendPress(msg);
					} else if (msg.startsWith("released")) { // ��ǥ
						sendRelease(msg);
					} else if (msg.startsWith("exitRoom")) { // ���ӹ�����
						System.out.println(msg);
						exitRoom(msg);
					} else if (msg.startsWith("sendAllMsg")) { // ���ӹ�޼���
						System.out.println(msg);
						sendAllMsg(msg);
					} else if (msg.startsWith("signUp")) {
						sendSignUp(msg);
					} else if (msg.startsWith("sendMainRoomMsg")) {
						sendMainRoomMsg(msg);
					} else if (msg.startsWith("logOut")) {
						sendLogOut(msg);
					} else if (msg.startsWith("userInfo")) {
						sendUserInfo(msg);
					} else if (msg.startsWith("timer")) {
						sendTimer(msg);
					} else if (msg.startsWith("checkId")) {
						sendCheckId(msg);
					} else if (msg.startsWith("sendEmail")) {
						sendEmail(msg);
					} else if (msg.startsWith("changeIsDraw")) {
						sendChangeIsDraw(msg);
					} else if (msg.startsWith("findId")) {
						sendFindId(msg);
					} else if (msg.startsWith("chosung")) {
						sendchosung(msg);
					}else if(msg.startsWith("repaint")) {
						sendRepaint(msg);
					}
					
				} // while()---------
			} catch (SocketException e) {
				clientMap.remove(userId);
				System.out.println(userId + "님이 로그아웃했습니다.");
			} catch (ArrayIndexOutOfBoundsException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}// class MultiServerRec-------------
}
