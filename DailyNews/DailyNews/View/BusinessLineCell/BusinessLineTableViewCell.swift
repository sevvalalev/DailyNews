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
    
    var viewModel: BusinessLineCellViewModel?
    
    
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
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        businessLineCollectionView.collectionViewLayout = layout
    }
    
    func setupCollectionView() {
        businessLineCollectionView.delegate = self
        businessLineCollectionView.dataSource = self
    }
    
    func configure(viewModel: BusinessLineCellViewModel?) {
        self.viewModel = viewModel
        businessLineCollectionView.reloadData()
    }
    
    func customNibs() {
        let customCellNib: UINib = UINib(nibName: BusinessLineCollectionViewCell.identifier, bundle: nil)
        businessLineCollectionView.register(customCellNib, forCellWithReuseIdentifier: BusinessLineCollectionViewCell.identifier)
    }
}

extension BusinessLineTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = businessLineCollectionView.dequeueReusableCell(withReuseIdentifier: BusinessLineCollectionViewCell.identifier, for: indexPath) as? BusinessLineCollectionViewCell {
            if let businessData = viewModel?.businessDataSource?.news[indexPath.row] {
                let businessViewModel = BusinessLineCellViewModel(businessData: businessData)
                cell.configure(viewModel: businessViewModel)
            }
            return cell
        }
        return UICollectionViewCell()
    }
}

extension BusinessLineTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 1.3
        let spacingBetweenCells:CGFloat = 10
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        if let collection = self.businessLineCollectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            let height = (collectionView.bounds.width - totalSpacing)/0.9
            return CGSize(width: width, height: height)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
}
