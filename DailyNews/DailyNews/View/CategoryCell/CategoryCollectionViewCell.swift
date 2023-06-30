//
//  CategoryCollectionViewCell.swift
//  DailyNews
//
//  Created by Şevval Alev on 30.06.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    static var identifier = "CategoryCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryNameLabel.setSameFont(withText: "Category", fontSize: 20)
        categoryNameLabel.textColor = .white
        categoryView.backgroundColor = .black
        categoryView.layer.cornerRadius = 10
    }

}
