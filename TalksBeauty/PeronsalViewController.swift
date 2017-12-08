//
//  PeronsalViewController.swift
//  TalksBeauty
//
//  Created by sunny on 2017/11/13.
//  Copyright © 2017年 sunny. All rights reserved.
//

import UIKit
import Firebase

class PeronsalViewController: UIViewController {

    var email: String?
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var viewPostsButton: UIButton!
    let ref = Database.database().reference()
    var hasFollow = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Personal Page"
        self.view.backgroundColor = UIColor.white
        self.emailLabel.text = email
        
        followButton.isHidden = true
        
        ref.child("follow")
            .queryOrdered(byChild: "a").queryEqual(toValue: GlobalInstance.sharedInstance.user.email)
            .observe(.value, with: { (snapshot: DataSnapshot) in
                self.followButton.isHidden = false
                for item in snapshot.children {
                    let ele: DataSnapshot = item as! DataSnapshot
                    let snapshotValue = ele.value as! [String: AnyObject]
                    if snapshotValue["b"] as? String == self.email {
                        self.followButton.setTitle("unfollow", for: .normal)
                        self.hasFollow = true
                        return
                    }
                }
                
                self.followButton.setTitle("follow", for: .normal)
                self.hasFollow = false
            })
    }
    
    @IBAction func followClicked(_ sender: Any) {
        if self.hasFollow {
            ref.child("follow")
                .queryOrdered(byChild: "a").queryEqual(toValue: GlobalInstance.sharedInstance.user.email)
                .observeSingleEvent(of: .value, with: { (snapshot: DataSnapshot) in
                    self.followButton.isHidden = false
                    for item in snapshot.children {
                        let ele: DataSnapshot = item as! DataSnapshot
                        let snapshotValue = ele.value as! [String: AnyObject]
                        if snapshotValue["b"] as? String == self.email {
                            self.ref.child("follow").child(ele.key).setValue(nil) { (error, ref) in
                                if error != nil {
                                    print("error: \(error!.localizedDescription)")
                                } else {
                                    self.hasFollow = false
                                    self.followButton.setTitle("follow", for: .normal)
                                }
                            }
                        }
                    }
                })
        } else {
            var follow = [String: Any]()
            follow["a"] = GlobalInstance.sharedInstance.user.email
            follow["b"] = self.email
            ref.child("follow").childByAutoId().setValue(follow) { (error, ref) in
                if error != nil {
                    print("error: \(error!.localizedDescription)")
                } else {
                    self.hasFollow = true
                    self.followButton.setTitle("unfollow", for: .normal)
                }
            }
        }
    }
    
    @IBAction func viewAllClicked(_ sender: Any) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "personalListViewController") as! PersonalListTableViewController
        viewController.email = email
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
