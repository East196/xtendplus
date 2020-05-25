package com.github.east196.xtendplus.nlp

import java.io.File
import java.io.FileOutputStream
import javax.imageio.IIOImage
import javax.imageio.ImageIO
import javax.imageio.ImageWriter
import org.apache.pdfbox.pdmodel.PDDocument
import org.apache.pdfbox.pdmodel.PDPage

class Pdfs {
	def static void main(String[] args) {
		
		
		
		
	}
	
	def static pdf2png() {
		var doc = PDDocument.load("d:\\test\\test.pdf")
		var pageCount = doc.getNumberOfPages()
		System.out.println(pageCount)
		System.out.println("start")
		var pages = doc.getDocumentCatalog().getAllPages()
		for (var i = 0; i < pages.size(); i++) {
			var page = pages.get(i) as PDPage
			var image = page.convertToImage()
			var iter = ImageIO.getImageWritersBySuffix("png")
			var ImageWriter writer = iter.next()
			var outFile = new File("d:\\test\\pdf\\test" + i + ".png")
			var out = new FileOutputStream(outFile)
			var outImage = ImageIO.createImageOutputStream(out)
			writer.setOutput(outImage)
			writer.write(new IIOImage(image, null, null))
		}
		doc.close()
		System.out.println("end")
	}

}
