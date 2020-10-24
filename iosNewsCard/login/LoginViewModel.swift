//
//  LoginViewModel.swift
//  iosNewsCard
//
//  Created by Rujun Yao on 10/23/20.
//

import Foundation

class LoginViewModel:NSObject {
    
    var repository: LoginRepository!
    
    typealias loginAuthCallback = (_ status:Bool, _ message:String) -> Void
    var loginCallBack:loginAuthCallback?
    
    init(repository: LoginRepository) {
        self.repository = repository
    }
    
    func checkLoginCredential(_ username:String, password:String) {
        if username.count == 0 || password.count == 0 {
            self.loginCallBack?(false, "Email or password should not be empty!")
        } else {
            authenticateUserWith(username, andPassword: password)
        }
    }
    
    fileprivate func authenticateUserWith(_ username:String, andPassword password:String) {
        if repository.authenticateUserWith(username, andPassword: password) {
            self.loginCallBack?(true, "User is Successfully Logged in")
        } else {
            self.loginCallBack?(false, "Please enter valid credentials")
        }
    }
    
    func loginCompletionListener(callBack: @escaping loginAuthCallback) {
        self.loginCallBack = callBack
    }
}
