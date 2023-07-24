//
//  CategoryCollectionViewCell.swift
//  DailyNews
//
//  Created by Şevval Alev on 30.06.2023.
//

import UIKit

protocol SelectedCategoryDelegate: AnyObject {
    func categorySelected(category: String)
}

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryNameButton: UIButton!
    
    static var identifier = "CategoryCollectionViewCell"
    
    private var viewModel: CategoryCellViewModel?
    
    private var category: String?
    
    private weak var delegate: SelectedCategoryDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryNameButton.setSameFont(fontSize:20)
        
        categoryView.backgroundColor = .darkGray
        categoryView.layer.cornerRadius = 10
        
    }
    
    func configure(delegate: SelectedCategoryDelegate?, category: String) {
        self.category = category
        self.delegate = delegate
        categoryNameButton.titleLabel?.setSameFont(fontSize: 16)
        categoryNameButton.setTitle(category, for: .normal)
    }
    
    @IBAction func categoryNameButtonTapped(_ sender: UIButton) {
        guard let category else { return }
        delegate?.categorySelected(category: category)
    }
}
