//
//  PDFCreator.swift
//  dotThere
//
//  Created by 김한빛 on 7/21/24.
//

import SwiftUI
import PDFKit

class PDFCreator {
    static func createPDF(view: UIView) -> URL? {
        let format = UIGraphicsPDFRendererFormat()
        let page = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        let renderer = UIGraphicsPDFRenderer(bounds: page, format: format)
        
        let data = renderer.pdfData { context in
            context.beginPage()
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let pdfPath = documentsPath.appendingPathComponent("DetailView.pdf")
        
        do {
            try data.write(to: pdfPath)
            return pdfPath
        } catch {
            print("Could not save PDF: \(error)")
            return nil
        }
    }
}


