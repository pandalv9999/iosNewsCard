//
//  HomeRepository.swift
//  iosNewsCard
//
//  Created by Rujun Yao on 10/29/20.
//

import Foundation
import Alamofire

class HomeRepository {
    
    fileprivate var baseUrl:String = "http://newsapi.org/v2/"
    fileprivate var keys:String = "4b5d84a5879f413e81181e543301e5c9"
    
    func getTopNewsFor(country:String, callBack: @escaping (_ data:Data?, _ urlResponse:URLResponse?, _ error:Error?) -> Void) {
        let url:String = "\(baseUrl)top-headlines?country=\(country)&apiKey=\(keys)"
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: callBack).resume()
    }
    // (Data?, URLResponse?, Error?
    
    
   

}
