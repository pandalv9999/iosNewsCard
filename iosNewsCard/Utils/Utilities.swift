//
//  Utilities.swift
//  customauth
//
//  Created by Christopher Ching on 2019-05-09.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField, red:Int, green:Int, blue:Int) {
//
//        // Create the bottom line
//        let bottomLine = CALayer()
//
//        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
//
//        bottomLine.backgroundColor = UIColor.init(red:  CGFloat(red/255), green:CGFloat(green/255), blue:CGFloat(blue/255), alpha: 1).cgColor
//
//        // Remove border on text field
//        textfield.borderStyle = .none
//
//        // Add the line to the text field
//        textfield.layer.addSublayer(bottomLine)
//
        textfield.layer.cornerRadius = 20.0
        textfield.tintColor = UIColor.init(red:  CGFloat(red/255), green:CGFloat(green/255), blue:CGFloat(blue/255), alpha: 1)
        
    }
    
    static func styleFilledButton(_ button:UIButton, red:Int, green:Int, blue:Int) {
        
        // Filled rounded corner style
        // button.backgroundColor = UIColor.init(red: CGFloat(red/255), green:CGFloat(green/255), blue:CGFloat(blue/255), alpha: 1)
        button.layer.cornerRadius = 20.0

    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
//        return passwordTest.evaluate(with: password)
        return true // for test purpose
    }
    
}
