//
//  MapView.swift
//  dotThere
//
//  Created by 김한빛 on 7/19/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("MAP")
                .font(.caption)
                .foregroundStyle(Color.gray)
                .padding(.leading, 26)
            
            VStack {
                Map()
                    .frame(height: 200)
                Divider()
                HStack() {
                    Text("Sunday, Jan 21")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.leading)
                    Spacer()
                    Button(action: {
                        print("Button tapped")
                    }) {
                        Image(systemName: "ellipsis")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                }
                .padding(.bottom, 8)
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.1), radius: 10)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    MapView()
}
