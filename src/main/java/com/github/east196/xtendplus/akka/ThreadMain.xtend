package com.github.east196.xtendplus.akka

import com.google.common.base.Stopwatch
import java.util.concurrent.TimeUnit
import java.util.concurrent.Callable
import java.util.concurrent.FutureTask

class ThreadMain {
	def static void main(String[] args) {
		val Runnable runnable = [ |
			println("Hello I’m executed!")
		]
		val Callable<String> callable = [ |
			println("Hello I’m executed!")
		]
		val task=new FutureTask(callable)
		val stopwatch = Stopwatch.createStarted()
		new Thread(runnable).start()
		(1 .. 1000000).forEach [ index |
			new Thread(task).start
		]
		stopwatch.stop
		println(
			'''ThreadSystem  Hello-Tung Cost  «stopwatch.elapsed(TimeUnit.MILLISECONDS)» ms ( is «stopwatch.
				elapsed(TimeUnit.NANOSECONDS)» ns )''')
	}
}
