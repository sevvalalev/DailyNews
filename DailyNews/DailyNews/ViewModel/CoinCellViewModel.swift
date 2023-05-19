//
//  CoinCellViewModel.swift
//  DailyNews
//
//  Created by Şevval Alev on 11.05.2023.
//

import Foundation
import UIKit

class CoinCellViewModel {
    
    var coinData: CoinModel
    
    init(coinData: CoinModel) {
        self.coinData = coinData
    }
    
    func numberOfItemsInSection() -> Int{
        return coinData.rates?.count ?? 0
    }
}
