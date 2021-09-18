package com.kh.server.run;

import com.kh.server.view.MultiServer;

public class ServerRun {
	public static synchronized void main(String[] args) {
		MultiServer ms = new MultiServer();
		ms.init();
	}
}
