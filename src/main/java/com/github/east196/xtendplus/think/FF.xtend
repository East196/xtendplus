package com.github.east196.xtendplus.think

class FF {
	def static void main(String[] args) {
		var ff=fblc(0)
		println(ff)
	}
	
	def static long fblc(int n){
		switch n{
			case n==0||n==1:1
			default: fblc(n-1)+fblc(n-2)
		}
	}
	
}
