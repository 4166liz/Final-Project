//
//  MyProfileViewController.swift
//  TalksBeauty
//
//  Created by sunny on 2017/10/17.
//  Copyright © 2017年 sunny. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, EditProtocal {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var genderImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        avatarImageView.layer.masksToBounds = true
//        avatarImageView.backgroundColor = UIColor.white
//        avatarImageView.layer.borderColor = UIColor.gray.cgColor
//        avatarImageView.layer.borderWidth = 1
//        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height / 2
        
        //nameLabel.text = "userName"
//
//        editProfileButton.setTitleColor(UIColor.fromRGB(0xFF1493), for: .normal)
//        editProfileButton.layer.borderWidth = 1
//        editProfileButton.layer.cornerRadius = 5
//        editProfileButton.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didLogoutBtnClicked(_ sender: Any) {
        self.tabBarController?.dismiss(animated: true, completion: nil);
        
    }
    @IBAction func cameraClicked(_ sender: Any) {
        let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            
        })
        
        let pickAction = UIAlertAction(title: "Pick a Photo", style: .default, handler: { action in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imgPicker = UIImagePickerController()
                imgPicker.delegate = self
                imgPicker.sourceType = .photoLibrary
                imgPicker.allowsEditing = true
                self.present(imgPicker, animated: true, completion: {
                    
                })
            }
        })
        
        let takeAction = UIAlertAction(title: "Take a Photo", style: .default, handler: { action in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imgPicker = UIImagePickerController()
                imgPicker.delegate = self
                imgPicker.sourceType = .camera
                imgPicker.allowsEditing = false
                self.present(imgPicker, animated: true, completion: {
                    
                })
            }
        })
        
        controller.addAction(pickAction)
        controller.addAction(takeAction)
        controller.addAction(cancelAction)
        self.present(controller, animated: true, completion: {
            
        })
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            avatarImageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: { _ in })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editProfile" {
            let controller = segue.destination as! UINavigationController
            let editController = controller.viewControllers.first as! EditProfileViewController
            editController.delegate = self
        }
    }
    
    func save(name: String?, gender: String?) {
        self.nameLabel.text = name
        if "Male" == gender {
            genderImageView.image = UIImage(named: "icon_male")
        } else if "Female" == gender {
            genderImageView.image = UIImage(named: "icon_female")
        }
    }
}
