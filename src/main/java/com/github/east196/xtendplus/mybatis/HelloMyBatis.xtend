package com.github.east196.xtendplus.mybatis

import java.io.IOException
import org.apache.ibatis.io.Resources
import org.apache.ibatis.session.SqlSession
import org.apache.ibatis.session.SqlSessionFactory
import org.apache.ibatis.session.SqlSessionFactoryBuilder

/** 
 * myBatis数据库连接测试 
 * @author db2admin 
 */
class HelloMyBatis {
	/** 
	 * 获得MyBatis SqlSessionFactory   
	 * SqlSessionFactory负责创建SqlSession，一旦创建成功，就可以用SqlSession实例来执行映射语句，commit，rollback，close等方法。 
	 * @return 
	 */
	def private static SqlSessionFactory getSessionFactory() {
		var SqlSessionFactory sessionFactory = null
		var String resource = "mybatis/configuration.xml"
		try {
			sessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader(resource))
		} catch (IOException e) {
			// TODO Auto-generated catch block  
			e.printStackTrace()
		}
		return sessionFactory
	}

	def static void main(String[] args) {
		var SqlSession sqlSession = getSessionFactory().openSession()
		var UserMapper userMapper = sqlSession.getMapper(UserMapper)
		var User user = userMapper.findById("1")
		System.out.println(user)
	}

}
