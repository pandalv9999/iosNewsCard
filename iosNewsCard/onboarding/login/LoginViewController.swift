//
//  ViewController.swift
//  iosNewsCard
//
//  Created by Rujun Yao on 10/23/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginPlaceHolder: UIView!
    @IBOutlet weak var usernameEditText: UITextField!
    @IBOutlet weak var passwordEditText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    let themeRed:Int = 255
    let themeGreen:Int = 51
    let themeBlue:Int = 230
    
    let loginViewModel = LoginViewModel(repository:LoginRepository())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElement()
    }

    @IBAction func onLoginButtonClicked(_ sender: Any) {
        guard let username = self.usernameEditText.text else {return}
        guard let password = self.passwordEditText.text else {return}
        
        loginViewModel.loginValidationListener { [weak self] (status, message) in
            guard let self = self else {return}
            if status {
                self.errorLabel.text = "Logged in Successful!"
                self.errorLabel.alpha = 100
            } else {
                self.errorLabel.text = message
                self.errorLabel.alpha = 100
            }
        }
        
        loginViewModel.authenticationLoginListener { [weak self] (result, error) in
            guard let self = self else {return}
            if (error != nil) {
                self.errorLabel.text = error?.localizedDescription
                self.errorLabel.alpha = 100
            } else {
                self.errorLabel.text = "Logged in Successful!"
                self.errorLabel.alpha = 100
                print("ready to switch")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
            }
            
        }
        
        loginViewModel.checkLoginCredential(username, password: password)
    }
    
    func setUpElement() {
        errorLabel.alpha = 0
        loginPlaceHolder.layer.cornerRadius = 20

        Utilities.styleTextField(usernameEditText, red:themeRed, green: themeGreen, blue: themeBlue)
        Utilities.styleTextField(passwordEditText, red:themeRed, green: themeGreen, blue: themeBlue)
        Utilities.styleFilledButton(loginButton, red:themeRed, green: themeGreen, blue: themeBlue)
    }
    
}

