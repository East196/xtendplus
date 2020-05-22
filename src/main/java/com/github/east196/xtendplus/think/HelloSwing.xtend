package com.github.east196.xtendplus.think

import javax.swing.JFrame
import java.awt.Dimension
import javax.swing.JLabel
import java.util.concurrent.TimeUnit

class HelloSwing {
	
	def static void main(String[] args) {
		var frame = new JFrame("Hello Swing")
		frame.defaultCloseOperation = JFrame.EXIT_ON_CLOSE
		frame.size = new Dimension(300, 100)
		frame.visible = true
	}

}

class HelloLabel {
	
	def static void main(String[] args) {
		var frame = new JFrame("Hello Swing")
		var label =new JLabel("A label")
		frame.add(label)
		frame.defaultCloseOperation = JFrame.EXIT_ON_CLOSE
		frame.size = new Dimension(300, 100)
		frame.visible = true
		TimeUnit.SECONDS.sleep(1)
		label.text ="Hey! This is Different!"
	}

}
