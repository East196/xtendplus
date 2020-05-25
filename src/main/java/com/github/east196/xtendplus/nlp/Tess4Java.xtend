package com.github.east196.xtendplus.nlp

import net.sourceforge.tess4j.Tesseract
import net.sourceforge.vietocr.ImageHelper

class Tess4Java {
	
	def static void main(String[] args) {
		System.out.println(System.getProperty("java.io.tmpdir"));
		System.out.println(System.getenv("TESSDATA_PREFIX"));//tess4j 环境变量
		var orgin = new Image("d:\\test\\pdf\\test10.png").getAsBufferedImage();
		var textImage = ImageHelper.convertImageToGrayscale(orgin);
		textImage = ImageHelper.getScaledInstance(textImage, textImage.getWidth() * 5, textImage.getHeight() * 5);
		var instance = Tesseract.getInstance(); // JNA Interface Mapping 
		instance.setLanguage("chi_sim");
		System.out.println("instance done");
		var result = instance.doOCR(textImage);
		System.out.println(result);
	}

}
