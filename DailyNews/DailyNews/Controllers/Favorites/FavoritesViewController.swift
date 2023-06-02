//
//  FavoritesViewController.swift
//  DailyNews
//
//  Created by Şevval Alev on 30.05.2023.
//

import UIKit

class FavoritesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configNav()
    }

    
    func configNav() {
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationItem.title = "Favorites"
    }
}
