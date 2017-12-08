//
//  FollowTableViewController.swift
//  TalksBeauty
//
//  Created by sunny on 2017/11/13.
//  Copyright © 2017年 sunny. All rights reserved.
//

import UIKit
import Firebase

class FollowTableViewController: UITableViewController {
    let ref = Database.database().reference()
    var dataArray = [[String: Any]]()
    var followArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        
        ref.child("follow")
            .queryOrdered(byChild: "a").queryEqual(toValue: GlobalInstance.sharedInstance.user.email)
            .observeSingleEvent(of: .value, with: { (snapshot: DataSnapshot) in
                self.followArray.removeAll()
                for item in snapshot.children {
                    let ele: DataSnapshot = item as! DataSnapshot
                    let snapshotValue = ele.value as! [String: AnyObject]
                    self.followArray.append(snapshotValue["b"] as! String)
                }
                
                
                self.ref.child("posts")
                    .observeSingleEvent(of: .value, with: { (snapshot: DataSnapshot) in
                        self.dataArray.removeAll()
                        for item in snapshot.children {
                            let ele: DataSnapshot = item as! DataSnapshot
                            let snapshotValue = ele.value as! [String: AnyObject]
                            
                            if self.followArray.contains(snapshotValue["email"] as! String) {
                                self.dataArray.append(snapshotValue)
                            }
                        }
                        self.tableView.reloadData()
                    })
            })
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "followCell", for: indexPath) as! FollowTableViewCell
        
        let item = dataArray[indexPath.row]
        cell.load(email: item["email"] as! String, content: item["text"] as! String, image: item["image"] as! String)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
