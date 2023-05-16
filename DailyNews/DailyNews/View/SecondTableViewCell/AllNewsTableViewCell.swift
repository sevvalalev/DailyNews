//
//  AllNewsTableViewCell.swift
//  DailyNews
//
//  Created by Şevval Alev on 11.05.2023.
//

import UIKit

class AllNewsTableViewCell: UITableViewCell {

    public static var identifier: String {
        get {
            return "AllNewsTableViewCell"
        }
    }
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        self.contentView.layer.cornerRadius = 10
        exampleText()
    }
    
    func exampleText() {
        newsTitle.setSameFont(withText: "Western academic student employees earn right to bargain - New bill supports student unionizati...", fontSize: 19)
        newsDate.setSameFont(withText: "April 28, 2023 at 6:05 p.m.", fontSize: 12)
        newsAuthor.setSameFont(withText: "CASCADIADAILY", fontSize: 12)
    }
    
}
