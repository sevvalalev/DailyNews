//
//  NewsDetailViewController.swift
//  DailyNews
//
//  Created by Şevval Alev on 10.06.2023.
//

import UIKit
import SDWebImage

class NewsDetailViewController: UIViewController {

    public static var identifier: String {
        get {
            return "toDetailsVC"
        }
    }
    
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var newsDetailLabel: UITextView!
    var news: News?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .systemBackground
        newsImageView.layer.cornerRadius = 10
        configureData()
        configureFont()
    }
    
    private func configureFont() {
        newsLabel.setSameFont(fontSize:22)
        newsLabel.text = newsLabel.text?.uppercased()
        dateLabel.setSameFont(fontSize:14)
        authorLabel.setSameFont(fontSize:14)
        descriptionLabel.setSameFont(fontSize:15)
        newsDetailLabel.setSameFont(fontSize:16)
    }
    
    func configureData() {
        guard let news = news else {
            return
        }
        
        newsLabel.text = news.title
        dateLabel.text = news.publishDate
        authorLabel.text = news.author
        descriptionLabel.text = news.description
        newsDetailLabel.text = news.content
        newsImageView.sd_setImage(with: URL(string: news.image ?? ""), placeholderImage: UIImage(named: ""))
    }
}
