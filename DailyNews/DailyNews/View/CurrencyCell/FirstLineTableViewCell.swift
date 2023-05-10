//
//  FirstLineTableViewCell.swift
//  DailyNews
//
//  Created by Şevval Alev on 10.05.2023.
//

import UIKit

class FirstLineTableViewCell: UITableViewCell {

    var spacing: CGFloat = 10
    public static var identifier: String {
        get {
            return "FirstLineTableViewCell"
        }
    }
    
    @IBOutlet weak var firstLineCollectionViewCell: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customNibs()
    }

    func setupCollectionView() {
        firstLineCollectionViewCell.delegate = self
        firstLineCollectionViewCell.dataSource = self
    }
    
    func customNibs() {
        let customCellNib: UINib = UINib(nibName: "FirstLineCollectionViewCell", bundle: nil)
        firstLineCollectionViewCell.register(customCellNib, forCellWithReuseIdentifier: FirstLineCollectionViewCell.identifier)
    }
    
}

extension FirstLineTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = firstLineCollectionViewCell.dequeueReusableCell(withReuseIdentifier: FirstLineCollectionViewCell.identifier, for: indexPath) as? FirstLineCollectionViewCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
}

extension FirstLineTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 4
        let spacingBetweenCells:CGFloat = 10
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        if let collection = self.firstLineCollectionViewCell{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            let height = (collectionView.bounds.width - totalSpacing)/1.7
            return CGSize(width: width, height: height)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
}
