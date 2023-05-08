//
//  ConvenienceView.swift
//  appUI
//
//  Created by 김나훈 on 2023/04/27.
//

import SwiftUI

struct SecondView: View {
    @State private var word = ""
    let ictImages = ["ict1", "ict2", "ict3", "ict4", "ict5", "ict6", "ict7", "ict8", "ict9"]
    var body: some View {
        ScrollView {
            ForEach(ictImages, id: \.self) { imageName in
                Image(imageName)  .resizable()
                    .aspectRatio(contentMode: .fit).frame(width: 400, height: 300)
            }
        }
    }
}

struct ConvenienceView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 50) {
                NavigationLink(destination: FullScreenImage(image: Image("image5"))) {
                    Image("image1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                NavigationLink(destination: SecondView()) {
                    Image("image2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                NavigationLink(destination: FullScreenImage(image: Image("ictTeam"))) {
                    Image("image3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                NavigationLink(destination: FullScreenImage(image: Image("image8"))) {
                    Image("image4")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                
            }
            
        }
        ButtonItem()
    }
}

struct FullScreenImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .navigationBarBackButtonHidden(true)
    }
}




struct ConvenienceView_Previews: PreviewProvider {
    static var previews: some View {
        ConvenienceView()
    }
}
