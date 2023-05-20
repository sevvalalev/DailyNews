//
//  AllNewsTableViewCell.swift
//  DailyNews
//
//  Created by Şevval Alev on 11.05.2023.
//

import UIKit
import SDWebImage

class AllNewsTableViewCell: UITableViewCell {

    public static var identifier: String {
        get {
            return "AllNewsTableViewCell"
        }
    }
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        self.contentView.layer.cornerRadius = 10
        newsTitle.setSameFont(fontSize: 19)
        newsDate.setSameFont(fontSize: 12)
    }
    
    
    func configureCell(viewModel: AllNewsCellViewModel) {
        self.newsTitle.text = viewModel.title
        self.newsDate.text = viewModel.publishDate
        if let imageUrl = viewModel.imageUrl {
            self.newsImageView.sd_setImage(with: imageUrl)
        } else {
            self.newsImageView.image = UIImage(named: "w")
        }
    }
}
