//
//  NetworkConstant.swift
//  DailyNews
//
//  Created by Şevval Alev on 15.05.2023.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        //singletone
    }
    //let urlString = "https://api.worldnewsapi.com/search-news?api-key="
    public var apiKey: String {
        get {
            return "1ed4eefc3aec4d948a8484e5e01978d8"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.worldnewsapi.com/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return ""
        }
    }
}
