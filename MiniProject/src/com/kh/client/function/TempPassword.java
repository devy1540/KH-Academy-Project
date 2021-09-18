package com.kh.client.function;

import java.util.UUID;

public class TempPassword {
	public String getTempPassword() {
		String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다.
		uuid = uuid.substring(0, 10); // uuid를 앞에서부터 10자리 잘라줌.
		System.out.println(uuid);
		return uuid;
	}
}