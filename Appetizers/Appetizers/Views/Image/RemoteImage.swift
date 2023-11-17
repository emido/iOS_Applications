//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-04.
//

import SwiftUI


// it will download the image and then broadcast(like view model) that I have the image
final  class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String){
        NetworkManager.shared.downloadImgae(fromURLString: urlString) { uiImage in
            guard let uiImage else {return}
            
            //load the image in the main queue: to trigger the UI update
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
    var image: Image?
    var body: some View {
        image?.resizable() ??  Image("food-placeholder").resizable()
    }
}


struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString : String
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
    }
}
