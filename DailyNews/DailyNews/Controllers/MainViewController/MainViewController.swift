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
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
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
        
        let customFirstLineCellNib: UINib = UINib(nibName: "BusinessLineTableViewCell", bundle: nil)
        tableView.register(customFirstLineCellNib, forCellReuseIdentifier: BusinessLineTableViewCell.identifier)
        
        let categoryCellNib: UINib = UINib(nibName: "CategoryTableViewCell", bundle: nil)
        tableView.register(categoryCellNib, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        
        let customSecondTableViewCell: UINib = UINib(nibName: "AllNewsTableViewCell", bundle: nil)
        tableView.register(customSecondTableViewCell, forCellReuseIdentifier: AllNewsTableViewCell.identifier)
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
        return viewModel.cellForRowAt(tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel.heightForRowAt(indexPath: indexPath))
    }
    
    
}
