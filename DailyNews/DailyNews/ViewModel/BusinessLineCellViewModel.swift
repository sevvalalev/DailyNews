//
//  FirstLineCollectionCellViewModel.swift
//  DailyNews
//
//  Created by Şevval Alev on 11.05.2023.
//

import Foundation

class BusinessLineCellViewModel {
    
    var businessData: NewsModel?
    
    init(businessData: NewsModel?) {
        self.businessData = businessData
    }
    
    func numberOfItemsInSection() -> Int{
        return businessData?.news.count ?? 1
    }
    
}
