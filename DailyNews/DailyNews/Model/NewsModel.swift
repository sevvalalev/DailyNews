//
//  NewsModel.swift
//  DailyNews
//
//  Created by Şevval Alev on 11.05.2023.
//

import Foundation

struct NewsModel: Codable {
    let offset: Int
    let number: Int
    let available: Int
    let news: [News]
}

struct News: Codable {
    let id: Int
    let title: String
    let text: String
    let url: String
    let image: String
    let publishDate: String
    let author: String
    let language: String
    let sourceCountry: String
    let sentiment: Double

    enum CodingKeys: String, CodingKey {
        case id, title, text, url, image
        case publishDate = "publish_date"
        case author, language
        case sourceCountry = "source_country"
        case sentiment
    }
}
