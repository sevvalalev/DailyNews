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
    
    
    
}
