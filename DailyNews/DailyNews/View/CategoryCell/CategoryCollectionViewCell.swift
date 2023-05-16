//
//  CategoryCollectionViewCell.swift
//  DailyNews
//
//  Created by Şevval Alev on 11.05.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    public static var identifier: String {
        get {
            return "CategoryCollectionViewCell"
        }
    }
  
    @IBOutlet var categoryButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryButton.layer.cornerRadius = 10
        categoryButton.layer.masksToBounds = true
        categoryButton.titleLabel?.setSameFont(withText: "Category",fontSize: 18)
    }

    
    @IBAction func categoryButtonTapped(_ sender: UIButton) {
        
    }
    
}
