package com.github.east196.xtendplus

import org.boon.core.reflection.BeanUtils
import org.eclipse.xtend.lib.annotations.Data

final class Cukes {
	private new(){}
	
	def static toCukeValues(Object object){
			val fieldMap = BeanUtils.getFieldsFromObject(object)
			val values=fieldMap.entrySet().map[it.value.getObject(object)].join('\t | ')
			'''| «values»«'\t'» |'''
	} 
	
		def static toCukeKeys(Object object){
			val fieldMap = BeanUtils.getFieldsFromObject(object)
			val values=fieldMap.entrySet().map[it.value.field.name].join('\t | ')
			'''| «values»«'\t'» |'''
	} 
	
	def static void main(String[] args) {
		val pair=new Person("abc",1111)
		println(pair.toCukeKeys)
		println(pair.toCukeValues)
	}
	
	@Data
	static class  Person{
		String name
		Integer sex
	}
	
	
}
