//
//  MainViewModel.swift
//  DailyNews
//
//  Created by Şevval Alev on 10.05.2023.
//

import Foundation
import UIKit

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(true)
    var isInitialDataLoaded: Observable<Bool> = Observable(false)
    var newsDataSource: NewsModel?
    var coinDataSource: CoinModel?
    var businessDataSource: NewsModel?
        
    private var dispatchGroup = DispatchGroup()
    
    func numberOfSections() -> Int {
        return 4
    }
    
    func numberOfRows(in section: Int) -> Int {
        if section == 3 {
            return newsDataSource?.news.count ?? 0
        } else if section == 1 {
            return 1
        } else {
            return 1
        }
    }
    

    func heightForRowAt(indexPath: IndexPath) -> Int {
        if indexPath.section == 0 {
            return 60
        } else if indexPath.section == 1 {
             return 370
        } else if indexPath.section == 2 {
             return 60
        } else if indexPath.section == 3 {
            return 220
        }
        return 200
    }
    
    func loadInitialData() {
        dispatchGroup.enter()
        getAllData { result in
            switch result {
            case .success(let success):
                self.newsDataSource = success
            case .failure(let error):
                print("ERR: While fetching all news -> \(error.localizedDescription)")
            }
            self.dispatchGroup.leave()
        }
        /*
        dispatchGroup.enter()
        getAllCoin { result in
            switch result {
            case .success(let success):
                self.coinDataSource = success
            case .failure(let error):
                print("ERR: While fetching all coins -> \(error.localizedDescription)")
            }
            self.dispatchGroup.leave()
        }
        */
        
        dispatchGroup.enter()
        getBusinessData { result in
            switch result {
            case .success(let success):
                self.businessDataSource = success
            case .failure(let error):
                print("ERR : While fetching all news -> \(error.localizedDescription)")
            }
            self.dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            self?.isInitialDataLoaded.value = true
        }
        
    }
}


// MARK: - LOAD DATA
private
extension MainViewModel {
    func getAllData(completion: @escaping(Result<NewsModel, Error>)->Void) {
        APICaller.getAllNews { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /*func getAllCoin(completion: @escaping(Result<CoinModel, Error>)->Void) {
        APICaller.getCoinData { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
     */
    
    func getBusinessData(completion: @escaping(Result<NewsModel, Error>) -> Void) {
        APICaller.getDataByCategory(categoryName: "business") { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
