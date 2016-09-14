//
//  RegistrationController.swift
//  GreeksLink
//
//  Created by Kyle Woumn on 9/13/16.
//  Copyright © 2016 Kyle Woumn. All rights reserved.
//

import UIKit
import Firebase

class RegistrationController: UIViewController {
    
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var confirmPassword: UITextField!
    
    
    @IBAction func registerUserByEmail(sender: AnyObject) {
        FIRAuth.auth()?.createUserWithEmail(email.text!, password: password.text!, completion: {
            user, error in
            if error != nil {
            } else {
                print("User created")
            }
        })
    }
    
    
}
