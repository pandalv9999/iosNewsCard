//
//  SignUpRepository.swift
//  iosNewsCard
//
//  Created by Rujun Yao on 10/23/20.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SignUpRepository {
    
    let database: DatabaseReference!
    
    init() {
        database = Database.database().reference()
    }
    
    func signUpUserWithCrenditials(username:String, email:String, password:String, callBack:@escaping (_ result:AuthDataResult?, _ err:Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password, completion: callBack)
    }
    
    func addUserToDatabase(username:String, email:String, password:String, callBack:@escaping (Error?, DatabaseReference) -> Void) {
        print(username, email, password)
        database.child("users").child(username).setValue(["username": username, "email": email, "password": password], withCompletionBlock: callBack)
    }
}
