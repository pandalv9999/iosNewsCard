//
//  LoginModel.swift
//  iosNewsCard
//
//  Created by Rujun Yao on 10/23/20.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth

class LoginRepository {
    
    
    let database: DatabaseReference!
    
    init() {
        database = Database.database().reference()
    }

    func authenticateUserWith(_ username:String, andPassword password:String, callBack: @escaping (_ result:AuthDataResult?, _ err:Error?) -> Void) {
        Auth.auth().signIn(withEmail: username, password: password, completion: callBack)
    }
    
}
