package com.github.east196.xtendplus

import com.typesafe.config.Config
import com.typesafe.config.ConfigFactory

/** 
 * Hello world!
 */
class ConfigApp {
	def static void main(String[] args) {
		var Config config = ConfigFactory.load()
		System.out.println('''«config.getString("hello.txt")» «config.getString("world.txt")»''')
		System.out.
			println('''«config.getString("hello.mongo")» «config.getString("hello.mysql")» «config.getString("hello.redis")»''')
	}
	
	
}
