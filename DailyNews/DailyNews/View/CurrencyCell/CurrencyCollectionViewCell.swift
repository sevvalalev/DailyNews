//
//  CurrencyCollectionViewCell.swift
//  DailyNews
//
//  Created by Şevval Alev on 10.05.2023.
//

import UIKit

class CurrencyCollectionViewCell: UICollectionViewCell {

    public static var identifier: String {
        get {
            return "CurrencyCollectionViewCell"
        }
    }

    // MARK: IBOutlets
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyRate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        currencyLabel.setSameFont(withText: "EUR-USD")
        currencyRate.setSameFont(withText: "-0.40%")
    }

}
