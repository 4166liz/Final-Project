//
//  HomeViewController.swift
//  TalksBeauty
//
//  Created by AttackOnDobby on 2017/10/17.
//  Copyright © 2017年 sunny. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {
    
    @IBOutlet weak var bottomTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for item in bottomTabBar.items! {
            let unselectedItem: NSDictionary = [NSForegroundColorAttributeName: UIColor.gray, NSFontAttributeName: UIFont.systemFont(ofSize: 18)]
            let selectedItem: NSDictionary = [NSForegroundColorAttributeName: UIColor.brown, NSFontAttributeName: UIFont.systemFont(ofSize: 18)]
            item.setTitleTextAttributes(unselectedItem as? [String : AnyObject], for: .normal)
            item.setTitleTextAttributes(selectedItem as? [String : AnyObject], for: .selected)

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
