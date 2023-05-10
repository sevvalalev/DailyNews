//
//  MainViewController.swift
//  DailyNews
//
//  Created by Şevval Alev on 10.05.2023.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }

    func configView() {
        self.navigationController!.navigationBar.barStyle = .black
        self.navigationController?.title = "NEWS"
        self.navigationController!.navigationBar.isTranslucent = false
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor:UIColor.white]
        self.navigationItem.title = "NEWS"

    }
    
}
