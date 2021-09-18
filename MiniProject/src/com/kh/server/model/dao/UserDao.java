package com.kh.server.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;

import com.kh.server.model.vo.User;

public class UserDao {

	public UserDao() {
	}

	public ArrayList<User> readUserList() {
		ObjectInputStream ois = null;
		ArrayList<User> list = null;

		try {
			ois = new ObjectInputStream(new FileInputStream("UserList.dat"));
			list = (ArrayList<User>) ois.readObject();
		} catch (FileNotFoundException e) {
			System.out.println("파일이 없습니다. 새로 생성합니다");
		} catch (ClassNotFoundException | IOException e) {
			e.printStackTrace();
		} finally {
			if (ois != null) {
				try {
					ois.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	public int addUserList(ArrayList<User> list) {
		ObjectOutputStream out = null;

		int result = 0;

		try {
			out = new ObjectOutputStream(new FileOutputStream("UserList.dat"));
			out.writeObject(list);
			out.flush();
			result++;
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
