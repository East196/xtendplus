package com.github.east196.xtendplus.poi

import java.io.File
import java.io.FileOutputStream
import java.util.ArrayList
import java.util.List
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.ss.usermodel.Workbook
import org.jeecgframework.poi.excel.ExcelExportUtil
import org.jeecgframework.poi.excel.entity.ExportParams
import org.jeecgframework.poi.excel.entity.enmus.ExcelType
import org.jeecgframework.poi.excel.entity.params.ExcelExportEntity
import java.util.Map
import java.util.HashMap

class App {
	def static void main(String[] args) {
		var List<ExcelExportEntity> entity = new ArrayList<ExcelExportEntity>()
		entity.add(new ExcelExportEntity("姓名", "name"))
		entity.add(new ExcelExportEntity("性别", "sex"))
		var List<Map<String, String>> list = new ArrayList<Map<String, String>>()
		var Map<String, String> map
		for (var int i = 0; i < 10; i++) {
			map = new HashMap<String, String>()
			map.put("name", '''1«i»''')
			map.put("sex", '''2«i»''')
			list.add(map)
		}
		
		var Workbook workbook = null
		workbook = ExcelExportUtil.exportExcel(new ExportParams("测试1", "测试2", ExcelType.HSSF), entity,
			list) as HSSFWorkbook
		Pois.write(workbook, "d://a.xls")
//		workbook = ExcelExportUtil.exportExcel(new ExportParams("测试1", "测试2", ExcelType.XSSF), entity,
//			list) as XSSFWorkbook
//		Pois.write(workbook, "d://a.xlsx")
	}
}

class Pois {
	

	def static write(Workbook workbook, String path) {
		val FileOutputStream fos = new FileOutputStream(new File(path))
		workbook.write(fos)
	}

}
