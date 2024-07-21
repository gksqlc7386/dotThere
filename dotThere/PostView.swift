//
//  PostView.swift
//  dotThere
//
//  Created by 김한빛 on 7/19/24.
//

import SwiftUI

struct PostView: View {
    
    let images: [String] = ["image1", "image2", "image3", "image4", "image5", "image6"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("POST")
                .font(.caption)
                .foregroundStyle(Color.gray)
                .padding(.leading, 26)
            
            VStack(spacing: 0) {
                HStack(spacing: 4) {
                    if images.count == 1 {
                        singleImageView(image: images[0])
                    } else if images.count == 2 {
                        twoImagesView(images: images)
                    } else if images.count == 3 {
                        threeImagesView(images: images)
                    } else if images.count == 4 {
                        fourImagesView(images: images)
                    } else if images.count == 5 {
                        fiveImagesView(images: images)
                    } else {
                        sixOrMoreImagesView(images: images)
                    }
                }
                .cornerRadius(10)
                .padding(.top, 4)
                .padding(.horizontal, 4)
                .padding(.bottom, -10)
                
                VStack(alignment: .center, spacing: 0) {
                    Text("Title")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 12)
                    Text("What an enchanting day in Périgueux! The cobblestone streets whispered ancient tales as I strolled through the maze of alleys. The grand cathedral stood proudly, its spires reaching for the sky, as if tickling the clouds. Oh, and the market!")
                        .frame(height: 120, alignment: .leading)
                        .font(.callout)
                        .lineLimit(5)
                        .padding(.bottom, 6)
                        .padding(.horizontal, 12)
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
                            Image(systemName: "pencil.line")
                                .font(.footnote)
                                .padding(.trailing)
                        }
                    }
                    .padding(.vertical, 6)
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.1), radius: 10)
            .padding(.horizontal, 16)
        }
        .padding(.top, 26)
    }
    
    private func singleImageView(image: String) -> some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity)
            .clipped()
            .cornerRadius(8)
    }
    
    private func twoImagesView(images: [String]) -> some View {
        GeometryReader { geometry in
            let side = (geometry.size.width - 4) / 2
            HStack(spacing: 4) {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: side, height: side)
                        .clipped()
                        .cornerRadius(8)
                }
            }
        }
        .frame(height: (UIScreen.main.bounds.width) / 2)
    }
    
    private func threeImagesView(images: [String]) -> some View {
        GeometryReader { geometry in
            let side = (geometry.size.width - 4) / 2
            let smallSide = (side - 4) / 2
            HStack(spacing: 4) {
                Image(images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: side, height: side)
                    .clipped()
                    .cornerRadius(8)
                
                VStack(spacing: 4) {
                    ForEach(images.prefix(3).dropFirst(), id: \.self) { image in
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: smallSide * 2 + 4, height: smallSide)
                            .clipped()
                            .cornerRadius(8)
                    }
                }
            }
        }
        .frame(height: (UIScreen.main.bounds.width) / 2)
    }
    
    private func fourImagesView(images: [String]) -> some View {
        GeometryReader { geometry in
            let side = (geometry.size.width - 4) / 2
            let smallSide = (side - 4) / 2
            HStack(spacing: 4) {
                Image(images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: side, height: side)
                    .clipped()
                    .cornerRadius(8)
                
                VStack(spacing: 4) {
                    Image(images[1])
                        .resizable()
                        .scaledToFill()
                        .frame(width: side, height: smallSide)
                        .clipped()
                        .cornerRadius(8)
                    HStack(spacing: 4) {
                        Image(images[2])
                            .resizable()
                            .scaledToFill()
                            .frame(width: smallSide, height: smallSide)
                            .clipped()
                            .cornerRadius(8)
                        Image(images[3])
                            .resizable()
                            .scaledToFill()
                            .frame(width: smallSide, height: smallSide)
                            .clipped()
                            .cornerRadius(8)
                    }
                }
            }
        }
        .frame(height: (UIScreen.main.bounds.width) / 2)
    }
    
    private func fiveImagesView(images: [String]) -> some View {
        GeometryReader { geometry in
            let side = (geometry.size.width - 4) / 2
            let smallSide = (side - 4) / 2
            HStack(spacing: 4) {
                Image(images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: side, height: side)
                    .clipped()
                    .cornerRadius(8)
                
                VStack(spacing: 4) {
                    HStack(spacing: 4) {
                        Image(images[1])
                            .resizable()
                            .scaledToFill()
                            .frame(width: smallSide, height: smallSide)
                            .clipped()
                            .cornerRadius(8)
                        Image(images[2])
                            .resizable()
                            .scaledToFill()
                            .frame(width: smallSide, height: smallSide)
                            .clipped()
                            .cornerRadius(8)
                    }
                    HStack(spacing: 4) {
                        Image(images[3])
                            .resizable()
                            .scaledToFill()
                            .frame(width: smallSide, height: smallSide)
                            .clipped()
                            .cornerRadius(8)
                        Image(images[4])
                            .resizable()
                            .scaledToFill()
                            .frame(width: smallSide, height: smallSide)
                            .clipped()
                            .cornerRadius(8)
                    }
                }
            }
        }
        .frame(height: (UIScreen.main.bounds.width) / 2)
    }
    
    private func sixOrMoreImagesView(images: [String]) -> some View {
        GeometryReader { geometry in
            let side = (geometry.size.width - 4) / 2
            let smallSide = (side - 4) / 2
            HStack(spacing: 4) {
                Image(images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: side, height: side)
                    .clipped()
                    .cornerRadius(8)
                
                VStack(spacing: 4) {
                    HStack(spacing: 4) {
                        Image(images[1])
                            .resizable()
                            .scaledToFill()
                            .frame(width: smallSide, height: smallSide)
                            .clipped()
                            .cornerRadius(8)
                        Image(images[2])
                            .resizable()
                            .scaledToFill()
                            .frame(width: smallSide, height: smallSide)
                            .clipped()
                            .cornerRadius(8)
                    }
                    HStack(spacing: 4) {
                        Image(images[3])
                            .resizable()
                            .scaledToFill()
                            .frame(width: smallSide, height: smallSide)
                            .clipped()
                            .cornerRadius(8)
                        if images.count > 5 {
                            ZStack {
                                Image(images[4])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: smallSide, height: smallSide)
                                    .clipped()
                                    .cornerRadius(8)
                                Color.black.opacity(0.4)
                                    .frame(width: smallSide, height: smallSide)
                                    .cornerRadius(8)
                                Text("+\(images.count - 4)")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                        } else {
                            Image(images[4])
                                .resizable()
                                .scaledToFill()
                                .frame(width: smallSide, height: smallSide)
                                .clipped()
                                .cornerRadius(8)
                        }
                    }
                }
            }
        }
        .frame(height: (UIScreen.main.bounds.width) / 2)
    }
}

#Preview {
    PostView()
}
