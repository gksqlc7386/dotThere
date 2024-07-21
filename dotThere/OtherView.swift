//
//  OtherView.swift
//  dotThere
//
//  Created by 김한빛 on 7/19/24.
//

import SwiftUI

struct OtherView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("OTHER")
                .font(.caption)
                .foregroundStyle(Color.gray)
                .padding(.leading, 26)
            
            Button(action: {
                print("Button Tapped")
            }) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.blue)
                        .padding(.leading, 12)
                    Text("Export")
                        .foregroundStyle(Color.black)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                        .padding(.trailing, 12)
                }
                .frame(height: 26)
                .padding(10)
                .background(Color.white)
                .cornerRadius(10)
            }
            .frame(maxWidth: .infinity)
            .shadow(color: .black.opacity(0.1), radius: 10)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    OtherView()
}
