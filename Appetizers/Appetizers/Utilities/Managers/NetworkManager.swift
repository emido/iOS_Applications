//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-03.
//

import UIKit

    
final class NetworkManager {
    
    // creates a singleton: objects that should only ever be created once, then shared everywhere they need to be used.
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()  // <NSString, UIImage> type of variables that is going to be saved
    
    static let baseURL = "https://gist.githubusercontent.com/ahmedeltaher/78e7f1b54d4b60af73b9802b38abf3cf/raw/931c5a3a1482a2536f18fedb7858cdc518337338/"
    private let appetizerURL = baseURL + "data.json"
    
    private init() {}
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do  {
            let decoder = JSONDecoder()
            let decodedResponse =  try decoder.decode([Appetizer].self, from: data)  //AppetizerResponse.self
            return decodedResponse
        } catch {
            throw APError.invalidData
        }
        
    }
    
    // 2 network calls: 1- for getting the datat from the url(json data) 2- downloading the images from the url
//    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
//        //1- make sure the url works
//        guard let url = URL(string: appetizerURL) else {
//            completed(.failure(.invalidURL))
//            return
//        }
//        //2- initialize the data task to download the data
//        let task = URLSession.shared.dataTask(with: URLRequest(url:url)){ data, response, error in
//
//            // check if we have error
//            if let _ = error  {
//                completed(.failure(.unableToComplete))
//                return
//            }
//
//            // check for reponse
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
//                completed(.failure(.invalidResponse))
//                return
//            }
//
//            // check for data
//            guard let data = data else{
//                completed(.failure(.invalidData))
//                return
//            }
//
//            // now affter checking all the returned values we havre to manipulate data
//            // now decode the data that we get from net (json to the model type we have which is Appetizer)
//            do  {
//                let decoder = JSONDecoder()
//                let decodedResponse =  try decoder.decode([Appetizer].self, from: data)  //AppetizerResponse.self
//                print(decodedResponse.count)
//                completed(.success(decodedResponse))
//            } catch {
//                completed(.failure(.invalidData))
//            }
//        }
//
//        // fire off the network  call
//        task.resume()
//
//    }
//
  
    
    
    func downloadImgae(fromURLString urlString:String, completed: @escaping (UIImage?) -> Void) {
        // we usually use caches for downloading images in order to stop downloading if it is already in the cache
        // 1- first check if it is in the cache then rrerturn image in completed
        let cacheKey = NSString(string: urlString)
        if let image =  cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        //2- if it is not in the cache then download the image
        
        //2-1 check if the url is fine
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        //2-2- initialize the data task to download the data
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)){ data, response, error in
            
            guard let data,  let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            // if we downloaded the image successfully save it in the cache for later reference
            self.cache.setObject(image, forKey: cacheKey)
            // set the completed with  the downloaded image
            completed(image)
        }
        
        task.resume()
    }
   
    
    
    
}
