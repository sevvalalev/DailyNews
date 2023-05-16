//
//  MainViewModel.swift
//  DailyNews
//
//  Created by Şevval Alev on 10.05.2023.
//

import Foundation
import UIKit

class MainViewModel {
    
    func numberOfSections() -> Int {
        return 4
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 1
    }
    
    func heightForRowAt(indexPath: IndexPath) -> Int {
        if indexPath.section == 0 {
            return 60
        }else if indexPath.section == 1 {
            return 370
        }else if indexPath.section == 2 {
            return 60
        }else if indexPath.section == 3 {
            return 220
        }
        return 200
    }
    
    func cellForRowAt(_ tableView: UITableView,indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.identifier, for: indexPath) as? CurrencyCell {
                tableView.separatorStyle = .none
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
                tableView.separatorStyle = .none
                return cell4
            }
        }
        return UITableViewCell()
    }
    
    func getData() {
        APICaller.getNews { result in
            switch result {
            case .success(let data):
                print("\(result)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
