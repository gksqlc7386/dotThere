//
//  ContentView.swift
//  dotThere
//
//  Created by 김한빛 on 7/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.basic
                .ignoresSafeArea()
            VStack {
                NavigationLink("Move to DetailView", destination: DetailView())
            }
            .navigationBarTitle(".there")
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
    .accentColor(.black)
    .background(.basic)
}
