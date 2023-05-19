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
    
    public var coinApi: String {
        get{
            return "http://api.coinlayer.com/live?access_key=2998aeedfd945f9010e69791db024969"
        }
    }
}
