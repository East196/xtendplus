package com.github.east196.xtendplus

import org.boon.Boon
import org.boon.Str
import org.boon.core.Conversions

class Pythonic {

	def static len(Object obj) {
		Boon.len(obj)
	}

	def static upper(String obj) {
		Str.upper(obj)
	}

	def static lower(String obj) {
		Str.lower(obj)
	}

	def static jsonify(Object obj) {
		Boon.toJson(obj)
	}

	def static <T> beanify(String obj, Class<T> klass) {
		Boon.fromJson(obj, klass)
	}

	def static <T> listify(String obj, Class<T> klass) {
		Boon.fromJsonArray(obj, klass)
	}

	def static o2date(Object obj) {
		Conversions.toDate(obj)
	}

	def static o2str(Object obj) {
		Conversions.toString(obj)
	}

	def static o2int(Object obj) {
		Conversions.toInt(obj)
	}

}
