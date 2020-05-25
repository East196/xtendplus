package com.github.east196.xtendplus.nlp

import com.google.common.base.CaseFormat
import com.google.common.base.CharMatcher
import java.util.List

class Words {
	
	def static void main(String[] args) {
		println(similarity("HelloWorld","hellowerld"))
	}
	

	def static similarity(String firstWords, String secondWords) {
		if(firstWords.equalsIgnoreCase(secondWords)) return 1
		var firsts = list(firstWords)
		var seconds = list(secondWords)
		if(listEquals(firsts, seconds)) return 1
		listSimilarity(firsts, seconds)
	}

	def static listSimilarity(List<String> firsts, List<String> seconds) {
		var listSimilarity = 0.0
		for (first : firsts) {
			listSimilarity += wordSimilarity(first, seconds)*1.0 / firsts.size
			
		}
		listSimilarity
	}

	def static wordSimilarity(String first, List<String> seconds) {
		var wordSimilarityAndIndex = 0 -> -1
		for (second : seconds) {
			var wordSimilarity = wordSimilarity(first, second)
			var index = seconds.indexOf(second)
			wordSimilarityAndIndex = wordSimilarity -> index
		}
		wordSimilarityAndIndex.key
	}

	def static wordSimilarity(String first, String second) {
		if(first.equalsIgnoreCase(second)) return 1
		val firstChars =first.toCharArray.map[it]
		var orginSize = firstChars.size
		firstChars.retainAll(second.toCharArray)
		var newSize = firstChars.size
		newSize/orginSize
	}

	def static listEquals(List<String> firsts, List<String> seconds) {
		var orginSize = firsts.size
		val newFirsts = newArrayList(firsts.toArray)
		newFirsts.retainAll(seconds.toArray)
		var newSize = newFirsts.size
		return orginSize == newSize
	}

	def static List<String> list(String words) {
		var newWords=words
		if (CharMatcher.JAVA_UPPER_CASE.countIn(words) > 0) {
			newWords=CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, words.toFirstUpper)
		}
		if(newWords.contains("-")) newWords.replace('-', '_')
		newWords.split('_').toList
	}

}
