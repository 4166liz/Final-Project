//
//  EditProfileViewController.swift
//  TalksBeauty
//
//  Created by sunny on 2017/10/17.
//  Copyright © 2017年 sunny. All rights reserved.
//

import UIKit

protocol EditProtocal {
    func save(name: String?, gender: String?)
}

class EditProfileViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var genderButton: UIButton!
    var gender: String?
    
    var delegate: EditProtocal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectGender(_ sender: Any) {
        let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            
        })
        
        let femaleAction = UIAlertAction(title: "Female", style: .default, handler: { action in
            self.gender = "Female"
            self.genderButton.setTitle(self.gender, for: .normal)
        })
        
        let maleAction = UIAlertAction(title: "Male", style: .default, handler: { action in
            self.gender = "Male"
            self.genderButton.setTitle(self.gender, for: .normal)
        })
        
        controller.addAction(femaleAction)
        controller.addAction(maleAction)
        controller.addAction(cancelAction)
        self.present(controller, animated: true, completion: {
            
        })
    }
    
    @IBAction func save(_ sender: Any) {
        if let d = delegate {
            d.save(name: textField.text, gender: gender)
        }
        self.dismiss(animated: true, completion: nil)
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
