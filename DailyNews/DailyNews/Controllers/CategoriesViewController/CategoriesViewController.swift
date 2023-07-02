//
//  CategoriesViewController.swift
//  DailyNews
//
//  Created by Şevval Alev on 30.06.2023.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    private var viewModel: CategoryCellViewModel? = CategoryCellViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        customNibs()
        configureCollectionView()
        configNav()
    }
    
    private func configureCollectionView() {
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 16)/1.1
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth/4.3)
        categoriesCollectionView.collectionViewLayout = layout
    }

    func configNav() {
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationItem.title = "Categories"
    }
    
    func customNibs() {
        let customCellNib: UINib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        categoriesCollectionView.register(customCellNib, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }

    

}

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItemsInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell {
            cell.categoryNameButton.titleLabel?.text = viewModel?.categories[indexPath.item]
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
