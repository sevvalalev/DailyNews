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
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    // MARK: ViewModel
    var viewModel: MainViewModel = MainViewModel()
    // MARK: variables
    var cellDataSource: [AllNewsCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        setupTableView()
        customNibs()
        configNav()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.loadInitialData()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                if isLoading {
                    self?.indicator.startAnimating()
                }else{
                    self?.indicator.stopAnimating()
                }
            }
        }
        viewModel.isInitialDataLoaded.bind { isLoaded in
            if isLoaded ?? false {
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
        let customCellNib: UINib = UINib(nibName: "CoinCell", bundle: nil)
        tableView.register(customCellNib, forCellReuseIdentifier: CoinCell.identifier)
        
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
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.identifier, for: indexPath) as? CoinCell {
                tableView.separatorStyle = .none
                if let coinData = viewModel.coinDataSource {
                    let viewModel = CoinCellViewModel(coinData: coinData)
                    cell.configure(viewModel: viewModel)
                }
                return cell
            }
        }else if indexPath.section == 1 {
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: BusinessLineTableViewCell.identifier, for: indexPath) as? BusinessLineTableViewCell {
                tableView.separatorStyle = .none
                return cell2
            }
        }else if indexPath.section == 2 {
            if let cell3 = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell {
                tableView.separatorStyle = .none
                return cell3
            }
        }else if indexPath.section == 3 {
            if let cell4 = tableView.dequeueReusableCell(withIdentifier: AllNewsTableViewCell.identifier, for: indexPath) as? AllNewsTableViewCell {
                if let allNewsData = viewModel.newsDataSource?.news[indexPath.row] {
                    let allNewsViewModel = AllNewsCellViewModel(allNewsData: allNewsData)
                    cell4.configureCell(viewModel: allNewsViewModel)
                }
                tableView.separatorStyle = .none
                return cell4
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel.heightForRowAt(indexPath: indexPath))
    }
    
}
