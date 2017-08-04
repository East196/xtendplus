package com.github.east196.xtendplus.annotation

import org.eclipse.xtend.lib.macro.AbstractClassProcessor
import org.eclipse.xtend.lib.macro.Active
import org.eclipse.xtend.lib.macro.TransformationContext
import org.eclipse.xtend.lib.macro.declaration.MutableClassDeclaration
import org.slf4j.LoggerFactory
import org.slf4j.Logger

@Active(LogCompilationParticipant)
annotation Log {
}

class LogCompilationParticipant extends AbstractClassProcessor {

	override doTransform(MutableClassDeclaration clazz, extension TransformationContext ctx) {
		val logger = Logger.newTypeReference
		val loggerFactory = LoggerFactory.newTypeReference
		clazz.addField("log",
			[
				type = logger
				static = true
				final = true
				initializer = ['''«toJavaCode(loggerFactory)».getLogger(«clazz.simpleName».class)''']
			])
	}

}
