package com.github.east196.xtendplus.mybatis

import java.util.List
import org.eclipse.xtend.lib.annotations.Data

@Data
class SqlGroup {
	String name
	List<SqlItem> items


	new(String name, List<SqlItem> items) {
		this.name = name
		this.items = items
	}



}
