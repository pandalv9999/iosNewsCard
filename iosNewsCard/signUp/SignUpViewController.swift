//
//  SignUpViewController.swift
//  iosNewsCard
//
//  Created by Rujun Yao on 10/23/20.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpPlaceHolder: UIView!
    @IBOutlet weak var usernameTextEdit: UITextField!
    @IBOutlet weak var emailTextEdit: UITextField!
    @IBOutlet weak var passwordTextEdit: UITextField!
    @IBOutlet weak var comfirmPasswordTextEdit: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    let themeRed:Int = 50
    let themeGreen:Int = 51
    let themeBlue:Int = 255
    
    let signUpViewModel:SignUpViewModel = SignUpViewModel(repository: SignUpRepository())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElement()
        
        
    }
    
    @IBAction func onSignUpCButtonClicked(_ sender: Any) {
        
        guard let username = self.usernameTextEdit.text else {return}
        guard let email = self.emailTextEdit.text else {return}
        guard let password = self.passwordTextEdit.text else {return}
        guard let comfirmedPassword = self.comfirmPasswordTextEdit.text else {return}
            
        signUpViewModel.signUpCompletionListener { [weak self] (result, error) in
            guard let self = self else {return}
            if (error != nil) {
                self.errorLabel.text = error?.localizedDescription
                self.errorLabel.alpha = 100
            } else {
                self.signUpViewModel.addUserToDatabase(username: username, email: email, password: password)
            }
        }
        
        signUpViewModel.credentialValidationListener { [weak self] (status, message) in
            guard let self = self else {return}
            if status {
                self.errorLabel.text = message
                self.errorLabel.alpha = 100
            } else {
                self.errorLabel.text = message
                self.errorLabel.alpha = 100
                
            }
            
        }
        
        signUpViewModel.databaseModificationListener { [weak self] (error, ref) in
            guard let self = self else {return}
            if let error = error {
                self.errorLabel.text = error.localizedDescription
                self.errorLabel.alpha = 100
            } else {
                self.errorLabel.text = "Register Success!"
                self.errorLabel.alpha = 100
            }
        }
        
        signUpViewModel.checkLoginCredential(username: username, email: email, password: password, comfirmedPassword: comfirmedPassword)
    }

    func setUpElement() {
        signUpPlaceHolder.layer.cornerRadius = 20.0
        errorLabel.alpha = 0
        
        Utilities.styleTextField(usernameTextEdit, red:themeRed, green: themeGreen, blue: themeBlue)
        Utilities.styleTextField(emailTextEdit, red:themeRed, green: themeGreen, blue: themeBlue)
        Utilities.styleTextField(passwordTextEdit, red:themeRed, green: themeGreen, blue: themeBlue)
        Utilities.styleTextField(comfirmPasswordTextEdit, red:themeRed, green: themeGreen, blue: themeBlue)
        Utilities.styleFilledButton(signUpButton, red:themeRed, green: themeGreen, blue: themeBlue)
        
    }

}
