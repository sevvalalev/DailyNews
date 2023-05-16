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
    
    static func getNews(completionHandler: @escaping (_ result: Result<NewsModel,NetworkError>) -> Void ) {
        let urlString = NetworkConstant.shared.serverAddress + "search-news?api-key=" + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil,
               let data = dataResponse,
                let resultData = try? JSONDecoder().decode(NewsModel.self, from: data) {
                    completionHandler(.success(resultData))
                } else {
                    completionHandler(.failure(.canNotParseData))
                }
        }.resume()
        
    }
}
