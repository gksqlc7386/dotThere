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
    
    var body: some View {
        ZStack {
            Color(.basic)
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 26) {
                    PostView()
                    OtherView(exportAction: exportToPDF)
                    MapView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func exportToPDF() {
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
    
    var pdfView: some View {
        ZStack {
            Color(.basic)
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 26) {
                    PostView()
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
