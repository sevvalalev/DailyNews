//
//  MainViewController.swift
//  DailyNews
//
//  Created by Şevval Alev on 10.05.2023.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupTableView()
        customNibs()
        configNav()
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func configNav() {
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationItem.title = "NEWS"
    }
    
    func customNibs() {
        let customCellNib: UINib = UINib(nibName: "CurrencyCell", bundle: nil)
        tableView.register(customCellNib, forCellReuseIdentifier: CurrencyCell.identifier)
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.identifier, for: indexPath) as? CurrencyCell {
                tableView.separatorStyle = .none
                return cell
            }
        }else if indexPath.section == 1 {
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: FirstLineTableViewCell.identifier, for: indexPath) as? FirstLineTableViewCell {
                return cell2
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 60
        }else if indexPath.section == 1 {
            return 300
        }
        return 200
    }
    
}
