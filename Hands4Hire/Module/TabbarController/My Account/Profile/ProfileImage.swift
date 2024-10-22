//
//  ProfileImage.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

struct ProfileImage: View {
    
    let urlString:String
    let height:Double = 300
    let width: Double = 300
    init(urlString: String) {
        self.urlString = urlString
    }
    
    var body: some View {
        VStack(alignment: .center) {
            if let url = URL(string: urlString) {
                
                AsyncImageView(
                    url: url,
                    placeholder: Image(systemName: "person.fill")
                )
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: width, height: height)
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: width, height: height)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct AsyncImageView: View {
    @State private var image: Image? = nil
    @State private var isLoading: Bool = false
    
    let url: URL
    let placeholder: Image

    var body: some View {
        ZStack {
            if let image = image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                placeholder
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .onAppear(perform: loadImage)
            }
        }
    }

    private func loadImage() {
        guard !isLoading else { return }
        isLoading = true
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let uiImage = UIImage(data: data) else {
                return
            }

            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
                self.isLoading = false
            }
        }.resume()
    }
}
