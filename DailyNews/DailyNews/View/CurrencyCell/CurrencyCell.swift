//
//  CurrencyCell.swift
//  DailyNews
//
//  Created by Şevval Alev on 10.05.2023.
//

import UIKit

class CurrencyCell: UITableViewCell {

    var spacing: CGFloat = 10
    public static var identifier: String {
        get {
            return "CurrencyCell"
        }
    }
    
    @IBOutlet weak var currencyCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customNibs()
        setupCollectionView()
    }


    func setupCollectionView() {
        currencyCollectionView.delegate = self
        currencyCollectionView.dataSource = self
    }
    

    func customNibs() {
        let customCellNib: UINib = UINib(nibName: "CurrencyCollectionViewCell", bundle: nil)
        currencyCollectionView.register(customCellNib, forCellWithReuseIdentifier: CurrencyCollectionViewCell.identifier)
    }
    
}

extension CurrencyCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = currencyCollectionView.dequeueReusableCell(withReuseIdentifier: CurrencyCollectionViewCell.identifier, for: indexPath) as? CurrencyCollectionViewCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
}

extension CurrencyCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 4
        let spacingBetweenCells:CGFloat = 10
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        if let collection = self.currencyCollectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            let height = (collectionView.bounds.width - totalSpacing)/1.7
            return CGSize(width: width, height: height)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
}
