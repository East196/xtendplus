package com.github.east196.xtendplus

import java.util.Map
import java.util.Map.Entry
import java.util.Set
import org.boon.Sets
import org.boon.core.reflection.BeanUtils
import org.boon.core.reflection.Reflection
import org.boon.core.reflection.fields.FieldAccess
import org.eclipse.xtend.lib.annotations.Data

class Merger {

	def static <T> T mergeNotNullToFirst(Class<T> destKlass, Object... srcs) {
		var T dest = Reflection::newInstance(destKlass)
		return Merger.mergeNotNullToFirstUnSafe(dest, srcs)
	}

	def static <T> T mergeNotNullToFirst(T template, Object... srcs) {
		var T dest = BeanUtils::copy(template)
		return Merger.mergeNotNullToFirstUnSafe(dest, srcs)
	}

	def static <T> T mergeNotNullToFirstUnSafe(T dest, Object... srcs) {
		for (Object src : srcs) {
			var Set<String> ignores = Sets::set()
			var Map<String, FieldAccess> fieldMap = BeanUtils::getFieldsFromObject(src)
			for (Entry<String, FieldAccess> entry : fieldMap.entrySet()) {
				System::out.println(entry)
				if (entry.getValue().getObject(src) === null) {
					ignores.add(entry.getKey())
				}
			}
			BeanUtils::copyProperties(src, dest, ignores)
		}
		return dest
	}

	def static <T> T mergeToFirst(T template, Object... srcs) {
		var T dest = BeanUtils::copy(template)
		for (Object src : srcs) {
			BeanUtils::copyProperties(src, dest)
		}
		return dest
	}
	
	def static void main(String[] args) {
		val zd=new Person("zd","",1)
		val bx=new Person("bx","sz",0)
		Merger.mergeToFirst(zd,bx)
		println(zd)
		zd.mergeNotNullToFirst(bx)
		println(zd)
	}
	
	
	
	@Data
	static class  Person{
		String name
		String address
		Integer sex
	}
}
