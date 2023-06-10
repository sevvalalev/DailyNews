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
    
    public var allNewsAddress: String {
        get {
            return "https://newsapi.org/v2/top-headlines?country=us&apiKey=0952307ff29044ad8273f2d2a177eb23"
        }
    }
    
    public var coinApi: String {
        get{
            //return "http://api.coinlayer.com/live?access_key=3615ccb3c386cebc33f9064f81af86a9"
            return ""
        }
    }
}
