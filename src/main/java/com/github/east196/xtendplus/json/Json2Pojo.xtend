package com.github.east196.xtendplus.json

import com.fasterxml.jackson.databind.ObjectMapper
import com.sun.codemodel.JCodeModel
import java.io.File
import java.io.IOException
import java.util.Date
import org.jsonschema2pojo.DefaultGenerationConfig
import org.jsonschema2pojo.GsonAnnotator
import org.jsonschema2pojo.Jackson2Annotator
import org.jsonschema2pojo.Schema
import org.jsonschema2pojo.SchemaGenerator
import org.jsonschema2pojo.SchemaStore
import org.jsonschema2pojo.SourceType
import org.jsonschema2pojo.rules.RuleFactory

class Json2Pojo {
	def static void main(
		String[] args) {
		var json = '''{"ass_bs":"1111","b":111111111111111111111,"aaaa":{"s":11,"aaa11a":"«new Date()»"},"bbbb":[1,2,3,4]}'''
		var jsonlib = "gson"
		val root = '''E:\workspace\github\east196\java\maker\maker'''
		var packageName = "com.example"
		var className = "ClassName"
		json2pojo(json, jsonlib, root, packageName, className)
	}

	def static json2pojo(String json, String jsonlib, String root, String packageName, String className) {
		var destDir = new File(root) // 代码生成的目录
		var JCodeModel codeModel = new JCodeModel()
		var config = new DefaultGenerationConfig() {
			override boolean isGenerateBuilders() {
				return true
			}

			override SourceType getSourceType() {
				return SourceType.JSON;
			}

			def boolean isUseCommonsLang3() {
				return true;
			}
		}
		val schemaGenerator = new SchemaGenerator()
		val annotator = if("gson".equals(jsonlib)) new GsonAnnotator(config) else new Jackson2Annotator(config)
		val ruleFactory = new RuleFactory(
			config,
			annotator,
			new SchemaStore()
		)
		try {
			val content = new ObjectMapper().readTree(json);
			val jpackage = codeModel._package(packageName);
			val schemaNode = schemaGenerator.schemaFromExample(content);
//			ruleFactory.getSchemaRule().apply(className, schemaNode, jpackage, new Schema(null, schemaNode));
			println(codeModel.rootPackage.name)
			codeModel.build(destDir)
		} catch (IOException e) {
			e.printStackTrace()
		}
	}
}
