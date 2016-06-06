//
//  ViewController.swift
//  GreeksLink
//
//  Created by Kyle Woumn on 6/2/16.
//  Copyright © 2016 Kyle Woumn. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func CreateAccount(sender: AnyObject) {
        FIRAuth.auth()?.createUserWithEmail(Email.text!, password: Password.text!, completion: {
            user, error in

            if error != nil {
            } else {
                print("User created")

            }
        })
    }

    @IBAction func login(sender: AnyObject) {
        FIRAuth.auth()?.signInWithEmail(Email.text!, password: Password.text!, completion: {
            user, error in
            
            if error != nil {
                print("Incorrect!")
                print(self.Email.text!)
                print(self.Password.text!)
            } else {
                print("Huzzah!")
            }
        })
    }
}

