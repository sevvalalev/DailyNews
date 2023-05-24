//
//  BusinessLineCollectionViewCell.swift
//  DailyNews
//
//  Created by Şevval Alev on 10.05.2023.
//

import UIKit
import SDWebImage

class BusinessLineCollectionViewCell: UICollectionViewCell {

    public static var identifier: String {
        get {
            return "BusinessLineCollectionViewCell"
        }
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet var textBackgroundView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        newsTitle.setSameFont(fontSize: 22)
        newsDate.setSameFont(fontSize: 15)
        newsAuthor.setSameFont(fontSize: 15)
    }
    
    func configure(viewModel: BusinessLineCellViewModel) {
        self.newsTitle.text = viewModel.title
        self.newsDate.text = viewModel.publishDate
        self.newsAuthor.text = viewModel.author
        self.imageView.sd_setImage(with: URL(string: viewModel.imageUrl ?? ""), placeholderImage: UIImage(named: ""))
    }
   

}
