//
//  FirstLineCollectionCellViewModel.swift
//  DailyNews
//
//  Created by Şevval Alev on 11.05.2023.
//

import Foundation

class BusinessLineCellViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[News]> = Observable(nil)
    var dataSource: NewsModel?
    
    
    func numberOfItemsInSection() -> Int {
        return 6
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSource?.news.count ?? 1
    }
}
