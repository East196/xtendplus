package com.github.east196.xtendplus.think

import java.io.File

class DirList {
	def static void main(String[] args) {
		var path=new File(".")
		var list=path.list()
		for(dirItem :list){
			println(dirItem)
		}
		
		println(new File(".").listFiles.toList)
	}
}
