//
//  NewsModel.swift
//  DailyNews
//
//  Created by Şevval Alev on 11.05.2023.
//

import Foundation

struct NewsModel: Codable {
    let pagination: Pagination?
    let news: [News]
    
    enum CodingKeys: String, CodingKey {
        case pagination
        case news = "data"
    }
}

struct News: Codable {
    let title: String
    let description: String
    let url: String
    let source: String
    let image: String?
    let publishDate: String
    let author: String?
    let language: String
    let country: String
    let category: Category
    
    enum CodingKeys: String, CodingKey {
        case author, title, description, url, source, image, category, language, country
        case publishDate = "published_at"
    }
}

enum Category: String, Codable {
    case business = "business"
    case general = "general"
    case sports = "sports"
}

enum Language: String, Codable {
    case en = "en"
}

struct Pagination: Codable {
    let limit, offset, count, total: Int?
}
