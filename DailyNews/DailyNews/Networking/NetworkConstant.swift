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
    //http://api.mediastack.com/v1/news?access_key=41b9af5bf068a9e8d73aef7e1bb8d119
    
    public var allNewsAddress: String {
        get {
            return "http://api.mediastack.com/v1/news?access_key=41b9af5bf068a9e8d73aef7e1bb8d119"
        }
    }
    
    public var coinApi: String {
        get{
           // return "http://api.coinlayer.com/live?access_key=2998aeedfd945f9010e69791db024969"
            return ""
        }
    }
}
