package com.github.east196.xtendplus.mybatis

import org.eclipse.xtend.lib.annotations.Data

@Data
class SqlItem {
	String id
	String value


	new(String id, String value) {
		this.id = id
		this.value = value
	}


}
