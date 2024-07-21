//
//  DetailView.swift
//  dotThere
//
//  Created by 김한빛 on 7/19/24.
//

import SwiftUI
import PDFKit
import QuickLook

struct DetailView: View {
    
    @State private var pdfURL: URL? = nil
    @State private var showPDFPreview = false
    
    @State private var isExpandedText: Bool = false
    
    var body: some View {
        ZStack {
            Color(.basic)
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 26) {
                    PostView(isExpandedText: $isExpandedText)
                    OtherView(exportAction: exportToPDF)
                    MapView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func exportToPDF() {
        isExpandedText = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let hostingController = UIHostingController(rootView: pdfView)
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let window = windowScene.windows.first else {
                return
            }
            
            let view = hostingController.view
            view?.frame = window.bounds
            
            if let url = PDFCreator.createPDF(view: view!) {
                pdfURL = url
                print("PDF URL: \(url)")
                savePDF(url: url)
            }
        }
    }
    
    var pdfView: some View {
        ZStack {
            Color(.basic)
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 26) {
                    PostView(isExpandedText: $isExpandedText)
                    MapView()
                }
            }
        }
    }
    
    func savePDF(url: URL) {
        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }
        window.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
}

#Preview {
    NavigationStack {
        DetailView()
    }
    .accentColor(.black)
    .background(.basic)
}
