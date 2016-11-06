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
        button.readPermissions = ["public_profile", "email", "user_friends"]
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let reference = FIRDatabase.database().reference()
//        reference.child("newChild").setValue("blah blah blah")
//        reference.observeEventType(.ChildAdded, withBlock: { snapshot in
//            print("THIS IS WHAT IS IN THE DATABASE \(snapshot)")
//        })
        loginButton.backgroundColor = UIColor(red: 162/255, green: 33/255, blue: 23/255, alpha: 1.0)
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

