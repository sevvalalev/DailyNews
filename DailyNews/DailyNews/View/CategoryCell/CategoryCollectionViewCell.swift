//
//  CategoryCollectionViewCell.swift
//  DailyNews
//
//  Created by Şevval Alev on 30.06.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryNameButton: UIButton!
    
    static var identifier = "CategoryCollectionViewCell"
    
    private var viewModel: CategoryCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryNameButton.setSameFont(fontSize:20)
        
        categoryView.backgroundColor = .darkGray
        categoryView.layer.cornerRadius = 10

    }
    
    @IBAction func categoryNameButtonTapped(_ sender: UIButton) {
        
    }
    

}
