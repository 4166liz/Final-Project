//
//  WelcomeViewController.swift
//  TalksBeauty
//
//  Created by sunny on 02/10/2017.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblWeather: UILabel!
    @IBOutlet weak var btnSunny: UIButton!
    @IBOutlet weak var btnFroggy: UIButton!
    
    let weatherNodeRef = Database.database().reference().child("weatherCondition")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        weatherNodeRef.observe(.value) { (snapshot: DataSnapshot) in
            self.lblWeather.text = (snapshot.value as AnyObject).debugDescription
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnFroggy_touchUpInside(_ sender: Any) {
        weatherNodeRef.setValue("Froggy")
    }
    
    @IBAction func btnSunny_touchUpInside(_ sender: Any) {
        weatherNodeRef.setValue("Sunny")
    }



}
