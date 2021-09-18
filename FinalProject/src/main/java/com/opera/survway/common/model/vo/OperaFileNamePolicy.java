package com.opera.survway.common.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class OperaFileNamePolicy {
	public static String getRandomString() {
		long currentTime = System.currentTimeMillis();
		
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
		//32bit의 랜덤한 문자열을 생성해준다.
		return "Opera_" + ft.format(new Date(currentTime)) + UUID.randomUUID().toString().replace("-", "");
	}
}
