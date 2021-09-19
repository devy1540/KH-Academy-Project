package com.kh.server.model.vo;

import java.io.File;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Clip;
import javax.sound.sampled.DataLine;
import javax.swing.JFrame;

public class MediaTest {
	static Clip clip;

	public static void musicOn(int i, boolean b) {
		File bgm, bgm2;
		AudioInputStream stream;
		AudioFormat format;
		DataLine.Info info;
		JFrame mf = new JFrame();
		String[] bgmarr = new String[3];
		bgmarr[0] = "bgm/CatchMind1.wav";
		bgmarr[1] = "bgm/CatchMind2.wav";
		bgmarr[2] = "bgm/CatchMind3.wav";
		if (b) {
			try {
				bgm = new File(bgmarr[i]);
				stream = AudioSystem.getAudioInputStream(bgm);
				format = stream.getFormat();
				info = new DataLine.Info(Clip.class, format);
				clip = (Clip) AudioSystem.getLine(info);
				clip.open(stream);
				clip.start();
				clip.loop(-1);
			} catch (Exception e) {
				System.out.println("err : " + e);
			}
		} else {
			clip.stop();
			clip.close();
		}
	}

	public static void musicOff() {
		clip.stop();
		clip.close();
	}

}