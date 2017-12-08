//
//  PersonalListTableViewController.swift
//  TalksBeauty
//
//  Created by sunny on 2017/11/14.
//  Copyright © 2017年 sunny. All rights reserved.
//

import UIKit
import Firebase

class PersonalListTableViewController: UITableViewController {

    var email: String?
    let ref = Database.database().reference()
    var dataArray = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = UIColor.white
        self.title = email;
        
        ref.child("posts")
            .queryOrdered(byChild: "email").queryEqual(toValue: email)
            .observe(.value, with: { (snapshot: DataSnapshot) in
                self.dataArray.removeAll()
                for item in snapshot.children {
                    let ele: DataSnapshot = item as! DataSnapshot
                    let snapshotValue = ele.value as! [String: AnyObject]
                    self.dataArray.append(snapshotValue)
                }
                print("query complete")
                self.tableView.reloadData()
            })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.dataArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personalCell", for: indexPath) as! PersonalTableViewCell
        
        // Configure the cell...
        let item = dataArray[indexPath.row]
        
        cell.setImage(image:item["image"] as! String , title: item["text"] as! String)
        
        return cell
    }

}
