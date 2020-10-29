//
//  SignUpViewModel.swift
//  iosNewsCard
//
//  Created by Rujun Yao on 10/23/20.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class SignUpViewModel {
    var repository: SignUpRepository!
    
    typealias SignUpAuthCallBack = (_ result:AuthDataResult?, _ err:Error?) -> Void
    typealias ValidateFieldCallBack = (_ status:Bool, _ error:String) -> Void
    typealias DatabaseModificationCallBack = (Error?, DatabaseReference) -> Void
    var signUpCallBack:SignUpAuthCallBack?
    var validateCallBack:ValidateFieldCallBack?
    var databaseModificationCallBack:DatabaseModificationCallBack?
    
    init(repository: SignUpRepository) {
        self.repository = repository
    }
    
    func checkLoginCredential(username:String, email:String, password:String, comfirmedPassword:String) {
        if let errMsg = validateField(username:username, email:email, password:password, comfirmedPassword:comfirmedPassword) {
            self.validateCallBack?(false, errMsg)
        } else {
            repository.signUpUserWithCrenditials(username:username, email:email, password:password, callBack:signUpCallBack!)
        }
    }
    
    func addUserToDatabase(username:String, email:String, password:String) {
        repository.addUserToDatabase(username:username, email:email, password:password, callBack: databaseModificationCallBack!)
    }
    
    func validateField(username:String, email:String, password:String, comfirmedPassword:String) -> String? {
        if username.count == 0 || password.count == 0 || email.count == 0 {
            return "Please fill in all field"
        } else if !Utilities.isPasswordValid(password) {
           return "Please enter a valid password"
        } else if (password != comfirmedPassword) {
            return "Comfirmed password did not match"
        } else {
            return nil
        }
    }

    func signUpCompletionListener(callBack: @escaping SignUpAuthCallBack) {
        self.signUpCallBack = callBack
    }
    
    func credentialValidationListener(callBack: @escaping ValidateFieldCallBack) {
        self.validateCallBack = callBack
    }
    
    func databaseModificationListener(callBack: @escaping DatabaseModificationCallBack) {
        self.databaseModificationCallBack = callBack
    }
}
