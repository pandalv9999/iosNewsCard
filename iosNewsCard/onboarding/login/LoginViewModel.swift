//
//  LoginViewModel.swift
//  iosNewsCard
//
//  Created by Rujun Yao on 10/23/20.
//

import Foundation
import FirebaseAuth

class LoginViewModel:NSObject {
    
    var repository: LoginRepository!
    
    typealias LoginValidateCallBack = (_ status:Bool, _ message:String) -> Void
    typealias AuthenticationLoginCallBack = (_ result:AuthDataResult?, _ err:Error?) -> Void
    var loginValidateCallBack:LoginValidateCallBack?
    var authenticationLoginCallBack:AuthenticationLoginCallBack?
    
    init(repository: LoginRepository) {
        self.repository = repository
    }
    
    func checkLoginCredential(_ username:String, password:String) {
        if username.count == 0 || password.count == 0 {
            self.loginValidateCallBack?(false, "Email or password should not be empty!")
        } else {
            repository.authenticateUserWith(username, andPassword: password, callBack: authenticationLoginCallBack!)
        }
    }
    
    func loginValidationListener(callBack: @escaping LoginValidateCallBack) {
        self.loginValidateCallBack = callBack
    }
    
    func authenticationLoginListener(callBack: @escaping AuthenticationLoginCallBack) {
        self.authenticationLoginCallBack = callBack
    }
}
