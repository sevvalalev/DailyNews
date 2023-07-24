//
//  CategoryCellViewModel.swift
//  DailyNews
//
//  Created by Şevval Alev on 11.05.2023.
//

import Foundation

class CategoryCellViewModel {
    
    let categories = ["Business", "Entertainment", "General", "Health", "Science", "Sports", "Technology"]
    
    func numberOfItemsInSection() -> Int {
        return categories.count ?? 1
    }

    
    static func getDataByCategory(categoryName: String,completionHandler: @escaping (_ result: Result<NewsModel,NetworkError>) -> Void ) {
        
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=0952307ff29044ad8273f2d2a177eb23&category=\(categoryName)"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil,
               let data = dataResponse {
                do {
                    let resultData = try JSONDecoder().decode(NewsModel.self, from: data)
                    completionHandler(.success(resultData))
                } catch let error {
                    print("Error while parsing data \(error)")
                    completionHandler(.failure(.canNotParseData))
                }
            } else {
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
