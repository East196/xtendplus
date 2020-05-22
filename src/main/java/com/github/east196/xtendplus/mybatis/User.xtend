package com.github.east196.xtendplus.mybatis


interface UserMapper {
	def User findById(String Id)

}

class User {
	String name
	Integer age

	def String getName() {
		return name
	}

	def void setName(String name) {
		this.name = name
	}

	def Integer getAge() {
		return age
	}

	def void setAge(Integer age) {
		this.age = age
	}

	new() {
	}

	new(String name, Integer age) {
		this.name = name
		this.age = age
	}

	override int hashCode() {
		val int prime = 31
		var int result = 1
		result = prime * result + (if((age === null)) 0 else age.hashCode() )
		result = prime * result + (if((name === null)) 0 else name.hashCode() )
		return result
	}

	override boolean equals(Object obj) {
		if(this === obj) return true
		if(obj === null) return false
		if(getClass() !== obj.getClass()) return false
		var User other = obj as User
		if (age === null) {
			if(other.age !== null) return false
		} else if(!age.equals(other.age)) return false
		if (name === null) {
			if(other.name !== null) return false
		} else if(!name.equals(other.name)) return false
		return true
	}

	override String toString() {
		return '''User [name=«name», age=«age»]'''
	}

}
