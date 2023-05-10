//
//  FirstLineCollectionViewCell.swift
//  DailyNews
//
//  Created by Şevval Alev on 10.05.2023.
//

import UIKit

class FirstLineCollectionViewCell: UICollectionViewCell {

    public static var identifier: String {
        get {
            return "FirstLineCollectionViewCell"
        }
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newsTitle.setSameFont()
        newsDate.setSameFont()
        newsAuthor.setSameFont()
    }

}
