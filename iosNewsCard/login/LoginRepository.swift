//
//  LoginModel.swift
//  iosNewsCard
//
//  Created by Rujun Yao on 10/23/20.
//

import Foundation

class LoginRepository {

    func authenticateUserWith(_ username:String, andPassword password:String) ->Bool {
        print("Username: \(username), password: \(password)")
        return username == "1111" && password == "2222"
    }
    
}
