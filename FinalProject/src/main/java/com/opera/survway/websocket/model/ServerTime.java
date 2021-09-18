package com.opera.survway.websocket.model;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.util.*;

public class ServerTime extends TextWebSocketHandler{
	static Boolean runCheck = false;

	private static Logger logger = LoggerFactory.getLogger(ServerTime.class);
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		//logger.info("{} 세션 연결", session.getId());
		if(runCheck == false) {
			TimerTask task = new TimerTask() {

				@Override
				public void run() {
					Iterator<WebSocketSession> itr = sessionList.iterator();
					while(itr.hasNext()) {
						WebSocketSession session = itr.next();
						Calendar cal = Calendar.getInstance();
						
						String amPm = "";
						if(cal.get(Calendar.AM_PM) == 0) {
							amPm = "오전";
						}else if(cal.get(Calendar.AM_PM) == 1) {
							amPm = "오후";
						}
						
						int hour24 = 0;
						if(cal.get(Calendar.AM_PM) == 0) {
							hour24 = cal.get(Calendar.HOUR);
						}else {
							hour24 = cal.get(Calendar.HOUR) + 12;
						}
						
						String hour = "";
						if(hour24 < 10) {
							hour = "0" + hour24;
						}else {
							hour = "" + hour24;
						}
						
						if(Integer.parseInt(hour) > 12) {
							hour = Integer.toString(Integer.parseInt(hour) - 12);
						}
						String min = "";
						if(cal.get(Calendar.MINUTE) < 10) {
							min = "0" + cal.get(Calendar.MINUTE);
						}else {
							min = "" + cal.get(Calendar.MINUTE);
						}
						
						String sec = "";
						if(cal.get(Calendar.SECOND) < 10) {
							sec = "0" + cal.get(Calendar.SECOND);
						}else {
							sec = "" + cal.get(Calendar.SECOND);
						}
						int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
						String dayWeek = "";
						switch(dayOfWeek){
							case 1: dayWeek = "일"; break ;
							case 2: dayWeek = "월"; break ;
							case 3: dayWeek = "화"; break ;
							case 4: dayWeek = "수"; break ;
							case 5: dayWeek = "목"; break ;
							case 6: dayWeek = "금"; break ;
							case 7: dayWeek = "토"; break ;
						}
						
						String day = cal.get(Calendar.YEAR) + "년 " + (cal.get(Calendar.MONTH) + 1) + "월 " + cal.get(Calendar.DATE) + "일 (" + dayWeek + ")";
						String time = amPm + " " + hour + ":" + min + ":" + sec;
						
						//System.out.println(time);
						
						for (WebSocketSession sess : sessionList) {
							try {
								sess.sendMessage(new TextMessage(day + "/" + time));
							} catch (IOException e) {
								e.printStackTrace();
							}
						}
					}
				}
			};
			runCheck = true;
			Timer timer = new Timer(true);
			timer.scheduleAtFixedRate(task, 0, 1*1000);
		}
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		//logger.info("{} 연결 끊김", session.getId());
	}
}
