package com.opera.survway.common.model.vo;

import java.util.Random;

public class GenerateCertPassword {
	private int pwdLength = 20;
	private final char[] passwordTable = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
			'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
			'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '!', '@', '#', '$', '%',
			'^', '&', '*', '(', ')', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };

	public String excuteGenerate() {
		Random random = new Random(System.currentTimeMillis());
		int tablelength = passwordTable.length;
		String check = "";

		for (int i = 0; i < pwdLength; i++) {
			check += passwordTable[random.nextInt(tablelength)];
		}

		return check;
	}

	public int getPwdLength() {
		return pwdLength;
	}

	public void setPwdLength(int pwdLength) {
        this.pwdLength = pwdLength;
    }
}
