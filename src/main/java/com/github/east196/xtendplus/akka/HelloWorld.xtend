package com.github.east196.xtendplus.akka

import akka.actor.UntypedActor
import akka.actor.Props
import akka.actor.ActorSystem
import akka.actor.ActorRef
import akka.event.Logging

class HelloWorld extends UntypedActor {
	val log = Logging.getLogger(getContext().system(), this);

	override onReceive(Object message) throws Exception {
		if (message == Greeter.Msg.DONE) {
			log.info("DONE!");
			getContext().stop(getSelf());
		} else if(message=="me"){
			log.info("hello,tung!");
			unhandled(message);
		}else{
			unhandled(message);
		}
	}

	override preStart() {
		val greeter = getContext().actorOf(Props.create(Greeter), "greeter");
		greeter.tell(Greeter.Msg.GREET, getSelf());
	}

	def static void main(String[] args) {
		val system = ActorSystem.create("MySystem");
		val helloWorld = system.actorOf(Props.create(HelloWorld), "HelloWorld");
		helloWorld.tell("me", ActorRef.noSender())
	}
}

class Greeter extends UntypedActor {
	val log = Logging.getLogger(getContext().system(), this);

	enum Msg {
		GREET,
		DONE
	}

	override onReceive(Object message) throws Exception {
		if (message == Msg.GREET) {
			log.info("Hello World!");
			getSender().tell(Msg.DONE, getSelf());
		} else {
			unhandled(message);
		}
	}

}
