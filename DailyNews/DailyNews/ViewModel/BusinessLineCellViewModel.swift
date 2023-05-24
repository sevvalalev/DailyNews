//
//  FirstLineCollectionCellViewModel.swift
//  DailyNews
//
//  Created by Şevval Alev on 11.05.2023.
//

import Foundation

class BusinessLineCellViewModel {
    
    var businessData: NewsModel?
    
    var author: String
    var title: String
    var publishDate: String
    var imageUrl: String?
    

    init(businessData: News) {
        self.title = businessData.title
        self.publishDate = businessData.publishDate ?? "0"
        self.author = businessData.author ?? ""
        self.imageUrl = businessData.image
    }
    
}
