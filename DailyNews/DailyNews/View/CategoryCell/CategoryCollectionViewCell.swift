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
        
        
        categoryButton.layer.borderColor = UIColor.white.cgColor
        categoryButton.layer.borderWidth = 0.5
        categoryButton.layer.cornerRadius = 10
        categoryButton.layer.masksToBounds = true
    }

    func configure(category: String) {
        categoryButton.titleLabel?.setSameFont(fontSize: 16)
        categoryButton.setTitle(category, for: .normal)
    }
    
    @IBAction func categoryButtonTapped(_ sender: UIButton) {
        
    }
    
}
