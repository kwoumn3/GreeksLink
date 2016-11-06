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
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    @IBAction func registerUserByEmail(sender: AnyObject) {
        
        guard let firstName = firstNameTextField.text, lastName = lastNameTextField.text, email = emailTextField.text, password = passwordTextField.text else {
                print("Form is not valid")
                return
        }

        FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: {
            (user: FIRUser?, error) in

            if error != nil {
                print(error)
            }

            guard let uid = user?.uid else {
                return
            }

            let reference = FIRDatabase.database().reference()
            let usersReference = reference.child("users").child(uid)
            let values = ["firstname": firstName, "lastname": lastName, "email": email]
            usersReference.updateChildValues(values, withCompletionBlock: {
                (err, ref) in

                if err != nil {
                    print(err)
                    return
                }
            })


        })


    }

    
}
