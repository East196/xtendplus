package com.github.east196.xtendplus.poi

import java.util.List
import org.jeecgframework.poi.excel.annotation.Excel
import org.jeecgframework.poi.excel.annotation.ExcelCollection
import org.jeecgframework.poi.excel.annotation.ExcelEntity
import org.jeecgframework.poi.excel.annotation.ExcelTarget
import org.jeecgframework.poi.excel.annotation.ExcelVerify
import java.io.Serializable

@ExcelTarget("courseEntity") class CourseEntity implements java.io.Serializable {
	/** 
	 * 主键 
	 */
	String id
	/** 
	 * 课程名称 
	 */
	@Excel(name="课程名称", orderNum="1", needMerge=true) String name
//	/** 
//	 * 老师主键 
//	 */
//	@ExcelEntity(id="yuwen") @ExcelVerify() TeacherEntity teacher
//	/** 
//	 * 老师主键 
//	 */
//	@ExcelEntity(id="shuxue") TeacherEntity shuxueteacher
//	@ExcelCollection(name="选课学生", orderNum="4") List<StudentEntity> students


}

class StudentEntity {
}

class TeacherEntity {
}


