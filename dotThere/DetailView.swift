//
//  DetailView.swift
//  dotThere
//
//  Created by 김한빛 on 7/19/24.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack {
            Color(.basic)
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 26) {
                    PostView()
                    OtherView()
                    MapView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: EditButton())
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
