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
    @IBOutlet weak var loginButton: UIButton!

    let fbLoginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        print(screenWidth)
        print(screenHeight)
        
        loginButton.backgroundColor = UIColor(red: 0/255, green: 172/255, blue: 237/255, alpha: 1.0)
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.blackColor().CGColor
        
        

        //add Facebook login button
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginButton(fbLoginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        // ...
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

