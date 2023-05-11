//
//  CategoryTableViewCell.swift
//  DailyNews
//
//  Created by Şevval Alev on 11.05.2023.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    public static var identifier: String {
        get {
            return "CategoryTableViewCell"
        }
    }
    
    @IBOutlet var categoryCollectionView: UICollectionView!
    
    let spacing: CGFloat = 10
    
    let viewModel: CategoryCellViewModel = CategoryCellViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        configureLayout()
        customNibs()
        setupCollectionView()
    }
    
    func configureLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        layout.scrollDirection = .horizontal
        categoryCollectionView.collectionViewLayout = layout
    }
    
    func setupCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    

    func customNibs() {
        let customCellNib: UINib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        categoryCollectionView.register(customCellNib, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
}

extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
}

extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 3.2
        let spacingBetweenCells:CGFloat = 8
        let totalSpacing = 8.0 //Amount of total spacing in a row
        
        if let collection = self.categoryCollectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            let height = (collectionView.bounds.width - totalSpacing)/3.2
            return CGSize(width: width, height: height/2)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
}
