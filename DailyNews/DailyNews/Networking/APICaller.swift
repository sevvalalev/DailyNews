//
//  APICaller.swift
//  DailyNews
//
//  Created by Şevval Alev on 11.05.2023.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

class APICaller {
    
    static func getNews(
        
        completionHandler: @escaping (_ result: Result<NewsModel,Error>) -> Void) {
            
            let urlString = "https://api.worldnewsapi.com/search-news?api-key=1ed4eefc3aec4d948a8484e5e01978d8"
            
            guard let url = URL(string: urlString) else {
                completionHandler(.failure(NetworkError.urlError))
                return
            }
            
            URLSession.shared.dataTask(with: url) { dataResponse , urlResponse, error in
                
                if error == nil,
                   let data = dataResponse,
                   let resultData = try? JSONDecoder().decode(NewsModel.self, from: data) {
                    completionHandler(.success(resultData))
                }else{
                    completionHandler(.failure(NetworkError.canNotParseData))
                }
                
            }.resume()
            
        }
    
}
