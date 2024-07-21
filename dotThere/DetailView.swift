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
            .navigationBarItems(trailing: Button("Save PDF") {
                exportToPDF()
            })
        }
        .sheet(isPresented: $showPDFPreview) {
            if let url = pdfURL {
                PDFPreview(url: url, onSave: savePDF)
            }
        }
    }
    
    func exportToPDF() {
        let hostingController = UIHostingController(rootView: contentView)
        let view = hostingController.view
        let window = UIApplication.shared.windows.first
        view?.frame = window?.frame ?? .zero
        
        if let url = PDFCreator.createPDF(view: view!) {
            pdfURL = url
            showPDFPreview = true
        }
    }
    
    var contentView: some View {
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
    
    func savePDF() {
        if let url = pdfURL {
            let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
        }
    }
}

#Preview {
    NavigationStack {
        DetailView()
    }
    .accentColor(.black)
    .background(.basic)
}
