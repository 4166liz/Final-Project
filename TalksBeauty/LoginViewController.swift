//
//  LoginViewController.swift
//  TalksBeauty
//
//  Created by sunny on 02/10/2017.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    @IBAction func btnLogin_TouchUpInside(_ sender: Any) {
        
        if let name = txtUsername.text, let password = txtPassword.text
        {
            self.indicator.isHidden = false
            self.indicator.startAnimating()
            Auth.auth().signIn(withEmail: name, password: password) { (user, error) in
                // ...
                if user != nil {
                    GlobalInstance.sharedInstance.user = user
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "home")
                    self.present(vc!, animated: true, completion: nil)
                }
                else{
                    let alertController = UIAlertController(title: "Login Failed!", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
                        (result : UIAlertAction) -> Void in
                        print("OK")
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion:  nil)
                }
                self.indicator.stopAnimating()
            }
        }
    }
    
    override func touchesBegan(_ _touches: Set<UITouch>, with event: UIEvent?){
        txtUsername.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicator.hidesWhenStopped = true
        // test
//        Auth.auth().signIn(withEmail: "seh@gmail.com", password: "123456") { (user, error) in
//            // ...
//            if user != nil {
//                GlobalInstance.sharedInstance.user = user
//                let vc = self.storyboard?.instantiateViewController(withIdentifier: "home")
//                self.present(vc!, animated: true, completion: nil)
//            }
//        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

