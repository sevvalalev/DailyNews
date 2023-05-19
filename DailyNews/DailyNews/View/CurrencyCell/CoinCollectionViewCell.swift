//
//  CoinCollectionViewCell.swift
//  DailyNews
//
//  Created by Şevval Alev on 10.05.2023.
//

import UIKit

class CoinCollectionViewCell: UICollectionViewCell {

    public static var identifier: String {
        get {
            return "CoinCollectionViewCell"
        }
    }

    // MARK: IBOutlets
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinRate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        coinName.setSameFont(fontSize: 16)
        coinRate.setSameFont(fontSize: 16)
    }

    func configureCell(with coinData: CoinModel?) {
        guard let coinData = coinData else {
            return
        }
        
        if let keys = coinData.rates?.keys.joined(separator: ", ") {
            coinName.text = keys
        }
        
        if let values = coinData.rates?.values.map({ String($0) }).joined(separator: ", ") {
            coinRate.text = values
        }
        
    }
}
