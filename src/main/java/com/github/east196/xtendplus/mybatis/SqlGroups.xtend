package com.github.east196.xtendplus.mybatis

import java.util.List
import java.util.Map
import org.boon.Boon
import org.boon.IO

class SqlGroups {
	val static Map<String, Pair<String, String>> map = sqlMaps()

	def static sql(String id) {
		map.get(id).value
	}

	def static sqlMaps() {
		init().map[sqlGroup|sqlGroup.items.map[item|item.id -> item.value].toList].reduce[pairs, otherPairs|
			pairs.addAll(otherPairs); return pairs].toMap[pair|pair.key]
	}

	def static List<SqlGroup> init() {
		Boon.fromJsonArray(IO.readResource("json/SqlGroup.json"), SqlGroup)
	}

	def static void main(String[] args) {
		println(SqlGroups.sql("User.show"))
	}

}
