package com.github.east196.xtendplus.annotation

import org.eclipse.xtend.lib.macro.AbstractFieldProcessor
import org.eclipse.xtend.lib.macro.Active
import org.eclipse.xtend.lib.macro.TransformationContext
import org.eclipse.xtend.lib.macro.declaration.MutableFieldDeclaration
import org.eclipse.xtend.lib.macro.declaration.Visibility

@Active(LazyCompilationParticipant)
annotation Lazy {
}

class LazyCompilationParticipant extends AbstractFieldProcessor {

	override doTransform(MutableFieldDeclaration field, extension TransformationContext ctx) {
		if (field.type.primitive)
			field.addError("Fields with primitives are not supported by @Lazy")
		if (field.initializer == null)
			field.addError("A lazy field must have an initializer.")

		//添加虚构的 init-method
		field.declaringType.addMethod('init' + field.simpleName.toFirstUpper) [
			visibility = Visibility.PRIVATE
			returnType = field.type
			body = field.initializer
		]

		field.declaringType.addMethod('get' + field.simpleName.toFirstUpper) [
			returnType = field.type
			body = [
				'''
					if («field.simpleName»==null)
					«field.simpleName» = init«field.simpleName.toFirstUpper»();
					return «field.simpleName»;
				''']
		]
	}

}
