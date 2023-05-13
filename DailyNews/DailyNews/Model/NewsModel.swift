//
//  NewsModel.swift
//  DailyNews
//
//  Created by Şevval Alev on 11.05.2023.
//

import Foundation

struct NewsModel: Codable {
    let offset, number, available: Int?
    let news: [News]?
}

// MARK: - News
struct News: Codable {
    let id: Int?
    let title, text: String?
    let url: String?
    let image: String?
    let publishDate: String?
    let author: Author?
    let language: Language?
    let sourceCountry: SourceCountry?
    let sentiment: Double?

    enum CodingKeys: String, CodingKey {
        case id, title, text, url, image
        case publishDate
        case author, language
        case sourceCountry
        case sentiment
    }
}

enum Author: String, Codable {
    case admin = "Admin"
}

enum Language: String, Codable {
    case en = "en"
}

enum SourceCountry: String, Codable {
    case bv = "bv"
}
