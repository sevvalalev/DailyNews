//
//  AllNewsCellViewModel.swift
//  DailyNews
//
//  Created by Şevval Alev on 20.05.2023.
//

import Foundation

class AllNewsCellViewModel {
    
    var author: String
    var title: String
    var publishDate: String
    var imageUrl: URL?
    

    init(allNewsData: News) {
        self.title = allNewsData.title
        self.publishDate = allNewsData.publishDate
        self.author = allNewsData.author ?? ""
        self.imageUrl = makeImageUrl(allNewsData.image ?? "")
    }
    
    private func makeImageUrl(_ imageCode: String) -> URL? {
        return URL(string: "https://internetprotocol.co/content/images/" + imageCode)
    }
}

