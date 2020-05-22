package com.github.east196.xtendplus.boon

import org.boon.Boon

class BoonDemo {
	/* */
	def static void main(String[] args) {
		jstl
		handlebars
	}
/**
 * 
 */
	def static jstl() {
		val json = '''{"clazzName":"SqlGroup","fields":[{"type":"String","name":"name"},{"type":"List<SqlItem>","name":"items"}]}'''
		val context = Boon.fromJson(json)
		//
		val template = '''
			class ${clazzName} {
				<c:forEach items="fields">
				  ${item.type} ${item.name}
				</c:forEach>
			}
		'''
		val result = Boon.jstl(template, context)
		println(result)
	}
	def static handlebars() {
		val json = '''{"clazzName":"SqlGroup","fields":[{"type":"String","name":"name"},{"type":"List<SqlItem>","name":"items"}]}'''
		val context = Boon.fromJson(json)
		//
		val template = '''
			class {{clazzName}} {
				{{#forEach items="fields"}}
				  {{item.type}} {{item.name}}
				{{/forEach}}
			}
		'''
		val result = Boon.handlebars(template, context)
		println(result)
	}

}
