//
//  PDFPreview.swift
//  dotThere
//
//  Created by 김한빛 on 7/21/24.
//

import SwiftUI
import PDFKit
import QuickLook

struct PDFPreview: UIViewControllerRepresentable {
    let url: URL
    let onSave: () -> Void
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let previewController = QLPreviewController()
        previewController.dataSource = context.coordinator
        
        let navigationController = UINavigationController(rootViewController: previewController)
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: context.coordinator, action: #selector(Coordinator.savePDF))
        previewController.navigationItem.rightBarButtonItem = saveButton
        
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(url: url, onSave: onSave)
    }
    
    class Coordinator: NSObject, QLPreviewControllerDataSource {
        let url: URL
        let onSave: () -> Void
        
        init(url: URL, onSave: @escaping () -> Void) {
            self.url = url
            self.onSave = onSave
        }
        
        @objc func savePDF() {
            onSave()
        }
        
        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }
        
        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            return url as QLPreviewItem
        }
    }
}
