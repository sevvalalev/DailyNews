//
//  SearchViewModel.swift
//  DailyNews
//
//  Created by Şevval Alev on 2.06.2023.
//

import Foundation

class SearchViewModel {
    var searchResults: NewsModel?
    
    func search(query: String, completion: @escaping () -> Void) {
        getSearchRequest(searchedText: query) { result in
            switch result {
            case .success(let data):
                self.searchResults = data
            case .failure(let error):
                print("ERR: While fetching search results -> \(error.localizedDescription)")
                self.searchResults = nil
            }
            
            completion()
        }
    }
    
    private func getSearchRequest(searchedText: String, completionHandler: @escaping (Result<NewsModel, NetworkError>) -> Void) {
        let urlString = NetworkConstant.shared.allNewsAddress + "&q=\(searchedText)"
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, _, error in
            if let error = error {
                print("ERR: Search request failed -> \(error.localizedDescription)")
                completionHandler(.failure(.canNotParseData))
                return
            }
            
            if let data = dataResponse {
                do {
                    let resultData = try JSONDecoder().decode(NewsModel.self, from: data)
                    completionHandler(.success(resultData))
                } catch let error {
                    print("ERR: Error while parsing search data -> \(error)")
                    completionHandler(.failure(.canNotParseData))
                }
            } else {
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
    
    func numberOfRowsInSection() -> Int {
        return searchResults?.news.count ?? 3
    }
    
    func heightForRowAt() -> Int {
        return 150
    }
}
