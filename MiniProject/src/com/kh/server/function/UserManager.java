
package com.kh.server.function;

import java.util.ArrayList;

import com.kh.client.function.TempPassword;
import com.kh.client.model.vo.ClientUser;
import com.kh.server.model.dao.UserDao;
import com.kh.server.model.vo.User;

public class UserManager {
	private UserDao ud = new UserDao();

	public ArrayList<User> readAllUser() {
		ArrayList<User> list = ud.readUserList();
		return list;

	}

	public void userDelete(String str) {

		ArrayList<User> list = ud.readUserList();

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getUserId().equals(str)) {
				list.remove(i);
				ud.addUserList(list);
			}
		}

	}

	public void userCor(String str, String Nid, String Nname, String Nemail) {
		ArrayList<User> list = ud.readUserList();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getUserId().equals(str)) {
				list.get(i).setUserId(Nid);
				list.get(i).setUserName(Nname);
				list.get(i).setEmail(Nemail);
				ud.addUserList(list);
			}
		}

	}

	public void createUser(String str) {
		String[] tmpMsg = str.split(",/");

		String userId = tmpMsg[0];
		String userPw = tmpMsg[1];
		String userName = tmpMsg[2];
		String userEmail = tmpMsg[3];
		int userCoin = Integer.parseInt(tmpMsg[4]);
		String userImgName = tmpMsg[5];
		boolean userProfile = Boolean.parseBoolean(tmpMsg[6]);
		boolean userMusicSet = Boolean.parseBoolean(tmpMsg[7]);
		int userVictory = Integer.parseInt(tmpMsg[8]);
		int userItem1 = Integer.parseInt(tmpMsg[9]);
		int userItem2 = Integer.parseInt(tmpMsg[10]);
		boolean userTempPwd = Boolean.parseBoolean(tmpMsg[11]);
		boolean userAcceptQuest1 = Boolean.parseBoolean(tmpMsg[12]);
		boolean userAcceptQuest2 = Boolean.parseBoolean(tmpMsg[13]);
		boolean userAcceptQuest3 = Boolean.parseBoolean(tmpMsg[14]);
		boolean userQuestClear1 = Boolean.parseBoolean(tmpMsg[15]);
		boolean userQuestClear2 = Boolean.parseBoolean(tmpMsg[16]);
		boolean userQusetClear3 = Boolean.parseBoolean(tmpMsg[17]);

		User u = new User(userId, userPw, userName, userEmail, userCoin, userImgName, userProfile, userMusicSet,
				userVictory, userItem1, userItem2, userTempPwd, userAcceptQuest1, userAcceptQuest2, userAcceptQuest3,
				userQuestClear1, userQuestClear2, userQusetClear3);

		updateUser(u);
	}

	public boolean login(String str) {
		ArrayList<User> list = ud.readUserList();
		String[] user = str.split(":");
		String userId = user[0];
		String userPwd = user[1];

		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getUserName().equals(userId) && list.get(i).getUserPwd().equals(userPwd)) {
					return true;
				}
			}
		}

		return false;
	}

	public synchronized boolean checkId(String str) {
		ArrayList<User> list = ud.readUserList();
		User u = selectOneUser(str);
		if (u == null) {
			return true;
		} else {
			return false;
		}
	}

	public synchronized boolean signUp(String str) {
		User u = null;

		String[] user = str.split(":");

		String userId = user[0];
		String userPwd = user[1];
		String userName = user[2];
		String email = user[3];

		u = new User(userId, userPwd, userName, email);

		return insertUser(u);
	}

	public synchronized boolean insertUser(User u) {
		ArrayList<User> list = ud.readUserList();

		if (list == null) {
			list = new ArrayList<User>();
		}
		list.add(u);

		int result = ud.addUserList(list);

		if (result > 0) {
			System.out.println("유저 추가 성공");
			return true;
		} else {
			System.out.println("유저 추가 실패");
			return false;
		}
	}

	public void updateUser(User u) {
		ArrayList<User> list = ud.readUserList();

		if (list == null) {
			list = new ArrayList<User>();
		} else {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getUserId().equals(u.getUserId())) {
					list.remove(i);
					list.add(u);
					break;
				}
			}
		}

		int result = ud.addUserList(list);

		if (result > 0) {
			System.out.println("유저 정보 수정 성공");
		} else {
			System.out.println("유저 정보 수정 실패");
		}
	}

	public void updateUser(ClientUser u) {
		ArrayList<User> list = ud.readUserList();

		if (list == null) {
			list = new ArrayList<User>();
		}
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getUserId().equals(u.getUserId())) {
				list.remove(i);
				break;
			}
		}

		int result = ud.addUserList(list);

		if (result > 0) {
			System.out.println("유저 정보 수정 성공");
		} else {
			System.out.println("유저 정보 수정 실패");
		}
	}

	public User selectOneUser(String userId) {
		ArrayList<User> list = ud.readUserList();
		User selectedUser = null;

		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getUserId().equals(userId)) {
					selectedUser = list.get(i);
					break;
				}
			}
		}
		if (selectedUser == null) {
			System.out.println("해당 아이디가 없습니다.");
		} else {
			return selectedUser;
		}

		return null;
	}

	public boolean DuplicateCheck(String userId) {
		ArrayList<User> list = ud.readUserList();

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getUserId().equals(userId)) {
				return true;

			}
		}

		return false;
	}

	public String FindId(String email) {
		ArrayList<User> list = ud.readUserList();

		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getEmail().equals(email)) {
					return list.get(i).getUserId();
				}
			}
		}
		return null;
	}

	public boolean findPwd(String userId, String email) {
		ArrayList<User> list = ud.readUserList();

		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getUserId().equals(userId)) {
					if (list.get(i).getEmail().equals(email)) {

						User u = selectOneUser(userId);
						System.out.println(u.toString());
						System.out.println(userId);
						System.out.println(email);
						TempPassword tp = new TempPassword();
						String tmpPwd = tp.getTempPassword();
						Smtptest.gmailSend(email, tmpPwd);
						u.setUserPwd(tmpPwd);
						u.setTempPwd(true);
						System.out.println(u.getTempPwd());
						updateUser(u);
						return true;
					}
				}
			}
		}
		return false;
	}
}