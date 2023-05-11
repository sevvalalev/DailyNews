//
//  BusinessLineTableViewCell.swift
//  DailyNews
//
//  Created by Şevval Alev on 10.05.2023.
//

import UIKit

class BusinessLineTableViewCell: UITableViewCell {

    var spacing: CGFloat = 10
    
    public static var identifier: String {
        get {
            return "BusinessLineTableViewCell"
        }
    }
    
    var viewModel: BusinessLineCellViewModel = BusinessLineCellViewModel()
    
    @IBOutlet var businessLineCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCollectionView()
        configureLayout()
        customNibs()
    }

    func configureLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 16) / 1
        layout.itemSize = CGSize(width: itemWidth , height: itemWidth * 0.75)
        businessLineCollectionView.collectionViewLayout = layout
    }
    
    func setupCollectionView() {
        businessLineCollectionView.delegate = self
        businessLineCollectionView.dataSource = self
    }
    
    func customNibs() {
        let customCellNib: UINib = UINib(nibName: BusinessLineCollectionViewCell.identifier, bundle: nil)
        businessLineCollectionView.register(customCellNib, forCellWithReuseIdentifier: BusinessLineCollectionViewCell.identifier)
    }
    
}

extension BusinessLineTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = businessLineCollectionView.dequeueReusableCell(withReuseIdentifier: BusinessLineCollectionViewCell.identifier, for: indexPath) as? BusinessLineCollectionViewCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
}

extension BusinessLineTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 1.5
        let spacingBetweenCells:CGFloat = 10
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        if let collection = self.businessLineCollectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            let height = (collectionView.bounds.width - totalSpacing)/1.4
            return CGSize(width: width, height: height)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
}
