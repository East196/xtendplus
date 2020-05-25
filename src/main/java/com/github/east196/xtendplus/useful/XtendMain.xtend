package com.github.east196.xtendplus.useful

import org.springframework.beans.factory.annotation.Autowired

class XtendMain {
	
	// 生成代码的性质决定了可以使用@Autowired等注解,but名字变了,所以最好用类型注入
	// 考虑和spring的结合
	@Autowired
	extension AgePersistence=new AgePersistenceImpl();

	def dosomthing(){
		var age = new Age();
		age.save
		age.update
		age.delete
	}
	
	def static void main(String[] args) {
		new XtendMain().dosomthing
	}
	

}

interface AgePersistence {
	def void save(Age e)

	def void update(Age e)

	def void delete(Age e)
}

class AgePersistenceImpl implements AgePersistence{
	override void save(Age e) {
		println("save")
	}

	override void update(Age e) {
		println("update")
	}

	override void delete(Age e) {
		println("delete")
	}
}
