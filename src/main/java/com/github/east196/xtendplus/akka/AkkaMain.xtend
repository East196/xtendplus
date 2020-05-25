package com.github.east196.xtendplus.akka

import akka.actor.ActorSystem
import scala.Serializable
import akka.event.Logging
import akka.actor.UntypedActor
import akka.actor.Props
import akka.actor.ActorRef
import com.google.common.base.Stopwatch
import java.util.concurrent.TimeUnit

//官网示例
class Greeting implements Serializable {
	public final String who

	new(String who) {
		this.who = who
	}
}

class GreetingActor extends UntypedActor {
	val log = Logging.getLogger(getContext().system(), this)

	override onReceive(Object message) throws Exception {
		if (message instanceof Greeting) {
			log.info('''Hello «(message as Greeting).who»''')
		}
	}
}

class AkkaMain {
	def static void main(String[] args) {
		val stopwatch = Stopwatch.createStarted();
		val system = ActorSystem.create("Hello-Tung") //耗时操作，可以在系统初始化时完成
		val greeter = system.actorOf(Props.create(GreetingActor), "greeter")
		greeter.tell(new Greeting("Tung Out Room"), ActorRef.noSender())
		(1 .. 10).forEach [ index |
			val in = system.actorOf(Props.create(GreetingActor), "greeter" + index)
			in.tell(new Greeting("Tung In Room" + index), ActorRef.noSender())
		]
		stopwatch.stop
		println(
			'''ActorSystem  Hello-Tung Cost  «stopwatch.elapsed(TimeUnit.MILLISECONDS)» ms ( is «stopwatch.
				elapsed(TimeUnit.NANOSECONDS)» ns )''')

	}
}
