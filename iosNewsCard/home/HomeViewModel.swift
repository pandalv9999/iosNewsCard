//
//  HomeViewModel.swift
//  iosNewsCard
//
//  Created by Rujun Yao on 11/30/20.
//

import Foundation

class HomeViewModel:NSObject {
    var repository: HomeRepository!
    
    typealias GetNewsCallBack = (_ data:Data?, _ urlResponse:URLResponse?, _ error:Error?) -> Void
    var getNewsCallBack: GetNewsCallBack?
    
    init(repository: HomeRepository) {
        self.repository = repository
    }
    
    func getNewsListener(callBack: @escaping GetNewsCallBack) {
        self.getNewsCallBack = callBack
    }
    
    func loadTopNewsFor(country:String) {
        repository.getTopNewsFor(country: country, callBack: getNewsCallBack!)
    }
}
